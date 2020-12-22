#ifndef LINEARALGEBRA_SRC_MOLPRO_LINALG_ITSOLV_SOLVERFACTORY_H
#define LINEARALGEBRA_SRC_MOLPRO_LINALG_ITSOLV_SOLVERFACTORY_H
#include <memory>

#include <molpro/linalg/itsolv/ArrayHandlers.h>
#include <molpro/linalg/itsolv/IterativeSolver.h>
#include <molpro/linalg/itsolv/options_map.h>
#include <molpro/linalg/itsolv/NonLinearEquationsOptionsDIIS.h>

namespace molpro::linalg::itsolv {
/*!
 * @brief Factory for creating instances of specific solver implementations from the corresponding Options object
 * @note The factory has to be instantiated for specific R,Q and P vector types
 *
 * Instantiating the factory
 * -------------------------
 * Assuming user defined containers are declared in ``UserDefinedVectors.h`` than the user can include the following
 * explicit instantiation for the factory in a `.cpp` file,
 *
 * @code{cpp}
 * // "solver_factory_instantiation.cpp"
 * #include <molpro/linalg/itsolv/SolverFactory-implementation.h>
 * #include "UserDefinedVectors.h"
 *
 * namespace molpro::linalg::itsolv {
 * template class SolverFactory<UserDefinedRvector, UserDefinedQvector, UserDefinedPvector>;
 * }
 * @endcode
 *
 * Using the factory
 * -----------------
 * @code{cpp}
 * #include <molpro/linalg/itsolv/SolverFactory.h>
 * #include "UserDefinedVectors.h"
 * #include "read_user_options.h"
 * using molpro::linalg::itsolv;
 * using R = UserDefinedRVector;
 * using Q = UserDefinedQVector;
 * using P = UserDefinedPVector;
 *
 * int main(int argn, char** argv){
 *      std::shared_ptr<Options> options = read_user_options_general(argn, argv);
 *      auto handlers = std::make_shared<ArrayHandlers<R, Q, P>>();
 *      auto factory = SolverFactory<R, Q, P>{};
 *
 *      std::shared_ptr<IterativeSolver> solver = factory.create(*options, handlers);
 *      solver->solve();
 *
 *      // Or, if a specific solver type is needed
 *      std::shared_ptr<ILinearEigensystemOptions> eigen_options = read_user_options_eigen(argn, argv);
 *      std::shared_ptr<ILinearEigensystem> eigen_solver = factory.create(*eigen_options, handlers);
 *      eigen_solver.solve();
 *      user_defined_print(eigen_solver.eigenvalues());
 * }
 * @endcode
 *
 */
template <class R, class Q, class P = std::map<size_t, typename R::value_type>>
class SolverFactory {
public:
  virtual ~SolverFactory() = default;
  virtual std::shared_ptr<IterativeSolver<R, Q, P>> create(const Options& options,
                                                           const std::shared_ptr<ArrayHandlers<R, Q, P>>& handlers);

  virtual std::shared_ptr<ILinearEigensystem<R, Q, P>>
  create(const ILinearEigensystemOptions& options,
         const std::shared_ptr<ArrayHandlers<R, Q, P>>& handlers =
             std::make_shared<molpro::linalg::itsolv::ArrayHandlers<R, Q, P>>());

  virtual std::shared_ptr<ILinearEquations<R, Q, P>>
  create(const ILinearEquationsOptions& options,
         const std::shared_ptr<ArrayHandlers<R, Q, P>>& handlers =
             std::make_shared<molpro::linalg::itsolv::ArrayHandlers<R, Q, P>>());

  virtual std::shared_ptr<INonLinearEquations<R, Q, P>>
  create(const INonLinearEquationsOptions& options = INonLinearEquationsOptions{},
         const std::shared_ptr<ArrayHandlers<R, Q, P>>& handlers =
             std::make_shared<molpro::linalg::itsolv::ArrayHandlers<R, Q, P>>());

  virtual std::shared_ptr<IOptimize<R, Q, P>>
  create(const IOptimizeOptions& options = IOptimizeOptions{},
         const std::shared_ptr<ArrayHandlers<R, Q, P>>& handlers =
             std::make_shared<molpro::linalg::itsolv::ArrayHandlers<R, Q, P>>());

  virtual std::shared_ptr<IterativeSolver<R, Q, P>>
  create(const std::string& method, const options_map& options,
         const std::shared_ptr<ArrayHandlers<R, Q, P>>& handlers =
             std::make_shared<molpro::linalg::itsolv::ArrayHandlers<R, Q, P>>());
};

template <class R, class Q, class P = std::map<size_t, typename R::value_type>>
std::shared_ptr<ILinearEigensystem<R, Q, P>>
create_LinearEigensystem(const ILinearEigensystemOptions& options,
                         const std::shared_ptr<ArrayHandlers<R, Q, P>>& handlers =
                             std::make_shared<molpro::linalg::itsolv::ArrayHandlers<R, Q, P>>()) {
  return SolverFactory<R, Q, P>{}.create(options, handlers);
}

template <class R, class Q, class P = std::map<size_t, typename R::value_type>>
std::shared_ptr<ILinearEquations<R, Q, P>>
create_LinearEquations(const ILinearEquationsOptions& options,
                       const std::shared_ptr<ArrayHandlers<R, Q, P>>& handlers =
                           std::make_shared<molpro::linalg::itsolv::ArrayHandlers<R, Q, P>>()) {
  return SolverFactory<R, Q, P>{}.create(options, handlers);
}

template <class R, class Q, class P = std::map<size_t, typename R::value_type>>
std::shared_ptr<INonLinearEquations<R, Q, P>>
create_NonLinearEquations(const INonLinearEquationsOptions& options = INonLinearEquationsOptions{},
                          const std::shared_ptr<ArrayHandlers<R, Q, P>>& handlers =
                              std::make_shared<molpro::linalg::itsolv::ArrayHandlers<R, Q, P>>()) {
  return SolverFactory<R, Q, P>{}.create(options, handlers);
}

inline std::map<std::string, std::string> splitstring(std::string const& s) {
  std::map<std::string, std::string> m;

  std::string::size_type key_pos = 0;
  std::string::size_type key_end;
  std::string::size_type val_pos;
  std::string::size_type val_end;

  while ((key_end = s.find(',', key_pos)) != std::string::npos) {
    if ((val_pos = s.find_first_not_of(": ", key_end)) == std::string::npos)
      break;

    val_end = s.find('\n', val_pos);
    m.emplace(s.substr(key_pos, key_end - key_pos), s.substr(val_pos, val_end - val_pos));

    key_pos = val_end;
    if (key_pos != std::string::npos)
      ++key_pos;
  }

  return m;
}

template <class R, class Q, class P = std::map<size_t, typename R::value_type>>
std::shared_ptr<INonLinearEquations<R, Q, P>>
create_NonLinearEquations(const std::string& method, const std::string& options,
                          const std::shared_ptr<ArrayHandlers<R, Q, P>>& handlers =
                              std::make_shared<molpro::linalg::itsolv::ArrayHandlers<R, Q, P>>()) {
  options_map optionsmap=splitstring(options);
  if (method == "DIIS")
  return SolverFactory<R, Q, P>{}.create( NonLinearEquationsOptionsDIIS{optionsmap}, handlers);
}

} // namespace molpro::linalg::itsolv
#endif // LINEARALGEBRA_SRC_MOLPRO_LINALG_ITSOLV_SOLVERFACTORY_H
