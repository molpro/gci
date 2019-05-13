#include "IterativeSolver.h"
#include "PagedVector.h"
#include <regex>


//  typedef SimpleParameterVector pv;
using scalar = double;
using pv = LinearAlgebra::PagedVector<scalar>;

static double alpha;
static double anharmonicity;
static double n;

scalar anharmonic_residual(const pv& psx, pv& outputs) {
  std::vector<scalar> psxk(n);
  std::vector<scalar> output(n);
  psx.get(psxk.data(), n, 0);
  scalar value = 0;
  for (size_t i = 0; i < n; i++) {
    value += (alpha * (i + 1) / scalar(2) + anharmonicity * (psxk[i] - 1) / scalar(3)) * (psxk[i] - 1) * (psxk[i] - 1);
    output[i] = (alpha * (i + 1) + anharmonicity * (psxk[i] - 1)) * (psxk[i] - 1);
    for (size_t j = 0; j < n; j++)
      output[i] += (i + j) * (psxk[j] - 1);
  }
  outputs.put(output.data(), n, 0);
  return value;
}

void update(pv& psc, const pv& psg) {
  std::vector<scalar> psck(n);
  std::vector<scalar> psgk(n);
  psg.get(psgk.data(), n, 0);
  psc.get(psck.data(), n, 0);
  for (size_t i = 0; i < n; i++)
    psck[i] -= psgk[i] / (2 * i + alpha * (i + 1));
  psc.put(psck.data(), n, 0);
}

int main(int argc, char* argv[]) {
  alpha = 7;
  n = 100;
  n = 5;
  anharmonicity = 0.2;
  for (const auto& method : std::vector<std::string>{"null", "L-BFGS"}) {
    std::cout << "optimize with " << method << std::endl;
    IterativeSolver::Optimize<pv> solver(std::regex_replace(method, std::regex("-iterate"), ""));
    solver.m_verbosity = 1;
    solver.m_maxIterations = 50;
    pv g(n);
    pv x(n);
    pv hg(n);
    scalar one = 1;
    for (auto i = 0; i < n; i++) x.put(&one, 1, i);
    scalar zero = 0;
    x.put(&zero, 1, 0);  // initial guess
    for (size_t iter = 0; iter < solver.m_maxIterations; ++iter) {
      auto value = anharmonic_residual(x, g);
      if (solver.addValue(x, value, g))
        update(x, g);
      if (solver.endIteration(x, g)) break;
    }
    std::cout << "Distance of solution from origin: " << std::sqrt(x.dot(x)) << std::endl;
    std::cout << "Error=" << solver.errors().front() << " after " << solver.iterations() << " iterations" << std::endl;
  }
}