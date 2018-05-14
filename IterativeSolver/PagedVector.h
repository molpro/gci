#ifndef PAGEDVECTOR_H
#define PAGEDVECTOR_H

#include "LinearAlgebra.h"
#include "Storage.h"
#include <algorithm>
#include <limits>
#include <stdexcept>
#include <string.h>
#include <cstddef>
#include <unistd.h>
#include <fstream>

#ifdef USE_MPI
#include <mpi.h>
#else
using MPI_Comm = int;
constexpr MPI_Comm MPI_COMM_WORLD=0;
constexpr MPI_Comm MPI_COMM_NULL=0;
#endif
extern MPI_Comm MPI_Comm_PagedVector;
MPI_Comm MPI_Comm_PagedVector=MPI_COMM_WORLD;

namespace LinearAlgebra {

 /*!
   * \brief A class that implements LinearAlgebra::vector<scalar> with data optionally held on backing store, and optionally distributed
   * over MPI ranks
   */
 template <class scalar=double  , class Allocator =
          #ifdef MEMORY_MEMORY_H
           memory::allocator<scalar>
          #else
           std::allocator<scalar>
          #endif
>
 class PagedVector : public LinearAlgebra::vector<scalar>
 {
//  static constexpr size_t default_offline_buffer_size=102400; ///< default buffer size if in offline mode
#define default_offline_buffer_size 2
 public:
  /*!
   * \brief Construct an object without any data.
   */
  PagedVector(size_t length=0, int option=0, MPI_Comm mpi_communicator=MPI_Comm_PagedVector)
   : LinearAlgebra::vector<scalar>(), m_size(length),
     m_mpi_size(mpi_size()), m_mpi_rank(mpi_rank()), m_communicator(mpi_communicator),
     m_replicated(!(LINEARALGEBRA_CLONE_ADVISE_DISTRIBUTED & option)),
     m_segment_offset(m_replicated ? 0 : ((m_size-1) / m_mpi_size + 1) * m_mpi_rank),
     m_segment_length(m_replicated ? m_size : std::min( (m_size-1) / m_mpi_size + 1, m_size-m_segment_offset)),
     m_cache(m_segment_length)
  {
//   init(option);
    m_cache.preferred_length = (LINEARALGEBRA_CLONE_ADVISE_OFFLINE & option) ? default_offline_buffer_size : m_segment_length;
   std::cout << m_mpi_rank << " in constructor m_segment_length="<<m_segment_length<<std::endl;
  }
  PagedVector(const PagedVector& source, int option=0, MPI_Comm mpi_communicator=MPI_Comm_PagedVector)
   : LinearAlgebra::vector<scalar>(), m_size(source.m_size),
     m_mpi_size(mpi_size()), m_mpi_rank(mpi_rank()), m_communicator(mpi_communicator),
     m_replicated(!(LINEARALGEBRA_CLONE_ADVISE_DISTRIBUTED & option)),
     m_segment_offset(m_replicated ? 0 : ((m_size-1) / m_mpi_size + 1) * m_mpi_rank),
     m_segment_length(m_replicated ? m_size : std::min( (m_size-1) / m_mpi_size + 1, m_size-m_segment_offset)),
     m_cache(m_segment_length)
  {
//   init(option);
//   std::cout << "in copy constructor, before copy, source: "<<source.str()<<std::endl;
   std::cout << m_mpi_rank << " in copy constructor m_segment_length="<<m_segment_length<<std::endl;
    m_cache.preferred_length = (LINEARALGEBRA_CLONE_ADVISE_OFFLINE & option) ? default_offline_buffer_size : m_segment_length;
   *this = source;
//   std::cout << "in copy constructor, after copy, source: "<<source.str()<<std::endl;
  }

  virtual ~PagedVector()
  {}

  // Every child of LinearAlgebra::vector<scalar> needs exactly this
  PagedVector* clone(int option=0) const {// std::cout << "in PagedVector clone, option="<<option<<std::endl;
                                           return new PagedVector(*this, option); }

  /*!
     * \brief Specify a cache size for manipulating the data
     * \param length
     */
  void setCacheSize(size_t length) const
  {
   m_cache.move(0,length);
  }
  /*!
     * \brief Whether a full copy of data is replicated on every MPI process
     * \return
     */
  bool replicated() const { return m_replicated;}

 private:
  int mpi_size() {
#ifdef USE_MPI
   int result;
   MPI_Comm_size(m_communicator, &result);
#else
    int result=1;
#endif
    return result;
  }
  int mpi_rank() {
#ifdef USE_MPI
   int result;
   MPI_Comm_rank(m_communicator, &result);
#else
    int result=1;
#endif
    return result;
  }
  size_t seglength(size_t length){
   return length;
  }
  void init(int option)
  {
   m_replicated = true;
#ifdef USE_MPI
//   std::cout << "option="<<option<<std::endl;
    MPI_Comm_size(m_communicator, &m_mpi_size);
    MPI_Comm_rank(m_communicator, &m_mpi_rank);
   if(LINEARALGEBRA_CLONE_ADVISE_DISTRIBUTED & option) m_replicated=false;
#else
    m_mpi_size=1;
    m_mpi_rank=0;
#endif
//    if (m_mpi_rank==0) std::cout << "m_size="<<m_size<< ", m_mpi_size="<<m_mpi_size<<", m_replicated="<<m_replicated<<std::endl;
    if (m_replicated) {
     m_segment_offset=0;
     m_segment_length=m_size;
    } else {
     m_segment_offset = ((m_size-1) / m_mpi_size + 1) * m_mpi_rank;
     m_segment_length = std::min( (m_size-1) / m_mpi_size + 1, m_size-m_segment_offset);
    }
    m_cache.preferred_length = (LINEARALGEBRA_CLONE_ADVISE_OFFLINE & option) ? default_offline_buffer_size : m_segment_length;
    m_cache.move(0);
//   std::cout << "new PagedVector m_size="<<m_size<<", option="<<option<<" cache size="<<m_cache.length<<std::endl;
//    std::cout << "m_mpi_rank="<<m_mpi_rank<< ", m_segment_offset="<<m_segment_offset<<", m_segment_length="<<m_segment_length<<std::endl;
  }

  size_t m_size; //!< How much data
  const MPI_Comm m_communicator; //!< the MPI communicator for distributed data
  int m_mpi_size;
  int m_mpi_rank;
  bool m_replicated; //!< whether a full copy of data is on every MPI process
  size_t m_segment_offset; //!< offset in the overall data object of this process' data
  size_t m_segment_length; //!< length of this process' data

  struct window {
   mutable size_t offset; ///< the offset in mapped data of the first element of the cache window
   mutable size_t length;///< the size of the cache window
   size_t preferred_length; ///< the default for the size of the cache window
   const size_t datasize; ///< the size of the vector being mapped
   mutable std::vector<scalar> buffer;
   const scalar* begin() const { return buffer.data();}
   const scalar* end() const { return buffer.data()+length;}
   scalar* begin() {return buffer.data();}
   scalar* end() {return buffer.data()+length;}
   mutable bool dirty;
   mutable std::fstream m_file;
   mutable size_t filesize;
   window(size_t datasize, size_t length=default_offline_buffer_size)
    :  datasize(datasize), preferred_length(length), filesize(0), offset(0), length(0), dirty(false) {
    std::cout << "window constructor datasize="<<datasize<<", length="<<length<<std::endl;
    char *tmpname=strdup("tmpfileXXXXXX");
    mkstemp(tmpname);
    m_file.open (tmpname, std::ios::out | std::ios::in | std::ios::binary);
    if (!m_file.is_open() ) throw std::runtime_error(std::string("Cannot open cache file ")+tmpname);
    unlink(tmpname);
    free(tmpname);
    move(0,length);
//    std::cout << "window constructor ends, filesize="<<filesize<<", length="<<length<<std::endl;
   }

   void move(const size_t offset, size_t length=0) const {
    if (!length) length=preferred_length;
//    std::cout << "move offset="<<offset<<", length="<<length<<", this->length="<<this->length<<", this->offset="<<this->offset<<std::endl;
    if (dirty && this->length) {
     m_file.seekp(this->offset*sizeof(scalar));
//     std::cout << "write to "<<this->offset<<":";for (size_t i=0; i<this->length; i++) std::cout <<" "<<buffer[i]; std::cout <<std::endl;
     m_file.write( (const char*)buffer.data(), this->length*sizeof(scalar));
     if (filesize < this->offset+this->length) filesize = this->offset+this->length;
    }
    this->offset = offset;
    this->length = std::min(length,static_cast<size_t>(datasize-offset));
    buffer.resize(this->length);
//    std::cout << "buffer resized to length="<<this->length<<"; offset="<<offset<<", filesize="<<filesize<<std::endl;
    if (std::min(this->length,static_cast<size_t>(filesize-offset))) {
     m_file.seekg(offset*sizeof(scalar));
     m_file.read((char*)buffer.data(),std::min(this->length,static_cast<size_t>(filesize-offset))*sizeof(scalar));
//     std::cout << "read from "<<this->offset<<":";for (size_t i=0; i<this->length; i++) std::cout <<" "<<buffer[i]; std::cout <<std::endl;
   }
    dirty=false;
  }

   void ensure(const size_t offset) const {
    if (offset < this->offset || offset >= this->offset+this->length) move(offset,this->preferred_length);
   }

   ~window() {
    move(filesize,0);
    m_file.close();
   }

   const window& operator++() const {
//    std::cout << "operator++ entry offset="<<offset<<", length="<<length<<std::endl;
    move(offset+length,length);
//    std::cout << "operator++ exit  offset="<<offset<<", length="<<length<<std::endl;
    return *this;
   }
  private:
   window operator++(int) {return this;}
  };
 public:
  window m_cache;

 private:
  void flushCache() {m_cache.ensure(0);}

 public:

  /*!
   * \brief Place the contents
   * \param buffer
   * \param length
   * \param offset
   */
  void put(scalar* const buffer, size_t length, size_t offset)
  {
   size_t buffer_offset=0;
   if (offset < m_segment_offset) { buffer_offset = m_segment_offset-offset; offset = m_segment_offset; length -= m_segment_offset-offset;}
   if (offset+length > std::min(m_size,m_segment_offset+m_segment_length)) length = std::min(m_size,m_segment_offset+m_segment_length)-offset;
   offset-=this->m_segment_offset;
   size_t off=offset;
   //       std::cout << "in put, m_segment_offset "<<m_segment_offset<<", m_segment_length="<<m_segment_length<<std::endl;
   for (m_cache.move(off); off < offset+length && m_cache.length; ++m_cache, off += m_cache.length) {
    //       std::cout << "in put, cache window "<<m_cache.offset<<", length="<<m_cache.length<<std::endl;
    //       std::cout << "buffer_offset="<<buffer_offset<<", offset="<<offset<<", off="<<off<<std::endl;
    //       std::cout << "offset+length-m_cache.offset="<<offset+length-m_cache.offset<<", m_cache.length="<<m_cache.length
    //                 <<", loop limit="<<std::min(offset+length-m_cache.offset,m_cache.length)<<std::endl;
    for (size_t k=0; k<std::min(offset+length-m_cache.offset,m_cache.length); k++)
     m_cache.buffer[k] = buffer[buffer_offset-offset+off+k];
    //    std::cout << "cache buffer:";  for (size_t k=0; k<std::min(offset+length-m_cache.offset,m_cache.length); k++) std::cout << " "<<m_cache.buffer[k]; std::cout << std::endl;
    m_cache.dirty = true;
   }
  }

  void get(scalar* buffer, size_t length, size_t offset) const
  {
   size_t buffer_offset=0;
   if (offset < m_segment_offset) { buffer_offset = m_segment_offset-offset; offset = m_segment_offset; length -= m_segment_offset-offset;}
   if (offset+length > std::min(m_size,m_segment_offset+m_segment_length)) length = std::min(m_size,m_segment_offset+m_segment_length)-offset;
   offset-=this->m_segment_offset;
   size_t off=offset;
   for (m_cache.move(off); off < offset+length && m_cache.length; ++m_cache, off += m_cache.length)
    for (size_t k=0; k<std::min(offset+length-m_cache.offset,m_cache.length); k++)
     buffer[buffer_offset-offset+off+k] = m_cache.buffer[k];
  }


  const scalar& operator[](size_t pos) const
  {
   if (pos >= m_cache.offset+m_segment_offset+m_cache.length || pos < m_cache.offset+m_segment_offset) { // cache not mapping right sector
//    std::cout << "cache miss"<<std::endl;
    if (pos >= m_segment_offset+m_segment_length || pos < m_segment_offset) throw std::logic_error("operator[] finds index out of range");
    m_cache.move(pos-m_segment_offset);
//    std::cout << "cache offset="<<m_cache.offset<<", cache length=" <<m_cache.length<<std::endl;
   }
   return m_cache.buffer[pos-m_cache.offset-m_segment_offset];
  }

  scalar& operator[](size_t pos)
  {
   scalar* result;
   result = &const_cast<scalar&>(static_cast<const PagedVector*>(this)->operator [](pos));
   m_cache.dirty=true;
   return *result;
  }

  size_t size() const {return m_size;}

  std::string str(int verbosity=0, unsigned int columns=UINT_MAX) const {
   std::ostringstream os; os << "PagedVector object:";
   for (size_t k=0; k<m_segment_length; k++)
    os <<" "<< (*this)[m_segment_offset+k];
   os << std::endl;
   return os.str();
  }

  /*!
   * \brief Add a constant times another object to this object
   * \param a The factor to multiply.
   * \param other The object to be added to this.
   * \return
   */
  void axpy(scalar a, const LinearAlgebra::vector<scalar> *other)
  {
   const PagedVector* othe=dynamic_cast <const PagedVector*> (other);
//   std::cout << "PagedVector::axpy this="<<*this<<std::endl;
//   std::cout << "PagedVector::axpy othe="<<*othe<<std::endl;
   if (this->variance() != othe->variance()) throw std::logic_error("mismatching co/contravariance");
   if (this->m_size != m_size) throw std::logic_error("mismatching lengths");
   if (this->m_replicated != othe->m_replicated) throw std::logic_error("mismatching replication status");
   for (m_cache.ensure(0), othe->m_cache.move(0,m_cache.length); m_cache.length; ++m_cache, ++othe->m_cache ) {
     for (size_t i=0; i<m_cache.length; i++)
      m_cache.buffer[i] += a * othe->m_cache.buffer[i];
     m_cache.dirty = true;
   }
  }

  /*!
   * \brief Scalar product of two objects.
   * \param other The object to be contracted with this.
   * \return
   */
  scalar dot(const vector<scalar> *other) const
  {
   const PagedVector* othe=dynamic_cast <const PagedVector*> (other);
   if (this->variance() * othe->variance() < 0) throw std::logic_error("mismatching co/contravariance");
   if (this->m_size != m_size) throw std::logic_error("mismatching lengths");
   if (this->m_replicated != othe->m_replicated) throw std::logic_error("mismatching replication status");
   scalar result=0;
   if (this == other) {
    std::cout <<m_mpi_rank<<" dot self="<<std::endl;
    for (m_cache.ensure(0); m_cache.length; ++m_cache) {
    std::cout <<m_mpi_rank<<" dot self cache length ="<<m_cache.length<<", offset="<<m_cache.offset<<std::endl;
     for (size_t i=0; i<m_cache.length; i++) {
      std::cout <<m_mpi_rank<< " take i="<<i<<", buffer[i]="<<m_cache.buffer[i]<<std::endl;
      result += m_cache.buffer[i] * m_cache.buffer[i];
     }
    }
   } else {
    for (m_cache.ensure(0), othe->m_cache.move(0,m_cache.length); m_cache.length; ++m_cache, ++othe->m_cache ) {
     for (size_t i=0; i<m_cache.length; i++)
      result += m_cache.buffer[i] * othe->m_cache.buffer[i];
    }
   }
#ifdef USE_MPI
    std::cout <<m_mpi_rank<<" dot result before reduce="<<result<<std::endl;
   if (!m_replicated)
    MPI_Allreduce(&result,&result,1,MPI_DOUBLE,MPI_SUM,m_communicator); // FIXME needs attention for non-double
    std::cout <<m_mpi_rank<<" dot result after reduce="<<result<<std::endl;
#endif
   return result;
  }

  /*!
     * \brief scal Scale the object by a factor.
     * \param a The factor to scale by.
     */
  void scal(scalar a)
  {
   for (m_cache.ensure(0); m_cache.length; ++m_cache) {
     for (size_t i=0; i<m_cache.length; i++)
      m_cache.buffer[i] *= a;
     m_cache.dirty=true;
   }
  }

  /*!
   * \brief Set the contents of the object to zero.
   */
  void zero()
  {
   for (m_cache.ensure(0); m_cache.length; ++m_cache) {
     for (size_t i=0; i<m_cache.length; i++)
      m_cache.buffer[i] = 0;
     m_cache.dirty=true;
   }
  }

  /*!
   * \brief Copy from one object to another, adjusting size if needed.
   * \param other The source of data.
   * \return
   */
  PagedVector& operator=(const PagedVector& other)
  {
   m_size=other.m_size;
   this->setVariance(other.variance());
    for (m_cache.ensure(m_segment_offset), other.m_cache.move(other.m_segment_offset,m_cache.length); m_cache.length && other.m_cache.length; ++m_cache, ++other.m_cache ) {
//     std::cout << "buffer to copy in range "<<m_cache.offset<<"="<<other.m_cache.offset<<" for "<<m_cache.length<<"="<<other.m_cache.length<<std::endl;
//     for (size_t i=0; i<m_cache.length; i++) std::cout <<" "<<other.m_cache.buffer[i]; std::cout <<std::endl;
     for (size_t i=0; i<m_cache.length; i++)
      m_cache.buffer[i] = other.m_cache.buffer[i];
     m_cache.dirty = true;
    }
#ifdef USE_MPI
   if (m_replicated && ! other.m_replicated) { // replicated <- distributed
     size_t lenseg = ((m_size-1) / m_mpi_size + 1);
    for (int rank=0; rank < m_mpi_size; rank++) {
     size_t off = lenseg * rank;
     for (m_cache.ensure(off); m_cache.length && off < lenseg*(rank+1); off+= m_cache.length, ++m_cache)
      MPI_Bcast(m_cache.buffer.data(),m_cache.length,MPI_DOUBLE,rank,m_communicator); // needs attention for non-double
    }
   }
#endif
   return *this;
  }


 };
 template <class scalar>
 inline std::ostream& operator<<(std::ostream& os, PagedVector<scalar> const& obj) { return os << obj.str(); }

 template <class scalar>
 class PagedVectorTest  {
 public:
  PagedVectorTest(size_t n, int option=3) {
   PagedVector<scalar> v1(n,option);
   std::cout << "PagedVectorTest, n="<<n<<", replicated="<<v1.replicated()<<std::endl;
   std::vector<scalar> vv;
   for (size_t i=0; i<v1.size(); i++)
    vv.push_back(i);
   v1.put(vv.data(),vv.size(),0);
   std::cout << "v1 after assign: "<<v1<<std::endl;
   PagedVector<scalar> v2(v1,option);
   //  std::cout << "v1 after assigning v2: "<<v1<<std::endl;
   //  std::cout << "v2 after assigning v2: "<<v2<<std::endl;
   v1.m_cache.move(0);
   //  std::cout << "v1 "<<v1.str()<<std::endl;
   //  std::cout << "v2 "<<v2.str()<<std::endl;
   std::cout << "v1.v2 error: " <<v2.dot(&v1)-(n*(n-1)*(2*n-1))/6 << std::endl;
   std::cout << "v1.v1 error: " <<v1.dot(&v1)-(n*(n-1)*(2*n-1))/6 << std::endl;
  }

};
}
#endif // PAGEDVECTOR_H