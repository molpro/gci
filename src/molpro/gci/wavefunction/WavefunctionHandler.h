#ifndef GCI_SRC_MOLPRO_GCI_WAVEFUNCTION_WAVEFUNCTIONHANDLER_H
#define GCI_SRC_MOLPRO_GCI_WAVEFUNCTION_WAVEFUNCTIONHANDLER_H
#include <molpro/linalg/array/ArrayHandler.h>
#include <molpro/linalg/array/default_handler.h>
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

  value_type dot(const AL &x, const AR &y) override {
  return x.dot(y);
  }

  void gemm_outer(const Matrix<value_type> alphas, const CVecRef<AR> &xx, const VecRef<AL> &yy) override {
    molpro::linalg::array::util::gemm_outer_default(*this, alphas, xx, yy);
  }

  Matrix<value_type> gemm_inner(const CVecRef<AL> &xx, const CVecRef<AR> &yy) override {
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

  void gemm_outer(const Matrix<value_type> alphas, const CVecRef<AR> &xx, const VecRef<AL> &yy) override {
    molpro::linalg::array::util::gemm_outer_default(*this, alphas, xx, yy);
  }

  Matrix<value_type> gemm_inner(const CVecRef<AL> &xx, const CVecRef<AR> &yy) override {
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
template <class AL, class AR>
class WavefunctionHandlerDistr : public linalg::array::ArrayHandler<AL, AR> {
public:
  using typename linalg::array::ArrayHandler<AL, AR>::value_type_L;
  using typename linalg::array::ArrayHandler<AL, AR>::value_type_R;
  using typename linalg::array::ArrayHandler<AL, AR>::value_type;
  using typename linalg::array::ArrayHandler<AL, AR>::value_type_abs;
  using typename linalg::array::ArrayHandler<AL, AR>::ProxyHandle;

  ProxyHandle lazy_handle() override { return this->lazy_handle(*this); };

  using linalg::array::ArrayHandler<AL, AR>::lazy_handle;

  AL copy(const AR &source) override { throw std::logic_error("unimplementable"); };

  void copy(AL &x, const AR &y) override { x.distr_buffer->copy(y); };

  void scal(value_type alpha, AL &x) override { x.scal(alpha); }

  void fill(value_type alpha, AL &x) override { x.fill(alpha); }

  void axpy(value_type alpha, const AR &x, AL &y) override {
//    std::cout << "WavefunctionHandlerDistr::axpy"<<std::endl;
//    std::cout << molpro::mpi::rank_global()<<"initial Wavefunction buffer: "; for (const auto& v : y.buffer) std::cout << " "<<v; std::cout << std::endl;
    y.distr_buffer->axpy(alpha, x);
//#ifdef HAVE_MPI_H
//    auto distribution = y.distr_buffer->distribution();
//    auto lb = y.distr_buffer->local_buffer();
//    auto start = lb->start();
//    auto size = lb->size();
//#endif
//    std::cout << molpro::mpi::rank_global()<<"final Wavefunction buffer: "; for (const auto& v : y.buffer) std::cout << " "<<v; std::cout << std::endl;
    }

  value_type dot(const AL &x, const AR &y) override { return x.distr_buffer->dot(y); }

  void gemm_outer(const Matrix<value_type> alphas, const CVecRef<AR> &xx, const VecRef<AL> &yy) override {
    //    std::vector<double> buffer(102400); // TODO chunked implementation with the segments of x cached
    for (size_t ix = 0; ix < xx.size(); ix++) {
      auto &x = xx[ix].get();
      //      auto distribution = x.distribution();
      for (size_t iy = 0; iy < yy.size(); iy++) {
        auto &y = yy[iy].get();
        auto &buffer = y.distr_buffer;
        auto lb = buffer->local_buffer();
        //        for (int i=0; i<y.buffer.size(); i++) {
        //        std::cout << "initial element of target buffer " << &y.buffer[i] <<": "<<y.buffer[i]<<std::endl;
        //        std::cout << "initial element of target local buffer " << &(*lb)[i] <<": "<<(*lb)[i]<<std::endl;
        //        }
        //        buffer->axpy(alphas(ix,iy),x);
        axpy(alphas(ix, iy), x, y);
        //       std::cout << "alpha "<<alphas(ix,iy)<<std::endl;
        //        for (int i=0; i<y.buffer.size(); i++) {
        //         std::cout << "final element of target buffer " << &y.buffer[i] << ": " << y.buffer[i] << std::endl;
        //         std::cout << "final element of target local buffer " << &(*lb)[i] << ": " << (*lb)[i] << std::endl;
        //       }
      }
    }
    //    molpro::linalg::array::util::gemm_outer_default(*this, alphas, xx, y);
  }

  Matrix<value_type> gemm_inner(const CVecRef<AL> &xx, const CVecRef<AR> &yy) override {
    auto mat = Matrix<double>({xx.size(), yy.size()});
    //    std::vector<double> buffer(102400); // TODO chunked implementation with the segments of x cached
    for (size_t ix = 0; ix < xx.size(); ix++) {
      const auto &x = xx[ix].get();
      //      auto distribution = x.distribution();
      for (size_t iy = 0; iy < yy.size(); iy++) {
        const auto &y = yy[iy].get();
        mat(ix, iy) = x.distr_buffer->dot(y);
        mat(ix, iy) = y.dot(*x.distr_buffer);
      }
    }
    //    std::cout <<
    //    "WavefunctionHandlerDistr::gemm_inner:"<<xx.size()<<","<<yy.size()<<"\n"<<as_string(mat)<<std::endl;
    return mat;
    //    return molpro::linalg::array::util::gemm_inner_default(*this, xx, yy);
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
template <class AL, class AR>
class DistrWavefunctionHandler : public linalg::array::ArrayHandler<AL, AR> {
public:
  using typename linalg::array::ArrayHandler<AL, AR>::value_type_L;
  using typename linalg::array::ArrayHandler<AL, AR>::value_type_R;
  using typename linalg::array::ArrayHandler<AL, AR>::value_type;
  using typename linalg::array::ArrayHandler<AL, AR>::value_type_abs;
  using typename linalg::array::ArrayHandler<AL, AR>::ProxyHandle;

  ProxyHandle lazy_handle() override { return this->lazy_handle(*this); };

  using linalg::array::ArrayHandler<AL, AR>::lazy_handle;

  AL copy(const AR &source) override { return AL(*source.distr_buffer); };

  void copy(AL &x, const AR &y) override { x.copy(*y.distr_buffer); };

  void scal(value_type alpha, AL &x) override { x.scal(alpha); }

  void fill(value_type alpha, AL &x) override { x.fill(alpha); }

  void axpy(value_type alpha, const AR &x, AL &y) override {
  y.axpy(alpha, *x.distr_buffer);
  std::cout << "DistrWavefunctionHandler::axpy"<<std::endl;
  }

  value_type dot(const AL &x, const AR &y) override { return x.dot(*y.distr_buffer); }

  void gemm_outer(const Matrix<value_type> alphas, const CVecRef<AR> &xx, const VecRef<AL> &yy) override {
    throw std::logic_error("unimplementable");
  }

  Matrix<value_type> gemm_inner(const CVecRef<AL> &xx, const CVecRef<AR> &yy) override {
    auto mat = Matrix<double>({xx.size(), yy.size()});
    //    std::vector<double> buffer(102400); // TODO chunked implementation with the segments of x cached
    for (size_t ix = 0; ix < xx.size(); ix++) {
      const auto &x = xx[ix].get();
      //      auto distribution = x.distribution();
      for (size_t iy = 0; iy < yy.size(); iy++) {
        const auto &y = yy[iy].get();
        mat(ix, iy) = x.dot(*y.distr_buffer);
      }
    }
    return mat;
    //    return molpro::linalg::array::util::gemm_inner_default(*this, xx, yy);
  }

  std::map<size_t, value_type_abs> select_max_dot(size_t n, const AL &x, const AR &y) override {
    return x.select_max_dot(n, *y.distr_buffer);
  }

  std::map<size_t, value_type> select(size_t n, const AL &x, bool max = false, bool ignore_sign = false) override {
    return x.select(n, max, ignore_sign);
  }

protected:
  using linalg::array::ArrayHandler<AL, AR>::error;
};

} // namespace wavefunction
} // namespace gci
} // namespace molpro

#endif // GCI_SRC_MOLPRO_GCI_WAVEFUNCTION_WAVEFUNCTIONHANDLER_H
