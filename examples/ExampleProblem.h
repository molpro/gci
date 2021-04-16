#ifndef LINEARALGEBRA_EXAMPLES_EXAMPLEPROBLEM_H_
#define LINEARALGEBRA_EXAMPLES_EXAMPLEPROBLEM_H_
#include <molpro/linalg/itsolv/IterativeSolver.h>
#include <vector>

class ExampleProblem : public molpro::linalg::itsolv::Problem<std::vector<double>> {
protected:
  double matrix(int i, int j) const { return i == j ? i + 1 : 0.001 * ((i + j)%n); }

public:
  using Problem::container_t;
  using Problem::value_t;
  const size_t n;
  ExampleProblem(int n = 10) : n(n) {}

  void precondition(const VecRef<container_t> &action,
                    const std::vector<value_t> &shift) const override {
    for (int k = 0; k < action.size(); k++) {
      auto &a = action[k].get();
      for (int i = 0; i < a.size(); i++)
        a[i] /= (matrix(i, i) - shift[k] + 1e-15);
    }
  }

  value_t residual(const container_t &v, container_t &a) const override {
    value_t value = 0;
    for (int i = 0; i < a.size(); i++) {
      a[i] = 0;
      for (int j = 0; j < a.size(); j++)
        a[i] += matrix(i, j) * (v[j] - 1);
      value += 0.5 * a[i] * (v[i] - 1);
    }
    return value;
  }

  void action(const CVecRef<container_t> &parameters, const VecRef<container_t> &actions) const override {
    for (size_t k = 0; k < parameters.size(); k++) {
      const auto &v = parameters[k].get();
      auto &a = actions[k].get();
      for (int i = 0; i < a.size(); i++) {
        a[i] = 0;
        for (int j = 0; j < a.size(); j++)
          a[i] += matrix(i, j) * v[j];
      }
    }
  }
  friend
  std::ostream& operator<<(std::ostream& s, const ExampleProblem& problem) ;
};
std::ostream& operator<<(std::ostream& s, const ExampleProblem& problem) {
  s<<"ExampleProblem: matrix";
  for (int i=0;i<problem.n;i++) {
    s<<"\n"<<i;
    for(int j=0;j<problem.n;j++)s<<" "<<problem.matrix(i,j);
  }
  return s;
}
#endif // LINEARALGEBRA_EXAMPLES_EXAMPLEPROBLEM_H_
