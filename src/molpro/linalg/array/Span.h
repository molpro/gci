#ifndef LINEARALGEBRA_SRC_MOLPRO_LINALG_ARRAY_SPAN_H
#define LINEARALGEBRA_SRC_MOLPRO_LINALG_ARRAY_SPAN_H

namespace molpro {
namespace linalg {
namespace array {

#if __cplusplus > 201703L
#include <span>

//! For those who moved on to c++20
using Span = std::span;

#else

/*!
 * @brief Non-owning container taking a pointer to the data buffer and its size and exposing routines for iteration
 *
 * This is a poor mimic of std::span. If c++20 standard is used than std::span is aliased to Span.
 */
template <typename T = double>
class Span {
public:
  using element_type = T;
  using value_type = std::remove_cv_t<T>;
  using size_type = size_t;
  using difference_type = std::ptrdiff_t;
  using iterator = T*;
  using const_iterator = T const*;

  Span() = default;
  ~Span() = default;
  Span(T* data, size_type size) : m_buffer{data}, m_size{size} {}
  Span(const Span& source) = default;
  Span(Span&& source) : m_buffer{source.m_buffer}, m_size{source.m_size} {
    source.m_buffer = nullptr;
    source.m_size = 0;
  }
  Span& operator=(const Span& source) = default;
  Span& operator=(Span&& source) {
    m_buffer = source.m_buffer;
    m_size = source.m_size;
    source.m_buffer = nullptr;
    source.m_size = 0;
    return *this;
  }

  iterator data() { return m_buffer; }
  const_iterator data() const { return m_buffer; }

  iterator begin() { return m_buffer; }
  const_iterator begin() const { return m_buffer; }
  const_iterator cbegin() const { return m_buffer; }

  iterator end() { return m_buffer + m_size; }
  const_iterator end() const { return m_buffer + m_size; }
  const_iterator cend() const { return m_buffer + m_size; }

  size_type size() const { return m_size; }

  bool empty() const { return m_size == 0; }

protected:
  iterator m_buffer = nullptr;
  size_type m_size = 0;
};

template <typename T>
auto begin(Span<T>& x) {
  return x.begin();
}

template <typename T>
auto begin(const Span<T>& x) {
  return x.begin();
}

template <typename T>
auto end(Span<T>& x) {
  return x.end();
}

template <typename T>
auto end(const Span<T>& x) {
  return x.end();
}
#endif // C++20
} // namespace array
} // namespace linalg
} // namespace molpro

#endif // LINEARALGEBRA_SRC_MOLPRO_LINALG_ARRAY_SPAN_H
