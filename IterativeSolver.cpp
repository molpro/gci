#include "IterativeSolver.h"
#include "PagedVector.h"

// C interface to IterativeSolver
namespace LinearAlgebra {
using v = PagedVector<double>;

static std::unique_ptr<LinearEigensystem<double> > instance;

extern "C" void IterativeSolverLinearEigensystemInitialize(size_t nQ, size_t nP, size_t nroot, double* PP) {
 instance.reset(new LinearEigensystem<double>());
 instance->m_dimension=nQ;
 instance->m_roots=nroot;
}
extern "C" void IterativeSolverLinearEigensystemInterpolate(double* c, double* g, double* eigenvalue) {
 vectorSet<double> cc,gg;
 for (int root=0; root < instance->m_roots; root++) {
  cc.push_back(std::shared_ptr<v>(new v(instance->m_dimension)));
  cc.back()->put(&c[root*instance->m_dimension],instance->m_dimension,0);
  gg.push_back(std::shared_ptr<v>(new v(instance->m_dimension)));
  gg.back()->put(&g[root*instance->m_dimension],instance->m_dimension,0);
 }
 instance->addVector(cc,gg);
 for (int root=0; root < instance->m_roots; root++) {
  cc[root]->get(&c[root*instance->m_dimension],instance->m_dimension,0);
  gg[root]->get(&g[root*instance->m_dimension],instance->m_dimension,0);
  eigenvalue[root] = instance->eigenvalues()[root];
 }
}

extern "C" int IterativeSolverLinearEigensystemFinalize(double* c, double* g, double* error) {
 vectorSet<double> cc,gg;
 for (int root=0; root < instance->m_roots; root++) {
  cc.push_back(std::shared_ptr<v>(new v(instance->m_dimension)));
  cc.back()->put(&c[root*instance->m_dimension],instance->m_dimension,0);
  gg.push_back(std::shared_ptr<v>(new v(instance->m_dimension)));
  gg.back()->put(&g[root*instance->m_dimension],instance->m_dimension,0);
 }
 bool result = instance->endIteration(cc,gg);
 for (int root=0; root < instance->m_roots; root++) {
  cc[root]->get(&c[root*instance->m_dimension],instance->m_dimension,0);
  error[root] = instance->errors()[root];
 }
 return result;
}

}

