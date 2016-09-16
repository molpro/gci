#ifndef PARAMETERVECTOR_H
#define PARAMETERVECTOR_H

#include <cstddef>
#include <vector>
#include <iostream>
#ifndef nullptr
#define nullptr NULL
#endif


namespace IterativeSolver {
  typedef double ParameterScalar;

  class ParameterVector
  {
  public:
      /*!
     * \brief Construct an object without any data.
     */
    ParameterVector(size_t length=0);
    virtual ~ParameterVector();
    /*!
     * \brief Add a constant times another object to this object
     * \param a The factor to multiply.
     * \param other The object to be added to this.
     * \return
     */
    virtual void axpy(ParameterScalar a, const ParameterVector& other);
    /*!
     * \brief Scalar product of two objects.
     * \param other The object to be contracted with this.
     * \return
     */
    virtual ParameterScalar operator*(const ParameterVector& other) const;
    /*!
     * \brief Set the contents of the object to zero.
     */
    virtual void zero();
    /*!
     * \brief Copy from one object to another, adjusting size if needed.
     * \param other The source of data.
     * \return
     */
    virtual ParameterVector& operator=(const ParameterVector& other);
    virtual ParameterScalar& operator[](size_t pos) { return this->m_buffer[pos];}
    const virtual ParameterScalar& operator[](size_t pos) const { return this->m_buffer[pos];}
    virtual size_t size() const { return this->m_buffer.size();}
      /*!
     * \brief Record the co/contra-variance status of the object
     * \param variance
     * - -1: covariant vector
     * - +1: contravariant vector
     * - 0: self-dual vector
     * The class is expected to check that appropriate combinations of vectors are provided in methods that perform linear algebra functions.
     */
    void setVariance(int variance=0) {m_variance=variance;}
    int variance() {return m_variance;}
  protected:
  private:
    int m_variance;
    std::vector<ParameterScalar> m_buffer;
  };

 inline std::ostream& operator<<(std::ostream& os, ParameterVector const& pv) {
	 os << "ParameterVector object:";
	 for (size_t k=0; k<pv.size(); k++)
		 os <<" "<< pv[k];
	 os << std::endl;
	 return os;
 }

  class ParameterVectorSetDodgy : private std::vector<ParameterVector>
    {
    public:
  	  ParameterVectorSetDodgy() : std::vector<ParameterVector>() {};
          using std::vector<ParameterVector>::size;
          using std::vector<ParameterVector>::operator[];
          using std::vector<ParameterVector>::iterator;
          using std::vector<ParameterVector>::const_iterator;
          using std::vector<ParameterVector>::begin;
          using std::vector<ParameterVector>::end;
          using std::vector<ParameterVector>::push_back;
          using std::vector<ParameterVector>::pop_back;
          using std::vector<ParameterVector>::resize;
          using std::vector<ParameterVector>::front;
          using std::vector<ParameterVector>::back;

        std::vector<bool> active;
    };
  class ParameterVectorSet
    {
    public:
  	  ParameterVectorSet() {}
  	  size_t size() const { return this->pvs.size();}
  	  ParameterVector& operator[](size_t pos) { return this->pvs[pos];}
  	  const ParameterVector& operator[](size_t pos) const { return pvs[pos];}
  	  ParameterVector& front() { return pvs.front();}
  	  const ParameterVector& front() const { return pvs.front();}
  	  ParameterVector& back() { return pvs.back();}
  	  const ParameterVector& back() const { return pvs.back();}
  	  void push_back(const ParameterVector& val) { pvs.push_back(val); active.push_back(true);}

  	  std::vector<bool> active;
    private:
        std::vector<ParameterVector> pvs;
    };
  inline std::ostream& operator<<(std::ostream& os, const ParameterVectorSet& pvs) {
	  for (size_t k=0; k<pvs.size(); k++)
		  os << pvs[k];
	 return os;
  }

}

#endif // PARAMETERVECTOR_H
