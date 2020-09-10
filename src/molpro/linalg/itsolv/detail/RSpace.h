#ifndef LINEARALGEBRA_SRC_MOLPRO_LINALG_ITSOLV_RSPACE_H
#define LINEARALGEBRA_SRC_MOLPRO_LINALG_ITSOLV_RSPACE_H
#include <molpro/linalg/itsolv/IterativeSolver.h>
#include <molpro/linalg/itsolv/detail/SubspaceData.h>

namespace molpro {
namespace linalg {
namespace itsolv {
namespace detail {

template <class R, class Q, class P>
void update_rspace(SubspaceData& rs, const std::vector<R>& parameters, const std::vector<R>& action);

template <class R, class Q, class P>
void update_rspace_rhs(SubspaceData& rs, const std::vector<R>& parameters, const std::vector<R>& action,
                       LinearEigensystem<R, Q, P>& solver);

//!
template <class R>
class RSpace {
public:
  SubspaceData subspace = null_data<EqnData::H, EqnData::S>();

  template <class Q, class P>
  void update(const std::vector<R>& parameters, const std::vector<R>& action, IterativeSolver<R, Q, P>& solver) {
    detail::update_rspace(subspace, parameters, action);
  }

protected:
};

//! RSpace for LinearEquations solver
template <class R>
class RSpaceLEq : public RSpace<R> {
public:
  using RSpace<R>::subspace;
  RSpaceLEq() : RSpace<R>() { subspace = null_data<EqnData::H, EqnData::S, EqnData::rhs>; }

  template <class Q, class P>
  void update(const std::vector<R>& parameters, const std::vector<R>& action, LinearEquations<R, Q, P>& solver) {
    RSpace<R>::update_rspace(subspace, parameters, action, solver);
    // now update RHS vector
  }
};

} // namespace detail
} // namespace itsolv
} // namespace linalg
} // namespace molpro

#endif // LINEARALGEBRA_SRC_MOLPRO_LINALG_ITSOLV_RSPACE_H
