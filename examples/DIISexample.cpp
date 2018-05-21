//#include "IterativeSolver.h"
//#include "IterativeSolver/PagedParameterVector.h"
//#include "IterativeSolver/SimpleParameterVector.h"

//using namespace LinearAlgebra;

////  typedef SimpleParameterVector pv;
//typedef PagedParameterVector pv;

//static double alpha;
//static double anharmonicity;
//static double n;

//struct : IterativeSolverBase::ParameterSetTransformation {
//  void operator()(const ParameterVectorSet & psx, ParameterVectorSet & outputs, std::vector<ParameterScalar> shift=std::vector<ParameterScalar>(), bool append=false) const override {
//    std::vector<ParameterScalar> psxk(n);
//    std::vector<ParameterScalar> output(n);
//    psx.front()->get(&(psxk[0]),n,0);
//    if (append)
//      outputs.front()->get(&(output[0]),n,0);
//    else
//      outputs.front()->zero();
//    for (size_t i=0; i<n; i++) {
//        output[i] += (alpha*(i+1)+anharmonicity*psxk[i])*psxk[i];
//        for (size_t j=0; j<n; j++)
//          output[i] += (i+j)*psxk[j];
//      }
//    outputs.front()->put(&output[0],n,0);
//  }
//} _anharmonic_residual;
//struct : IterativeSolverBase::ParameterSetTransformation {
//  void operator()(const ParameterVectorSet & psg, ParameterVectorSet & psc, std::vector<ParameterScalar> shift=std::vector<ParameterScalar>(), bool append=false) const override {
//    std::vector<ParameterScalar> psck(n);
//    std::vector<ParameterScalar> psgk(n);
//    psg.front()->get(&psgk[0],n,0);
//    if (append) {
//        psc.front()->get(&psck[0],n,0);
//        for (size_t i=0; i<n; i++)
//          psck[i] -= psgk[i]/(alpha*(i+1));
//      } else {
//        for (size_t i=0; i<n; i++)
//          psck[i] =- psgk[i]/(alpha*(i+1));
//      }
//    psc.front()->put(&psck[0],n,0);
//  }
//} _anharmonic_preconditioner;

int main(int argc, char *argv[])
{
//  alpha=1;
//  n=100;
//  anharmonicity=.5;
//  DIIS solver(_anharmonic_residual,_anharmonic_preconditioner);
//  solver.m_verbosity=1;
//  ParameterVectorSet g;
//  ParameterVectorSet x;
//  g.push_back(std::make_shared<pv>(n));
//  x.push_back(std::make_shared<pv>(n));
//  x.back()->zero(); double one=1; x.back()->put(&one,1,0);  // initial guess
//  if (not solver.solve(g,x)) std::cout << "Failure"<<std::endl;
//  std::cout << "Distance of solution from origin: "<<std::sqrt(x[0]->dot(x[0]))<<std::endl;
//  std::cout << "Error="<<solver.errors().front()<<" after "<<solver.iterations()<<" iterations"<<std::endl;
}
