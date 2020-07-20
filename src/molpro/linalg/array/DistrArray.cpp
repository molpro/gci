#include "DistrArray.h"
#include "util.h"
#include <algorithm>
#include <functional>
#include <molpro/Profiler.h>
#include <numeric>

namespace molpro {
namespace linalg {
namespace array {

DistrArray::DistrArray(size_t dimension, MPI_Comm commun, std::shared_ptr<molpro::Profiler> prof)
    : m_dimension(dimension), m_communicator(commun), m_prof(std::move(prof)) {}

void DistrArray::sync() const { MPI_Barrier(m_communicator); }

void DistrArray::error(const std::string& message) const {
  std::cout << message << std::endl;
  MPI_Abort(m_communicator, 1);
}

bool DistrArray::compatible(const DistrArray& other) const {
  int comp;
  MPI_Comm_compare(m_communicator, other.m_communicator, &comp);
  return (m_dimension == other.m_dimension) && (MPI_IDENT || MPI_CONGRUENT);
}

bool DistrArray::empty() const { return true; }

void DistrArray::zero() { fill(0); }

DistrArray& DistrArray::fill(DistrArray::value_type val) {
  util::ScopeProfiler p{m_prof, "Array::fill"};
  auto lb = local_buffer();
  for (auto& el : *lb)
    el = val;
  return *this;
}

DistrArray& DistrArray::axpy(value_type a, const DistrArray& y) {
  auto name = std::string{"Array::axpy"};
  if (!compatible(y))
    error(name + " incompatible arrays");
  if (empty() || y.empty())
    error(name + " cannot use empty arrays");
  if (a == 0)
    return *this;
  util::ScopeProfiler p{m_prof, name};
  auto loc_x = local_buffer();
  auto loc_y = y.local_buffer();
  if (!loc_x->compatible(*loc_y))
    error(name + " incompatible local buffers");
  if (a == 1)
    for (size_t i = 0; i < loc_x->size(); ++i)
      loc_x->at(i) += loc_y->at(i);
  else if (a == -1)
    for (size_t i = 0; i < loc_x->size(); ++i)
      loc_x->at(i) -= loc_y->at(i);
  else
    for (size_t i = 0; i < loc_x->size(); ++i)
      loc_x->at(i) += a * loc_y->at(i);
  return *this;
}

DistrArray& DistrArray::scal(DistrArray::value_type a) {
  util::ScopeProfiler p{m_prof, "Array::scal"};
  for (auto& el : *local_buffer())
    el *= a;
  return *this;
}

DistrArray& DistrArray::add(const DistrArray& y) { return axpy(1, y); }

DistrArray& DistrArray::add(DistrArray::value_type a) {
  util::ScopeProfiler p{m_prof, "Array::add"};
  for (auto& el : *local_buffer())
    el += a;
  return *this;
}

DistrArray& DistrArray::sub(const DistrArray& y) { return axpy(-1, y); }

DistrArray& DistrArray::sub(DistrArray::value_type a) { return add(-a); }

DistrArray& DistrArray::recip() {
  util::ScopeProfiler p{m_prof, "Array::recip"};
  for (auto& el : *local_buffer())
    el = 1. / el;
  return *this;
}

DistrArray& DistrArray::times(const DistrArray& y) {
  auto name = std::string{"Array::times"};
  if (!compatible(y))
    error(name + " incompatible arrays");
  if (empty() || y.empty())
    error(name + " cannot use empty arrays");
  util::ScopeProfiler p{m_prof, name};
  auto loc_x = local_buffer();
  auto loc_y = y.local_buffer();
  if (!loc_x->compatible(*loc_y))
    error(name + " incompatible local buffers");
  for (size_t i = 0; i < loc_x->size(); ++i)
    loc_x->at(i) *= loc_y->at(i);
  return *this;
}

DistrArray& DistrArray::times(const DistrArray& y, const DistrArray& z) {
  auto name = std::string{"Array::times"};
  if (!compatible(y))
    error(name + " array y is incompatible");
  if (!compatible(z))
    error(name + " array z is incompatible");
  if (empty() || y.empty() || z.empty())
    error(name + " cannot use empty arrays");
  util::ScopeProfiler p{m_prof, name};
  auto loc_x = local_buffer();
  auto loc_y = y.local_buffer();
  auto loc_z = z.local_buffer();
  if (!loc_x->compatible(*loc_y) || !loc_x->compatible(*loc_z))
    error(name + " incompatible local buffers");
  for (size_t i = 0; i < loc_x->size(); ++i)
    loc_x->at(i) = loc_y->at(i) * loc_z->at(i);
  return *this;
}

DistrArray::value_type DistrArray::dot(const DistrArray& y) const {
  auto name = std::string{"Array::dot"};
  if (!compatible(y))
    error(name + " array x is incompatible");
  if (empty() || y.empty())
    error(name + " calling dot on empty arrays");
  util::ScopeProfiler p{m_prof, name};
  auto loc_x = local_buffer();
  auto loc_y = y.local_buffer();
  if (!loc_x->compatible(*loc_y))
    error(name + " incompatible local buffers");
  auto a = std::inner_product(loc_x->begin(), loc_x->end(), loc_y->begin(), 0.);
  MPI_Allreduce(MPI_IN_PLACE, &a, 1, MPI_DOUBLE, MPI_SUM, communicator());
  return a;
}

DistrArray& DistrArray::_divide(const DistrArray& y, const DistrArray& z, DistrArray::value_type shift, bool append,
                                bool negative) {
  auto name = std::string{"Array::divide"};
  if (!compatible(y))
    error(name + " array y is incompatible");
  if (!compatible(z))
    error(name + " array z is incompatible");
  if (empty() || y.empty() || z.empty())
    error(name + " calling divide with an empty array");
  util::ScopeProfiler p{m_prof, name};
  auto loc_x = local_buffer();
  auto loc_y = y.local_buffer();
  auto loc_z = z.local_buffer();
  if (!loc_x->compatible(*loc_y) || !loc_x->compatible(*loc_z))
    error(name + " incompatible local buffers");
  if (append) {
    if (negative)
      for (size_t i = 0; i < loc_x->size(); ++i)
        loc_x->at(i) -= loc_y->at(i) / (loc_z->at(i) + shift);
    else
      for (size_t i = 0; i < loc_x->size(); ++i)
        loc_x->at(i) += loc_y->at(i) / (loc_z->at(i) + shift);
  } else {
    if (negative)
      for (size_t i = 0; i < loc_x->size(); ++i)
        loc_x->at(i) = -loc_y->at(i) / (loc_z->at(i) + shift);
    else
      for (size_t i = 0; i < loc_x->size(); ++i)
        loc_x->at(i) = loc_y->at(i) / (loc_z->at(i) + shift);
  }
  return *this;
}

namespace util {
template <class Compare> std::list<std::pair<unsigned long, double>> extrema(const DistrArray& x, int n) {
  if (x.empty())
    return {};
  util::ScopeProfiler p{x.m_prof, "Array::extrema"};
  auto buffer = x.local_buffer();
  auto length = buffer->size();
  auto nmin = length > n ? n : length;
  auto loc_extrema = std::list<std::pair<unsigned long, double>>();
  for (size_t i = 0; i < nmin; ++i)
    loc_extrema.emplace_back(buffer->lo + i, buffer->at(i));
  auto compare = Compare();
  auto compare_pair = [&compare](const auto& p1, const auto& p2) { return compare(p1.second, p2.second); };
  for (size_t i = nmin; i < length; ++i) {
    loc_extrema.emplace_back(buffer->lo + i, buffer->at(i));
    loc_extrema.sort(compare_pair);
    loc_extrema.pop_back();
  }
  auto indices_loc = std::vector<unsigned long>(n, x.size() + 1);
  auto indices_glob = std::vector<unsigned long>(n);
  auto values_loc = std::vector<double>(n);
  auto values_glob = std::vector<double>(n);
  size_t ind = 0;
  for (auto& it : loc_extrema) {
    indices_loc[ind] = it.first;
    values_loc[ind] = it.second;
    ++ind;
  }
  MPI_Request requests[3];
  int comm_rank, comm_size;
  MPI_Comm_rank(x.communicator(), &comm_rank);
  MPI_Comm_size(x.communicator(), &comm_size);
  // root collects values, does the final sort and sends the result back
  if (comm_rank == 0) {
    auto ntot = n * comm_size;
    indices_loc.resize(ntot);
    values_loc.resize(ntot);
    auto ndummy = std::vector<int>(comm_size);
    auto d = int(n - nmin);
    MPI_Igather(&d, 1, MPI_INT, ndummy.data(), 1, MPI_INT, 0, x.communicator(), &requests[0]);
    MPI_Igather(MPI_IN_PLACE, n, MPI_UNSIGNED_LONG, indices_loc.data(), n, MPI_UNSIGNED_LONG, 0, x.communicator(),
                &requests[1]);
    MPI_Igather(MPI_IN_PLACE, n, MPI_DOUBLE, values_loc.data(), n, MPI_UNSIGNED_LONG, 0, x.communicator(),
                &requests[2]);
    MPI_Waitall(3, requests, MPI_STATUSES_IGNORE);
    auto tot_dummy = std::accumulate(ndummy.cbegin(), ndummy.cend(), 0);
    if (tot_dummy != 0) {
      size_t shift = 0;
      for (size_t i = 0, ind = 0; i < comm_size; ++i) {
        for (size_t j = 0; j < n - ndummy[i]; ++j, ++ind) {
          indices_loc[ind] = indices_loc[ind + shift];
          values_loc[ind] = values_loc[ind + shift];
        }
        shift += ndummy[i];
      }
      indices_loc.resize(ntot - tot_dummy);
      values_loc.resize(ntot - tot_dummy);
    }
    std::vector<unsigned int> sort_permutation(indices_loc.size());
    std::iota(sort_permutation.begin(), sort_permutation.end(), 0);
    std::sort(
        sort_permutation.begin(), sort_permutation.end(),
        [&values_loc, &compare](const auto& i1, const auto& i2) { return compare(values_loc[i1], values_loc[i2]); });
    for (size_t i = 0; i < n; ++i) {
      auto j = sort_permutation[i];
      indices_glob[i] = indices_loc[j];
      values_glob[i] = values_loc[j];
    }
  } else {
    auto d = int(n - nmin);
    MPI_Igather(&d, 1, MPI_INT, nullptr, 1, MPI_INT, 0, x.communicator(), &requests[0]);
    MPI_Igather(indices_loc.data(), n, MPI_UNSIGNED_LONG, nullptr, n, MPI_UNSIGNED_LONG, 0, x.communicator(),
                &requests[1]);
    MPI_Igather(values_loc.data(), n, MPI_DOUBLE, nullptr, n, MPI_DOUBLE, 0, x.communicator(), &requests[2]);
    MPI_Waitall(3, requests, MPI_STATUSES_IGNORE);
  }
  MPI_Ibcast(indices_glob.data(), n, MPI_UNSIGNED_LONG, 0, x.communicator(), &requests[0]);
  MPI_Ibcast(values_glob.data(), n, MPI_DOUBLE, 0, x.communicator(), &requests[1]);
  MPI_Waitall(2, requests, MPI_STATUSES_IGNORE);
  auto map_extrema = std::list<std::pair<unsigned long, double>>();
  for (size_t i = 0; i < n; ++i)
    map_extrema.emplace_back(indices_glob[i], values_glob[i]);
  return map_extrema;
}
} // namespace util

std::list<std::pair<DistrArray::index_type, DistrArray::value_type>> DistrArray::min_n(int n) const {
  if (empty())
    return {};
  return util::extrema<std::less<DistrArray::value_type>>(*this, n);
}

std::list<std::pair<DistrArray::index_type, DistrArray::value_type>> DistrArray::max_n(int n) const {
  if (empty())
    return {};
  return util::extrema<std::greater<DistrArray::value_type>>(*this, n);
}

std::list<std::pair<DistrArray::index_type, DistrArray::value_type>> DistrArray::min_abs_n(int n) const {
  if (empty())
    return {};
  return util::extrema<util::CompareAbs<DistrArray::value_type, std::less<>>>(*this, n);
}

std::list<std::pair<DistrArray::index_type, DistrArray::value_type>> DistrArray::max_abs_n(int n) const {
  if (empty())
    return {};
  return util::extrema<util::CompareAbs<DistrArray::value_type, std::greater<>>>(*this, n);
}

std::vector<DistrArray::index_type> DistrArray::min_loc_n(int n) const {
  if (empty())
    return {};
  auto min_list = min_abs_n(n);
  auto min_vec = std::vector<index_type>(n);
  std::transform(min_list.cbegin(), min_list.cend(), min_vec.begin(), [](const auto& p) { return p.first; });
  return min_vec;
}

DistrArray& DistrArray::copy(const DistrArray& y) {
  auto name = std::string{"Array::copy"};
  if (!compatible(y))
    error(name + " incompatible arrays");
  if (empty() != y.empty())
    error(name + " one of the arrays is empty");
  util::ScopeProfiler p{m_prof, name};
  auto loc_x = local_buffer();
  auto loc_y = y.local_buffer();
  if (!loc_x->compatible(*loc_y))
    error(name + " incompatible local buffers");
  for (size_t i = 0; i < loc_x->size(); ++i)
    loc_x->at(i) = loc_y->at(i);
  return *this;
}

DistrArray& DistrArray::copy_patch(const DistrArray& y, DistrArray::index_type start, DistrArray::index_type end) {
  auto name = std::string{"Array::copy_patch"};
  if (!compatible(y))
    error(name + " incompatible arrays");
  if (empty() != y.empty())
    error(name + " one of the arrays is empty");
  util::ScopeProfiler p{m_prof, name};
  auto loc_x = local_buffer();
  auto loc_y = y.local_buffer();
  if (!loc_x->compatible(*loc_y))
    error(name + " incompatible local buffers");
  if (start > end)
    return *this;
  auto s = start <= loc_x->lo ? 0 : start - loc_x->lo;
  auto e = end - start + 1 >= loc_x->size() ? loc_x->size() : end - start + 1;
  for (auto i = s; i < e; ++i)
    loc_x->at(i) = loc_y->at(i);
  return *this;
}

DistrArray::value_type DistrArray::dot(const SparseArray& y) const {
  auto name = std::string{"Array::dot SparseArray "};
  if (y.empty())
    return 0;
  if (empty())
    error(name + " calling dot on empty arrays");
  if (size() < y.rbegin()->first + 1)
    error(name + " sparse array x is incompatible");
  util::ScopeProfiler p{m_prof, name};
  auto loc_x = local_buffer();
  double res = 0;
  index_type i;
  value_type v;
  for (auto it = y.lower_bound(loc_x->lo); it != y.upper_bound(loc_x->hi); ++it) {
    std::tie(i, v) = *it;
    res += loc_x->at(i - loc_x->lo) * v;
  }
  MPI_Allreduce(MPI_IN_PLACE, &res, 1, MPI_DOUBLE, MPI_SUM, communicator());
  return res;
}

DistrArray& DistrArray::axpy(value_type a, const SparseArray& y) {
  auto name = std::string{"Array::axpy SparseArray"};
  if (a == 0 || y.empty())
    return *this;
  if (empty())
    error(name + " calling dot on empty arrays");
  if (size() < y.rbegin()->first + 1)
    error(name + " sparse array x is incompatible");
  util::ScopeProfiler p{m_prof, name};
  auto loc_x = local_buffer();
  index_type i;
  value_type v;
  if (a == 1)
    for (auto it = y.lower_bound(loc_x->lo); it != y.upper_bound(loc_x->hi); ++it) {
      std::tie(i, v) = *it;
      loc_x->at(i - loc_x->lo) += v;
    }
  else if (a == -1)
    for (auto it = y.lower_bound(loc_x->lo); it != y.upper_bound(loc_x->hi); ++it) {
      std::tie(i, v) = *it;
      loc_x->at(i - loc_x->lo) -= v;
    }
  else
    for (auto it = y.lower_bound(loc_x->lo); it != y.upper_bound(loc_x->hi); ++it) {
      std::tie(i, v) = *it;
      loc_x->at(i - loc_x->lo) += a * v;
    }
  return *this;
}
} // namespace array
} // namespace linalg
} // namespace molpro