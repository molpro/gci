#ifndef GCI_SRC_MOLPRO_GCI_ARRAY_DISTRARRAYMPI3_H
#define GCI_SRC_MOLPRO_GCI_ARRAY_DISTRARRAYMPI3_H
#include "molpro/gci/array/DistrArray.h"
#include <mpi.h>

namespace molpro {
namespace gci {
namespace array {

/*!
 * @brief Implementation of distributed array using MPI3 RMA operations
 *
 * The array buffer is a window which is open for all processes on creation and
 * remains open until the destruction of the array.
 *
 * @warning Care must be taken that overlapping put and get operations or local buffer modifications
 * do not cause undefined behaviour.
 *
 * @todo I should make implementation more robust by applying properly utilising locks. Current implementation is
 * equivalent to fencing.
 *
 */
class DistrArrayMPI3 : public DistrArray {
protected:
  class DistributionMPI3;
  MPI_Win m_win = MPI_WIN_NULL; //!< window object
  //! distribution of array buffer among processes. Stores start index and size for each
  std::unique_ptr<DistributionMPI3> m_distribution;
  bool m_allocated = false; //!< whether the window has been created

public:
  DistrArrayMPI3() = delete;
  DistrArrayMPI3(DistrArrayMPI3 &&other) = delete;
  DistrArrayMPI3 &operator=(const DistrArrayMPI3 &&) = delete;

  DistrArrayMPI3(size_t dimension, MPI_Comm commun, std::shared_ptr<Profiler> prof = nullptr);
  //! Copy constructor allocates the buffer if source is not empty
  DistrArrayMPI3(const DistrArray &source);
  DistrArrayMPI3(const DistrArrayMPI3 &source);
  DistrArrayMPI3 &operator=(const DistrArray &source);
  DistrArrayMPI3 &operator=(const DistrArrayMPI3 &source);
  ~DistrArrayMPI3() override;

  void sync() const override;
  void allocate_buffer() override;
  bool empty() const override;

protected:
  struct LocalBufferMPI3 : public DistrArray::LocalBuffer {
    explicit LocalBufferMPI3(DistrArrayMPI3 &source);
  };

  class DistributionMPI3 : public DistrArray::Distribution {
  public:
    DistributionMPI3(int n_proc, size_t dimension);
    std::pair<int, int> locate_process(index_type lo, index_type hi) const override;
    std::pair<index_type, size_t> range(int process_rank) const override;

  protected:
    //! start and size for section of array local to each process
    std::vector<std::pair<unsigned long, size_t>> m_proc_range;
    size_t m_dim;
  };

public:
  [[nodiscard]] const Distribution &distribution() const override;
  [[nodiscard]] std::shared_ptr<LocalBuffer> local_buffer() override;
  [[nodiscard]] std::shared_ptr<const LocalBuffer> local_buffer() const override;
  [[nodiscard]] value_type at(index_type ind) const override;
  void set(index_type ind, value_type val) override;
  void get(index_type lo, index_type hi, value_type *buf) const override;
  [[nodiscard]] std::vector<value_type> get(index_type lo, index_type hi) const override;
  void put(index_type lo, index_type hi, const value_type *data) override;
  void acc(index_type lo, index_type hi, const value_type *data) override;
  [[nodiscard]] std::vector<value_type> gather(const std::vector<index_type> &indices) const override;
  void scatter(const std::vector<index_type> &indices, const std::vector<value_type> &data) override;
  void scatter_acc(std::vector<index_type> &indices, const std::vector<value_type> &data) override;
  [[nodiscard]] std::vector<value_type> vec() const override;
  void error(const std::string &message) const override;

protected:
  //! Free the window
  void free_buffer();
  enum class RMAType { get, put, acc, gather, scatter, scatter_acc };
  //! does get or put or accumulate
  void _get_put(index_type lo, index_type hi, const value_type *buf, RMAType option);
  //! does gather or scatter or scatter_acc
  void _gather_scatter(const std::vector<index_type> &indices, std::vector<value_type> &data, RMAType option);
};

namespace util {
//! Atomic lock allowing only one process to acquire it. Implemented using MPI3 RMA.
class LockMPI3 {
protected:
  MPI_Comm m_comm = MPI_COMM_NULL; //! MPI communicator
  MPI_Win m_win = MPI_WIN_NULL;    //! empty window handle
  bool m_locked = false;           //!

public:
  //! Create the lock without acquiring it. This is collective and must be called by all processes in the communicator.
  LockMPI3(MPI_Comm comm);
  //! Release the lock and destroy it. This is collective and must be called by all processes in the communicator.
  ~LockMPI3();

  LockMPI3() = delete;
  LockMPI3(const LockMPI3 &) = delete;
  LockMPI3 &operator=(const LockMPI3 &) = delete;

  //! Acquire exclusive lock
  void lock();

  //! Release the lock
  void unlock();

protected:
  //! Proxy that locks on creation and unlocks on destruction. Useful for locking a scope.
  struct Proxy {
    LockMPI3 &m_lock;
    Proxy(LockMPI3 &);
    Proxy() = delete;
    ~Proxy();

    bool m_deleted = false; //!< whether the lock was already deleted
  };

  //! Keep track of proxy object so that if lock is deleted, the proxy does not try to unlock.
  std::weak_ptr<Proxy> m_proxy;

public:
  //! Return a proxy object that acquires the lock on creation and releases it on destruction. Useful for locking a
  //! scope.
  std::shared_ptr<Proxy> scope();
};
} // namespace util
} // namespace array
} // namespace gci
} // namespace molpro

#endif // GCI_SRC_MOLPRO_GCI_ARRAY_DISTRARRAYMPI3_H
