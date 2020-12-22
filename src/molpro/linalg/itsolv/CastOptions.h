#ifndef LINEARALGEBRA_SRC_MOLPRO_LINALG_ITSOLV_CASTOPTIONS_H
#define LINEARALGEBRA_SRC_MOLPRO_LINALG_ITSOLV_CASTOPTIONS_H
#include <memory>
#include <molpro/linalg/itsolv/IterativeSolver.h>
#include <molpro/linalg/itsolv/LinearEigensystemOptions.h>
#include <molpro/linalg/itsolv/LinearEquationsOptions.h>
#include <molpro/linalg/itsolv/NonLinearEquationsOptionsDIIS.h>
#include <molpro/linalg/itsolv/OptimizeOptionsBFGS.h>
#include <stdexcept>

namespace molpro::linalg::itsolv {
//! Safely down-cast Options to one of the implementations
struct CastOptions {
private:
  template <class OptionsType>
  static std::shared_ptr<OptionsType> cast(const std::shared_ptr<Options>& options,
                                           const std::string& options_type_name) {
    auto lin_eig_options = std::shared_ptr<OptionsType>{};
    if (options) {
      lin_eig_options = std::dynamic_pointer_cast<OptionsType>(options);
      if (!lin_eig_options)
        throw std::runtime_error("Failed to cast Options to " + options_type_name);
    }
    return lin_eig_options;
  }

  template <class OptionsType>
  static const OptionsType& cast(const Options& options, const std::string& options_type_name) {
    try {
      return dynamic_cast<const OptionsType&>(options);
    } catch (std::bad_cast& err) {
      throw std::runtime_error("Failed to cast Options to " + options_type_name);
    }
  }

public:
  static std::shared_ptr<LinearEigensystemOptions> LinearEigensystem(const std::shared_ptr<Options>& options) {
    return cast<LinearEigensystemOptions>(options, "LinearEigensystemOptions");
  }
  static const LinearEigensystemOptions& LinearEigensystem(const Options& options) {
    return cast<LinearEigensystemOptions>(options, "LinearEigensystemOptions");
  }
  static LinearEigensystemOptions& LinearEigensystem(Options& options) {
    const auto& opt = const_cast<const Options&>(options);
    return const_cast<LinearEigensystemOptions&>(cast<LinearEigensystemOptions>(options, "LinearEigensystemOptions"));
  }

  static std::shared_ptr<LinearEquationsOptions> LinearEquations(const std::shared_ptr<Options>& options) {
    return cast<LinearEquationsOptions>(options, "LinearEquationsOptions");
  }
  static const LinearEquationsOptions& LinearEquations(const Options& options) {
    return cast<LinearEquationsOptions>(options, "LinearEquationsOptions");
  }
  static LinearEquationsOptions& LinearEquations(Options& options) {
    const auto& opt = const_cast<const Options&>(options);
    return const_cast<LinearEquationsOptions&>(cast<LinearEquationsOptions>(options, "LinearEquationsOptions"));
  }

  static std::shared_ptr<NonLinearEquationsOptionsDIIS> NonLinearEquations(const std::shared_ptr<Options>& options) {
    return cast<NonLinearEquationsOptionsDIIS>(options, "NonLinearEquationsOptions");
  }
  static const NonLinearEquationsOptionsDIIS& NonLinearEquations(const Options& options) {
    return cast<NonLinearEquationsOptionsDIIS>(options, "NonLinearEquationsOptions");
  }
  static NonLinearEquationsOptionsDIIS& NonLinearEquations(Options& options) {
    const auto& opt = const_cast<const Options&>(options);
    return const_cast<NonLinearEquationsOptionsDIIS&>(cast<NonLinearEquationsOptionsDIIS>(options, "NonLinearEquationsOptions"));
  }


  static std::shared_ptr<OptimizeOptionsBFGS> Optimize(const std::shared_ptr<Options>& options) {
    return cast<OptimizeOptionsBFGS>(options, "OptimizeOptions");
  }
  static const OptimizeOptionsBFGS& Optimize(const Options& options) {
    return cast<OptimizeOptionsBFGS>(options, "OptimizeOptions");
  }
  static OptimizeOptionsBFGS& Optimize(Options& options) {
    const auto& opt = const_cast<const Options&>(options);
    return const_cast<OptimizeOptionsBFGS&>(cast<OptimizeOptionsBFGS>(options, "OptimizeOptions"));
  }
};
} // namespace molpro::linalg::itsolv

#endif // LINEARALGEBRA_SRC_MOLPRO_LINALG_ITSOLV_CASTOPTIONS_H
