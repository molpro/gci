#include "gciMixedWavefunction.h"
#include "gciHProductSet.h"
#include <stdexcept>

#include <molpro/linalg/array/util/Distribution.h>
#include <mpi.h>
#include <limits>

namespace molpro {
namespace gci {

MixedWavefunction::MixedWavefunction(const Options &options, const State &prototype, MPI_Comm head_commun)
    : m_child_communicator(_sub_communicator),
      m_vibSpace(options.parameter("NMODE", 0), options.parameter("NMODAL", 1), options.parameter("VIB_EXC_LVL", 1)),
      m_vibBasis(m_vibSpace), m_elDim(0), m_prototype(prototype, m_child_communicator) {
  m_elDim = m_prototype.size();
  m_vibBasis.generateFullSpace();
  distr_buffer.reset(new linalg::array::DistrArrayMPI3(m_vibBasis.vibDim() * m_elDim, head_commun));
  allocate_buffer();
}

MixedWavefunction::MixedWavefunction(const std::map<size_t, double> &source)
    : m_child_communicator(_sub_communicator), m_vibSpace(1, 1, 1), m_vibBasis(m_vibSpace), m_elDim(0),
      m_prototype(State(), m_child_communicator) {
  throw std::logic_error("unimplementable");
}

MixedWavefunction::~MixedWavefunction() = default;

void MixedWavefunction::allocate_buffer() {
  //  distr_buffer.allocate_buffer();
}

MixedWavefunction::MixedWavefunction(const MixedWavefunction &source)
    : m_child_communicator(source.m_child_communicator), m_vibSpace(source.m_vibSpace), m_vibBasis(source.m_vibBasis),
      m_elDim(source.m_elDim), m_prototype(source.m_prototype), distr_buffer(source.distr_buffer) {
  distr_buffer.reset(new molpro::linalg::array::DistrArrayMPI3(
      std::make_unique<molpro::linalg::array::util::Distribution<molpro::linalg::array::DistrArrayMPI3::index_type>>(
          source.distr_buffer->distribution()),
      source.distr_buffer->communicator()));
  *distr_buffer = *source.distr_buffer;
}

MixedWavefunction & MixedWavefunction::operator=(const std::map<size_t,double> &source) {
  auto& x = *distr_buffer;
      x.fill(0);
      auto lb = x.local_buffer();
      auto start = lb->start();
      for (const auto &v : source)
      if (v.first >= start and v.first < start + lb->size())
      (*lb)[v.first - start] = v.second;
      return *this;
}

MixedWavefunction::MixedWavefunction(const MixedWavefunction &source, int option) : MixedWavefunction(source) {}

Wavefunction MixedWavefunction::wavefunctionAt(size_t iVib, MPI_Comm commun) const {
  auto wfn = Wavefunction{m_prototype, 0, commun};
  wfn.allocate_buffer();
  if (distr_buffer.get() != nullptr)
    copy_to_local(*this, iVib, wfn);
  return wfn;
}

void MixedWavefunction::ga_wfn_block_bound(int iVib, int *lo, int *hi, int dimension) {
  lo[0] = iVib * dimension;
  hi[0] = lo[0] + dimension;
}

void MixedWavefunction::copy_to_local(const MixedWavefunction &w, int iVib, Wavefunction &wfn) {
  auto p = profiler->push("copy_to_local");
  double *buffer = wfn.buffer.data();
  auto dimension = wfn.dimension;
  int lo, hi, ld = dimension;
  w.ga_wfn_block_bound(iVib, &lo, &hi, dimension);
  w.distr_buffer->get(lo, hi, buffer);
  return;
}

void MixedWavefunction::put(int iVib, Wavefunction &wfn) {
  auto p = profiler->push("put");
  double *buffer = wfn.buffer.data();
  auto dimension = wfn.dimension;
  int lo, hi, ld = dimension;
  ga_wfn_block_bound(iVib, &lo, &hi, dimension);
  distr_buffer->put(lo, hi, buffer);
}

void MixedWavefunction::accumulate(int iVib, Wavefunction &wfn) {
  auto p = profiler->push("accumulate");
  double *buffer = wfn.buffer.data();
  auto dimension = wfn.dimension;
  int lo, hi, ld = dimension;
  ga_wfn_block_bound(iVib, &lo, &hi, dimension);
  (*distr_buffer).acc(lo, hi, buffer);
}

void MixedWavefunction::operatorOnWavefunction(const MixedOperatorSecondQuant &ham, const MixedWavefunction &w,
                                               bool parallel_stringset, bool with_sync) {
  if (with_sync)
    DivideTasks(std::numeric_limits<size_t>::max(), 1, 1, distr_buffer->communicator());
  auto prof = profiler->push("MixedWavefunction::operatorOnWavefunction");
  auto res = Wavefunction{m_prototype, 0, m_child_communicator};
  std::unique_ptr<Wavefunction> res2;
  auto ketWfn = Wavefunction{m_prototype, 0, m_child_communicator};
  bool zeroed = false;
  res.allocate_buffer();
  if (!ham.elHam2.empty()) {
    res2 = std::make_unique<Wavefunction>(m_prototype, 0, m_child_communicator);
    res2->allocate_buffer();
  }
  ketWfn.allocate_buffer();
  for (const auto &bra : m_vibBasis) {
    auto iBra = m_vibBasis.index(bra);
    // Purely electronic operators
    if (NextTask(distr_buffer->communicator()) && !ham.elHam.empty()) {
      auto p = profiler->push("Hel");
      copy_to_local(w, iBra, ketWfn);
      if (!zeroed) {
        res.zero();
        zeroed = true;
      }
      for (const auto &hel : ham.elHam) {
        auto p = profiler->push(hel.first);
        auto op = hel.second.get();
        res.operatorOnWavefunction(*op, ketWfn, parallel_stringset);
      }
    }
    // Purely electronic operators applied twice
    if (NextTask(distr_buffer->communicator()) && !ham.elHam2.empty()) {
      auto p = profiler->push("Hel2");
      copy_to_local(w, iBra, ketWfn);
      if (!zeroed) {
        res.zero();
        zeroed = true;
      }
      for (const auto &hel : ham.elHam2) {
        auto p = profiler->push(hel.first);
        auto op = hel.second.get();
        res2->zero();
        res2->operatorOnWavefunction(*op, ketWfn, parallel_stringset);
        res.operatorOnWavefunction(*op, *res2, parallel_stringset);
      }
    }
    // Purely vibrational operators
    if (NextTask(distr_buffer->communicator())) {
      auto p = profiler->push("Hvib");
      if (!zeroed) {
        res.zero();
        zeroed = true;
      }
      for (const auto &vibEl : ham.Hvib.tensor) {
        auto val = vibEl.second.oper;
        auto ket = bra.excite(vibEl.second.exc);
        if (!ket.withinSpace(m_vibSpace))
          continue;
        auto iKet = m_vibBasis.index(ket);
        copy_to_local(w, iKet, ketWfn);
        res.axpy(val, ketWfn);
      }
    }
    // Mixed operators
    for (const auto &ket : m_vibBasis) {
      auto p = profiler->push("Hmixed");
      auto iKet = m_vibBasis.index(ket);
      if (!ham.connected(bra, ket))
        continue;
      if (!NextTask(distr_buffer->communicator()))
        continue;
      copy_to_local(w, iKet, ketWfn);
      if (!zeroed) {
        res.zero();
        zeroed = true;
      }
      for (const auto &mixedTerm : ham.mixedHam) {
        const auto &vibTensor = mixedTerm.second;
        for (const auto &vibEl : vibTensor.tensor) {
          auto &p_op = vibEl.second.oper;
          auto connected_ket = bra.excite(vibEl.second.exc);
          if (connected_ket != ket)
            continue;
          auto op = p_op.get();
          res.operatorOnWavefunction(*op, ketWfn, parallel_stringset);
        }
      }
    }
    if (zeroed) {
      accumulate(iBra, res);
      zeroed = false;
    }
  }
  if (with_sync)
    distr_buffer->sync();
}

void MixedWavefunction::diagonalOperator(const MixedOperatorSecondQuant &ham, bool parallel_stringset) {
  auto p = profiler->push("MixedWavefunction::diagonalOperator");
  distr_buffer->zero();
  DivideTasks(std::numeric_limits<size_t>::max(), 1, 1, distr_buffer->communicator());
  auto res = Wavefunction{m_prototype, 0, m_child_communicator};
  auto wfn = Wavefunction{m_prototype, 0, m_child_communicator};
  res.allocate_buffer();
  wfn.allocate_buffer();
  for (const auto &bra : m_vibBasis) {
    auto iBra = m_vibBasis.index(bra);
    // Purely electronic operators
    if (NextTask(distr_buffer->communicator())) {
      res.zero();
      for (const auto &hel : ham.elHam) {
        auto op = hel.second.get();
        res.diagonalOperator(*op);
      }
      accumulate(iBra, res);
    }
    // Pure vibrational operator
    if (NextTask(distr_buffer->communicator())) {
      res.zero();
      for (const auto &vibEl : ham.Hvib.tensor) {
        auto val = vibEl.second.oper;
        auto &vibExc = vibEl.second.exc;
        auto ket = bra.excite(vibExc);
        if (ket != bra)
          continue;
        res += val;
      }
      accumulate(iBra, res);
    }
    // all mixed vibrational - electronic operators
    for (const auto &mixedTerm : ham.mixedHam) {
      for (const auto &vibEl : mixedTerm.second.tensor) {
        auto p_op = vibEl.second.oper;
        auto &vibExc = vibEl.second.exc;
        auto ket = bra.excite(vibExc);
        if (ket != bra)
          continue;
        if (!NextTask(distr_buffer->communicator()))
          continue;
        res.zero();
        auto op = p_op.get();
        res.diagonalOperator(*op);
        accumulate(iBra, res);
      }
    }
  }
  distr_buffer->sync();
}

bool MixedWavefunction::compatible(const MixedWavefunction &other) const {
  bool sameSize = (m_vibBasis.vibDim() == other.m_vibBasis.vibDim());
  if (!distr_buffer->compatible(*other.distr_buffer))
    return false;
  bool sameVibBasis = (m_vibSpace == other.m_vibSpace);
  bool sameElectronicWfn = m_prototype.compatible(other.m_prototype);
  return sameSize && sameElectronicWfn && sameVibBasis;
}

std::vector<double> MixedWavefunction::vibDensity() {
  auto nM = m_vibSpace.nModal;
  auto size = nM * nM;
  auto dm = std::vector<double>(size, 0.);
  auto bra = Wavefunction{m_prototype, 0, m_child_communicator};
  auto ket = Wavefunction{m_prototype, 0, m_child_communicator};
  bra.allocate_buffer();
  ket.allocate_buffer();
  int local_i = -1;
  int local_j = -1;
  auto norm = dot(*this);
  if (std::abs(norm) < 1.0e-8)
    throw std::runtime_error("Norm of wavefunction is too small, " + std::to_string(norm));
  DivideTasks(size, 1, 1, distr_buffer->communicator());
  for (size_t i = 0; i < nM; ++i) {
    for (size_t j = 0; j <= i; ++j) {
      if (NextTask(distr_buffer->communicator())) {
        if (local_i != i)
          copy_to_local(*this, i, bra);
        local_i = i;
        if (local_j != i)
          copy_to_local(*this, j, ket);
        local_j = j;
        dm[i * nM + j] = dm[j * nM + i] = bra.dot(ket) / norm;
      }
    }
  }
  // reduce the whole array together
  MPI_Allreduce(MPI_IN_PLACE, dm.data(), size, MPI_DOUBLE, MPI_SUM, distr_buffer->communicator());
  return dm;
}
double MixedWavefunction::dot(const MixedWavefunction &w) const { return distr_buffer->dot(*w.distr_buffer); }
void MixedWavefunction::axpy(double a, const MixedWavefunction &w) { distr_buffer->axpy(a, *w.distr_buffer); }
void MixedWavefunction::sync() const { distr_buffer->sync(); }
void MixedWavefunction::zero() { distr_buffer->zero(); }
size_t MixedWavefunction::size() const { return distr_buffer->size(); }
double MixedWavefunction::at(size_t i) const { return distr_buffer->at(i); }
void MixedWavefunction::set(size_t i, double v) { distr_buffer->set(i, v); }
void MixedWavefunction::divide(const MixedWavefunction *y, const MixedWavefunction *z, double shift, bool append,
                               bool negative) {
  distr_buffer->divide(*y->distr_buffer, *z->distr_buffer, shift, append, negative);
}
std::vector<size_t> MixedWavefunction::minlocN(int n) const { return distr_buffer->min_loc_n(n); }
double MixedWavefunction::dot(const std::map<size_t, double> &w) const { return distr_buffer->dot(w); }
void MixedWavefunction::axpy(double a, const std::map<size_t, double> &w) { distr_buffer->axpy(a, w); }
void MixedWavefunction::scal(double a) { distr_buffer->scal(a); }
void MixedWavefunction::fill(double a) { distr_buffer->fill(a); }

MixedWavefunction &MixedWavefunction::operator=(const MixedWavefunction &source) {
  m_vibSpace = source.m_vibSpace;
  m_child_communicator = source.m_child_communicator;
  m_elDim = source.m_elDim;
  m_prototype = source.m_prototype;
  m_vibBasis = source.m_vibBasis;
  *distr_buffer = *source.distr_buffer;
  return *this;
}

// bool MixedWavefunction::compatible(const Array &other) const {
//    auto other_wfn = dynamic_cast<const MixedWavefunction *>(&other);
//    if (other_wfn == nullptr) return Array::compatible(other);
//    else return compatible(*other_wfn);
//}

} // namespace gci
} // namespace molpro
