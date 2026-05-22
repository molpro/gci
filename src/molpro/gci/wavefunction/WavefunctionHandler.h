#ifndef GCI_SRC_MOLPRO_GCI_WAVEFUNCTION_WAVEFUNCTIONHANDLER_H
#define GCI_SRC_MOLPRO_GCI_WAVEFUNCTION_WAVEFUNCTIONHANDLER_H
#include <molpro/linalg/array/ArrayHandler.h>
#include <molpro/linalg/itsolv/subspace/Matrix.h>
#include <molpro/linalg/itsolv/wrap.h>
#include <molpro/linalg/array/util/gemm.h>

#include <map>

namespace molpro {
namespace gci {
namespace wavefunction {

template <class AL, class AR>
class WavefunctionHandler : public linalg::array::ArrayHandler<AL, AR> {
public:
  using typename linalg::array::ArrayHandler<AL, AR>::value_type_L;
  using typename linalg::array::ArrayHandler<AL, AR>::value_type_R;
  using typename linalg::array::ArrayHandler<AL, AR>::value_type;
  using typename linalg::array::ArrayHandler<AL, AR>::value_type_abs;
  using typename linalg::array::ArrayHandler<AL, AR>::ProxyHandle;

  ProxyHandle lazy_handle() override { return this->lazy_handle(*this); };

  using linalg::array::ArrayHandler<AL, AR>::lazy_handle;

  AL copy(const AR &source) override { return AL{source}; };

  void copy(AL &x, const AR &y) override { x = y; };

  void scal(value_type alpha, AL &x) override { x.scal(alpha); }

  void fill(value_type alpha, AL &x) override { x.fill(alpha); }

  void axpy(value_type alpha, const AR &x, AL &y) override { y.axpy(alpha, x); }

  value_type dot(const AL &x, const AR &y) override { return x.dot(y); }

  void gemm_outer(const molpro::linalg::itsolv::subspace::Matrix<value_type> alphas, const molpro::linalg::itsolv::CVecRef<AR> &xx, const molpro::linalg::itsolv::VecRef<AL> &yy) override {
    molpro::linalg::array::util::gemm_outer_default(*this, alphas, xx, yy);
  }

  molpro::linalg::itsolv::subspace::Matrix<value_type> gemm_inner(const molpro::linalg::itsolv::CVecRef<AL> &xx, const molpro::linalg::itsolv::CVecRef<AR> &yy) override {
    return molpro::linalg::array::util::gemm_inner_default(*this, xx, yy);
  }

  std::map<size_t, value_type_abs> select_max_dot(size_t n, const AL &x, const AR &y) override {
    return x.distr_buffer->select_max_dot(n, *y.distr_buffer);
  }

  std::map<size_t, value_type> select(size_t n, const AL &x, bool max = false, bool ignore_sign = false) override {
    return x.distr_buffer->select(n, max, ignore_sign);
  }

protected:
  using linalg::array::ArrayHandler<AL, AR>::error;
};

template <class AL, class AR>
class WavefunctionHandlerSparse : public linalg::array::ArrayHandler<AL, AR> {
public:
  using typename linalg::array::ArrayHandler<AL, AR>::value_type_L;
  using typename linalg::array::ArrayHandler<AL, AR>::value_type_R;
  using typename linalg::array::ArrayHandler<AL, AR>::value_type;
  using typename linalg::array::ArrayHandler<AL, AR>::value_type_abs;
  using typename linalg::array::ArrayHandler<AL, AR>::ProxyHandle;

  ProxyHandle lazy_handle() override { return this->lazy_handle(*this); };

  using linalg::array::ArrayHandler<AL, AR>::lazy_handle;

  AL copy(const AR &source) override { throw std::logic_error("unimplementable"); };

  void copy(AL &x, const AR &y) override { x = y; };

  void scal(value_type alpha, AL &x) override { x.scal(alpha); }

  void fill(value_type alpha, AL &x) override { x.fill(alpha); }

  void axpy(value_type alpha, const AR &x, AL &y) override { y.axpy(alpha, x); }

  value_type dot(const AL &x, const AR &y) override { return x.dot(y); }
  
  void gemm_outer(const molpro::linalg::itsolv::subspace::Matrix<value_type> alphas, const molpro::linalg::itsolv::CVecRef<AR> &xx, const molpro::linalg::itsolv::VecRef<AL> &yy) override {
    molpro::linalg::array::util::gemm_outer_default(*this, alphas, xx, yy);
  }
  
  molpro::linalg::itsolv::subspace::Matrix<value_type> gemm_inner(const molpro::linalg::itsolv::CVecRef<AL> &xx, const molpro::linalg::itsolv::CVecRef<AR> &yy) override {
    return molpro::linalg::array::util::gemm_inner_default(*this, xx, yy);
  }

  std::map<size_t, value_type_abs> select_max_dot(size_t n, const AL &x, const AR &y) override {
    throw std::logic_error("unimplemented");
//    return x.distr_buffer->select_max_dot(n, *y.distr_buffer);
  }

  std::map<size_t, value_type> select(size_t n, const AL &x, bool max = false, bool ignore_sign = false) override {
    return x.distr_buffer->select(n, max, ignore_sign);
  }

protected:
  using linalg::array::ArrayHandler<AL, AR>::error;
};

} // namespace wavefunction
} // namespace gci
} // namespace molpro

#endif // GCI_SRC_MOLPRO_GCI_WAVEFUNCTION_WAVEFUNCTIONHANDLER_H
