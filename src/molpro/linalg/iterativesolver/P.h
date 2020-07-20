#ifndef LINEARALGEBRA_SRC_MOLPRO_LINALG_P_H_
#define LINEARALGEBRA_SRC_MOLPRO_LINALG_P_H_
#include <map>

template <class value_type = double, class scalar_type = value_type>
class P {
  using Pvector = std::map<size_t, value_type>;
  std::vector<scalar_type> m_metric;
  std::vector<scalar_type> m_action;
  std::vector<scalar_type> m_rhs;
  std::vector<Pvector> m_vectors;

public:
  P() {}

  const scalar_type& metric(int i, int j) const { return m_metric[m_vectors.size() * j + i]; }

  const scalar_type& action(int i, int j) const { return m_action[m_vectors.size() * j + i]; }

  size_t size() const { return m_vectors.size(); }

  const Pvector& operator[](int i) const { return m_vectors[i]; }

  /*!
   * @brief Add a new vector to the space. Also compute and store the new elements of the overlap and action
   * matrices
   * @param Pvectors the vectors to add
   * @param PP Matrix projected onto the existing+new, new P space. It should be provided as a
   * 1-dimensional array, with the existing+new index running fastest.
   */
   template <class slowvector>
  void add(const std::vector<Pvector>& Pvectors, const scalar_type* PP, const std::vector<slowvector>& rhs) {
    auto old_size = m_vectors.size();
    auto new_size = m_vectors.size() + Pvectors.size();
    {
      std::vector<scalar_type> new_metric(new_size * new_size);
      std::vector<scalar_type> new_action(new_size * new_size);
      std::vector<scalar_type> new_rhs(new_size * rhs.size());
      for (int i = 0; i < old_size; i++) {
        for (int j = 0; j < old_size; j++) {
          new_metric[i * new_size + j] = m_metric[i * old_size + j];
          new_action[i * new_size + j] = m_action[i * old_size + j];
        }
        for (int j = 0; j < rhs.size() ; j++) {
          new_rhs[i + new_size * j] = m_action[i + old_size * j];
        }
      }
      for (int i = 0; i < Pvectors.size(); i++) {
        for (int j = 0; j < new_size; j++)
          new_action[j * new_size + (i + old_size)] = new_action[j + new_size * (i + old_size)] = PP[new_size * j + i];
        m_vectors.push_back(Pvectors[i]);
        for (int j = 0; j < m_vectors.size(); j++) {
          scalar_type overlap = 0;
          for (const auto& p : Pvectors[i]) {
            if (m_vectors[j].count(p.first))
              overlap += p.second * m_vectors[j][p.first];
          }
          new_metric[j * new_size + (i + old_size)] = new_metric[j + new_size * (i + old_size)] = overlap;
        }
        for (int j = 0; j < rhs.size() ; j++) {
          new_rhs[i+old_size + new_size * j] = rhs[j].dot(m_vectors[i]);
        }
      }
      m_metric = new_metric;
      m_action = new_action;
      m_rhs = new_rhs;
    }
  }
};

#endif // LINEARALGEBRA_SRC_MOLPRO_LINALG_P_H_