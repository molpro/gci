#include <algorithm>
#include <gmock/gmock.h>
#include <gtest/gtest.h>

#include <ga.h>
#include <molpro/gci/array/DistrArrayGA.h>
#include <molpro/gci/array/DistrArrayMPI3.h>
#include <molpro/gci/gci.h>
#include <numeric>

class Lock {
public:
  explicit Lock(int mutex = 0) : mutex(mutex) {}

  ~Lock() {}

  int mutex;
};

namespace {
int comm_rank(MPI_Comm comm) {
  int res;
  MPI_Comm_rank(comm, &res);
  return res;
}
int comm_size(MPI_Comm comm) {
  int res;
  MPI_Comm_size(comm, &res);
  return res;
}
} // namespace

using ::testing::ContainerEq;
using ::testing::DoubleEq;
using ::testing::Each;
using ::testing::Pointwise;

using molpro::gci::array::DistrArrayMPI3;

TEST(Array, constructor) {
  auto l = Lock();
  size_t dim = 100;
  DistrArrayMPI3 a{dim, molpro::gci::mpi_comm_compute};
}

TEST(Array, constructor_copy) {
  auto l = Lock();
  size_t dim = 100;
  DistrArrayMPI3 a{dim, molpro::gci::mpi_comm_compute};
  DistrArrayMPI3 b(a);
}

class ArrayInitializationF : public ::testing::Test, public DistrArrayMPI3 {
public:
  ArrayInitializationF()
      : DistrArrayMPI3(dim, molpro::gci::mpi_comm_compute), m_comm_rank{comm_rank(m_communicator)} {};
  const int m_comm_rank;
  static const size_t dim = 100;
};

TEST_F(ArrayInitializationF, size) {
  {
    auto l = Lock();
    ASSERT_EQ(m_dimension, size());
  }
  sync();
}

TEST_F(ArrayInitializationF, empty) {
  {
    auto l = Lock();
    EXPECT_FALSE(m_allocated);
    ASSERT_TRUE(empty());
  }
  sync();
}

TEST_F(ArrayInitializationF, allocate_buffer) {
  allocate_buffer();
  {
    auto l = Lock();
    EXPECT_TRUE(m_allocated);
    ASSERT_FALSE(empty());
  }
  sync();
}

TEST_F(ArrayInitializationF, zero) {
  allocate_buffer();
  zero();
  {
    auto l = Lock();
    EXPECT_TRUE(m_allocated);
    ASSERT_FALSE(empty());
  }
  sync();
}

TEST_F(ArrayInitializationF, vec) {
  allocate_buffer();
  zero();
  {
    auto l = Lock();
    auto data = vec();
    auto empty_vec = std::vector<double>(data.size(), 0.);
    ASSERT_THAT(empty_vec, Pointwise(DoubleEq(), empty_vec));
  }
  sync();
}

TEST_F(ArrayInitializationF, get) {
  allocate_buffer();
  zero();
  {
    auto l = Lock();
    auto data = get(0, 10);
    auto ref_vec = std::vector<double>(data.size(), 0.);
    ASSERT_THAT(ref_vec, Pointwise(DoubleEq(), data));
    data.assign(data.size(), 0);
    get(0, 10, data.data());
    ASSERT_THAT(ref_vec, Pointwise(DoubleEq(), data));
    data = get(0, dim - 1);
    auto same_as_vec = vec();
    ASSERT_THAT(data, Pointwise(DoubleEq(), same_as_vec));
  }
  sync();
}

TEST_F(ArrayInitializationF, put) {
  allocate_buffer();
  {
    auto l = Lock();
    auto range = std::vector<double>(dim);
    std::iota(range.begin(), range.end(), m_comm_rank);
    put(0, dim - 1, range.data());
    auto from_ga_buffer = get(0, dim - 1);
    ASSERT_THAT(from_ga_buffer, Pointwise(DoubleEq(), range));
  }
  sync();
}

TEST_F(ArrayInitializationF, set) {
  allocate_buffer();
  zero();
  auto ref_values = std::vector<double>(dim, 0.);
  auto from_ga_buffer = vec();
  {
    auto l = Lock();
    ASSERT_THAT(from_ga_buffer, Pointwise(DoubleEq(), ref_values));
  }
  fill(42.0);
  from_ga_buffer = vec();
  {
    auto l = Lock();
    std::fill(ref_values.begin(), ref_values.end(), 42.0);
    ASSERT_THAT(from_ga_buffer, Pointwise(DoubleEq(), ref_values));
  }
  sync();
}

class ArrayRangeF : public ::testing::Test, public DistrArrayMPI3 {
public:
  //! Stores a range in the buffer {1, 2, 3, 4, 5, .., dim}
  ArrayRangeF()
      : DistrArrayMPI3((size_t)dim, molpro::gci::mpi_comm_compute), p_rank(comm_rank(m_communicator)),
        p_size(comm_size(m_communicator)) {
    DistrArrayMPI3::allocate_buffer();
    values.resize(dim);
    std::iota(values.begin(), values.end(), 1.);
    auto buffer = DistrArrayMPI3::local_buffer();
    std::copy(values.begin() + buffer->lo, values.begin() + buffer->hi + 1, buffer->begin());
    sub_indices = {0, 1, 11, 31, 40, 99};
    for (auto el : sub_indices)
      sub_values.push_back(values[el]);
  }

  static const int dim = 100;
  static const int sub_dim = 6;
  int p_rank, p_size;
  std::vector<value_type> values;
  std::vector<index_type> sub_indices;
  std::vector<value_type> sub_values;
};

TEST_F(ArrayRangeF, gather) {
  sync();
  auto from_ga_buffer = gather(sub_indices);
  {
    auto l = Lock();
    ASSERT_THAT(from_ga_buffer, Pointwise(DoubleEq(), sub_values));
  }
  sync();
}

TEST_F(ArrayRangeF, scatter) {
  zero();
  {
    auto l = Lock();
    scatter(sub_indices, sub_values);
    auto from_ga_buffer = gather(sub_indices);
    ASSERT_THAT(from_ga_buffer, Pointwise(DoubleEq(), sub_values));
    auto zero_values = std::vector<double>(sub_values.size(), 0.);
    scatter(sub_indices, zero_values);
  }
  sync();
}

TEST_F(ArrayRangeF, scatter_acc) {
  sync();
  {
    auto l = Lock();
    scatter_acc(sub_indices, sub_values, 1.0);
    auto from_ga_buffer = gather(sub_indices);
    auto ref_values = sub_values;
    for (auto &el : ref_values) {
      el *= 2;
    }
    ASSERT_THAT(from_ga_buffer, Pointwise(DoubleEq(), ref_values));
    scatter_acc(sub_indices, sub_values, -1.0);
  }
  sync();
}

TEST_F(ArrayRangeF, at) {
  sync();
  auto from_ga_buffer = std::vector<double>();
  for (int i = 0; i < dim; ++i) {
    from_ga_buffer.push_back(this->at(i));
  }
  {
    auto l = Lock();
    ASSERT_THAT(from_ga_buffer, Pointwise(DoubleEq(), values));
  }
  sync();
}

TEST_F(ArrayRangeF, minlocN) {
  int n = 10;
  auto ref_minloc_ind = std::vector<size_t>(n);
  std::iota(ref_minloc_ind.begin(), ref_minloc_ind.end(), 0);
  auto minloc_ind = min_loc_n(n);
  {
    auto l = Lock();
    ASSERT_THAT(minloc_ind, ContainerEq(ref_minloc_ind));
  }
  sync();
}

TEST_F(ArrayRangeF, minlocN_reverse) {
  int n = 10;
  std::reverse(values.begin(), values.end());
  if (p_rank == 0)
    put(0, dim - 1, values.data());
  sync();
  auto ref_minloc_ind = std::vector<size_t>(n);
  std::iota(ref_minloc_ind.rbegin(), ref_minloc_ind.rend(), dim - n);
  auto minloc_ind = min_loc_n(n);
  {
    auto l = Lock();
    ASSERT_THAT(minloc_ind, ContainerEq(ref_minloc_ind));
  }
  sync();
}

TEST_F(ArrayRangeF, max_n) {
  int n = 10;
  auto ref_minloc_ind = std::vector<size_t>(n);
  std::iota(ref_minloc_ind.rbegin(), ref_minloc_ind.rend(), size() - n);
  auto maxloc = max_n(n);
  auto maxloc_ind = std::vector<size_t>(n);
  std::transform(maxloc.cbegin(), maxloc.cend(), maxloc_ind.begin(), [](const auto &p) { return p.first; });
  {
    auto l = Lock();
    ASSERT_THAT(maxloc_ind, ContainerEq(ref_minloc_ind));
  }
  sync();
}

TEST_F(ArrayRangeF, min_abs_n) {
  auto loc_buffer = local_buffer();
  for (size_t i = 0; i < loc_buffer->size(); ++i)
    if ((i + loc_buffer->lo) % 2 == 1)
      loc_buffer->at(i) *= -1;
  int n = 10;
  auto ref_minloc_ind = std::vector<size_t>(n);
  std::iota(ref_minloc_ind.begin(), ref_minloc_ind.end(), 0);
  sync();
  auto minloc = min_abs_n(n);
  auto minloc_ind = std::vector<size_t>(n);
  std::transform(minloc.cbegin(), minloc.cend(), minloc_ind.begin(), [](const auto &p) { return p.first; });
  {
    auto l = Lock();
    ASSERT_THAT(minloc_ind, ContainerEq(ref_minloc_ind));
  }
  sync();
}

TEST_F(ArrayRangeF, max_abs_n) {
  auto loc_buffer = local_buffer();
  for (size_t i = 0; i < loc_buffer->size(); ++i)
    if ((i + loc_buffer->lo) % 2 == 1)
      loc_buffer->at(i) *= -1;
  int n = 10;
  auto ref_minloc_ind = std::vector<size_t>(n);
  std::iota(ref_minloc_ind.rbegin(), ref_minloc_ind.rend(), size() - n);
  sync();
  auto maxloc = max_abs_n(n);
  auto maxloc_ind = std::vector<size_t>(n);
  std::transform(maxloc.cbegin(), maxloc.cend(), maxloc_ind.begin(), [](const auto &p) { return p.first; });
  {
    auto l = Lock();
    ASSERT_THAT(maxloc_ind, ContainerEq(ref_minloc_ind));
  }
  sync();
}

TEST_F(ArrayRangeF, scal_double) {
  double alpha = 1.5;
  scal(alpha);
  for (auto &el : values) {
    el *= alpha;
  }
  auto from_ga_buffer = vec();
  {
    auto l = Lock();
    ASSERT_THAT(from_ga_buffer, Pointwise(DoubleEq(), values));
  }
  sync();
}

TEST_F(ArrayRangeF, add_double) {
  double alpha = 100.;
  add(alpha);
  for (auto &el : values) {
    el += alpha;
  }
  auto from_ga_buffer = vec();
  {
    auto l = Lock();
    ASSERT_THAT(from_ga_buffer, Pointwise(DoubleEq(), values));
  }
  sync();
}

TEST_F(ArrayRangeF, sub_double) {
  double alpha = 100.;
  sub(alpha);
  for (auto &el : values) {
    el -= alpha;
  }
  auto from_ga_buffer = vec();
  {
    auto l = Lock();
    ASSERT_THAT(from_ga_buffer, Pointwise(DoubleEq(), values));
  }
  sync();
}

TEST_F(ArrayRangeF, recip) {
  recip();
  for (auto &el : values) {
    el = 1. / el;
  }
  auto from_ga_buffer = vec();
  {
    auto l = Lock();
    ASSERT_THAT(from_ga_buffer, Pointwise(DoubleEq(), values));
  }
  sync();
}

class ArrayCollectiveOpF : public ::testing::Test {
public:
  ArrayCollectiveOpF()
      : alpha(1.0), beta(2.0), p_rank(GA_Nodeid()), p_size(GA_Nnodes()), a(dim, molpro::gci::mpi_comm_compute),
        b(dim, molpro::gci::mpi_comm_compute) {
    a.allocate_buffer();
    b.allocate_buffer();
    range_alpha.resize(dim);
    range_beta.resize(dim);
    std::iota(range_alpha.begin(), range_alpha.end(), 0);
    for (const auto &el : range_alpha) {
      range_beta.push_back(el * beta);
    }
    auto n = dim / every_nth_element;
    auto indices = std::vector<size_t>(n);
    for (int i = 0; i < n; ++i) {
      indices[i] = range_beta[i * every_nth_element];
    }
    for (const auto &el : indices) {
      sparse_array.emplace(el, range_beta[el]);
    }
  }

  static const int dim = 100;
  const double alpha;
  const double beta;
  std::vector<double> range_alpha;
  std::vector<double> range_beta;
  int p_rank, p_size;
  DistrArrayMPI3 a;
  DistrArrayMPI3 b;
  static const int every_nth_element = 5; // period for selection of sparse array elements
  std::map<size_t, double> sparse_array;  // sparse selection of range_beta elements
};

TEST_F(ArrayCollectiveOpF, add) {
  a.fill(alpha);
  b.fill(beta);
  a.add(b);
  auto from_ga_buffer_a = a.vec();
  auto from_ga_buffer_b = b.vec();
  {
    auto l = Lock();
    ASSERT_THAT(from_ga_buffer_a, Each(DoubleEq(alpha + beta)));
    ASSERT_THAT(from_ga_buffer_b, Each(DoubleEq(beta)));
  }
  sync();
}

TEST_F(ArrayCollectiveOpF, sub) {
  a.fill(alpha);
  b.fill(beta);
  a.sub(b);
  auto from_ga_buffer_a = a.vec();
  auto from_ga_buffer_b = b.vec();
  {
    auto l = Lock();
    ASSERT_THAT(from_ga_buffer_a, Each(DoubleEq(alpha - beta)));
    ASSERT_THAT(from_ga_buffer_b, Each(DoubleEq(beta)));
  }
  sync();
}

TEST_F(ArrayCollectiveOpF, axpy_Reference) {
  double scale = -3.0;
  a.fill(alpha);
  b.fill(beta);
  a.axpy(scale, b);
  auto from_ga_buffer_a = a.vec();
  auto from_ga_buffer_b = b.vec();
  {
    auto l = Lock();
    ASSERT_THAT(from_ga_buffer_a, Each(DoubleEq(alpha + scale * beta)));
    ASSERT_THAT(from_ga_buffer_b, Each(DoubleEq(beta)));
  }
  sync();
}

TEST_F(ArrayCollectiveOpF, axpy_Pointer) {
  double scale = -3.0;
  a.fill(alpha);
  b.fill(beta);
  a.axpy(scale, b);
  auto from_ga_buffer_a = a.vec();
  auto from_ga_buffer_b = b.vec();
  {
    auto l = Lock();
    ASSERT_THAT(from_ga_buffer_a, Each(DoubleEq(alpha + scale * beta)));
    ASSERT_THAT(from_ga_buffer_b, Each(DoubleEq(beta)));
  }
  sync();
}

TEST_F(ArrayCollectiveOpF, axpy_map) {
  a.fill(alpha);
  double scale = 5.0;
  a.axpy(scale, sparse_array);
  auto from_ga_buffer_a = a.vec();
  auto ref_vals = std::vector<double>(dim, alpha);
  for (const auto &item : sparse_array) {
    ref_vals[item.first] += scale * item.second;
  }
  {
    auto l = Lock();
    ASSERT_THAT(from_ga_buffer_a, Pointwise(DoubleEq(), ref_vals));
  }
  sync();
}

TEST_F(ArrayCollectiveOpF, dot_Array) {
  if (p_rank == 0) {
    a.put(0, dim - 1, range_alpha.data());
    b.put(0, dim - 1, range_beta.data());
  }
  auto ga_dot = a.dot(b);
  double ref_dot = std::inner_product(range_alpha.begin(), range_alpha.end(), range_beta.begin(), 0.);
  {
    auto l = Lock();
    ASSERT_THAT(ga_dot, DoubleEq(ref_dot));
  }
  sync();
}

TEST_F(ArrayCollectiveOpF, dot_map) {
  if (p_rank == 0)
    a.put(0, dim - 1, range_alpha.data());
  auto ga_dot = a.dot(sparse_array);
  double ref_dot = 0.;
  for (const auto &item : sparse_array) {
    ref_dot += range_alpha[item.first] * item.second;
  }
  {
    auto l = Lock();
    ASSERT_THAT(ga_dot, DoubleEq(ref_dot));
  }
  sync();
}

TEST_F(ArrayCollectiveOpF, times) {
  a.fill(alpha);
  b.fill(beta);
  DistrArrayMPI3 c{a};
  c.times(a, b);
  auto from_ga_buffer_a = a.vec();
  auto from_ga_buffer_b = b.vec();
  auto from_ga_buffer_c = c.vec();
  auto ref_a = std::vector<double>(dim, alpha);
  auto ref_b = std::vector<double>(dim, beta);
  auto ref_c = std::vector<double>(dim, alpha * beta);
  {
    auto l = Lock();
    ASSERT_THAT(from_ga_buffer_a, Pointwise(DoubleEq(), ref_a));
    ASSERT_THAT(from_ga_buffer_b, Pointwise(DoubleEq(), ref_b));
    ASSERT_THAT(from_ga_buffer_c, Pointwise(DoubleEq(), ref_c));
  }
  sync();
}

// c[i] -= a[i]/(b[i]+shift)
TEST_F(ArrayCollectiveOpF, divide_append_negative) {
  double shift = 0.5;
  a.fill(alpha);
  b.fill(beta);
  DistrArrayMPI3 c{a};
  c.divide(a, b, shift, true, true);
  auto from_ga_buffer_a = a.vec();
  auto from_ga_buffer_b = b.vec();
  auto from_ga_buffer_c = c.vec();
  auto ref_a = std::vector<double>(dim, alpha);
  auto ref_b = std::vector<double>(dim, beta);
  auto ref_c = std::vector<double>(dim, alpha - alpha / (beta + shift));
  {
    auto l = Lock();
    ASSERT_THAT(from_ga_buffer_a, Pointwise(DoubleEq(), ref_a));
    ASSERT_THAT(from_ga_buffer_b, Pointwise(DoubleEq(), ref_b));
    ASSERT_THAT(from_ga_buffer_c, Pointwise(DoubleEq(), ref_c));
  }
  sync();
}

// c[i] += a[i]/(b[i]+shift)
TEST_F(ArrayCollectiveOpF, divide_append_positive) {
  double shift = 0.5;
  a.fill(alpha);
  b.fill(beta);
  DistrArrayMPI3 c{a};
  c.divide(a, b, shift, true, false);
  auto from_ga_buffer_a = a.vec();
  auto from_ga_buffer_b = b.vec();
  auto from_ga_buffer_c = c.vec();
  auto ref_a = std::vector<double>(dim, alpha);
  auto ref_b = std::vector<double>(dim, beta);
  auto ref_c = std::vector<double>(dim, alpha + alpha / (beta + shift));
  {
    auto l = Lock();
    ASSERT_THAT(from_ga_buffer_a, Pointwise(DoubleEq(), ref_a));
    ASSERT_THAT(from_ga_buffer_b, Pointwise(DoubleEq(), ref_b));
    ASSERT_THAT(from_ga_buffer_c, Pointwise(DoubleEq(), ref_c));
  }
  sync();
}

// c[i] = a[i]/(b[i]+shift)
TEST_F(ArrayCollectiveOpF, divide_overwrite_positive) {
  double shift = 0.5;
  a.fill(alpha);
  b.fill(beta);
  DistrArrayMPI3 c{a};
  c.divide(a, b, shift, false, false);
  auto from_ga_buffer_a = a.vec();
  auto from_ga_buffer_b = b.vec();
  auto from_ga_buffer_c = c.vec();
  auto ref_a = std::vector<double>(dim, alpha);
  auto ref_b = std::vector<double>(dim, beta);
  auto ref_c = std::vector<double>(dim, alpha / (beta + shift));
  {
    auto l = Lock();
    ASSERT_THAT(from_ga_buffer_a, Pointwise(DoubleEq(), ref_a));
    ASSERT_THAT(from_ga_buffer_b, Pointwise(DoubleEq(), ref_b));
    ASSERT_THAT(from_ga_buffer_c, Pointwise(DoubleEq(), ref_c));
  }
  sync();
}
