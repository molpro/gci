#ifndef GCIDETERMINANT_H
#define GCIDETERMINANT_H
#include "molpro/gci/gci.h"
#include "molpro/gci/gciState.h"
#include "molpro/gci/gciString.h"
#include <vector>

namespace molpro {
namespace gci {
/*!
 \brief
A Slater determinant
*/
class Determinant : public State {
public:
  /*!
 \brief

 \param State some object from which to copy number of electrons etc for bound checking
 \param alpha Alpha string
 \param beta Beta string
*/
  explicit Determinant(const State *State = nullptr, const String *alpha = nullptr, const String *beta = nullptr);

  /*!
     \brief

     \param orbital Add an orbital to the determinant. Negative means beta spin.
     \return int On exit, the phase change required to bring the determinant into canonical form is returned (plus or
     minus 1), or else zero if the orbital was already present in the determinant.
    */
  int create(int orbital);
  /*!
     \brief

     \param orbital Remove an orbital from the determinant. Negative means beta spin
     \return int On exit, return 1 if successful (orbital was in the determinant originally) or 0 if not (it wasn't)
    */
  int destroy(int orbital);
  /*!
   * \brief Set to the canonically first determinant
   */
  void first() { throw std::logic_error("unimplemented"); }
  /*!
     \brief
    Advance to the canonically next determinant
     \return false if the end of the set is reached.
    */
  bool next() { throw std::logic_error("unimplemented"); }

  /*!
   * \brief Genenerate a printable representation of the object
   * \param verbosity How much to print
   * \param columns Page width
   * \return
   */
  std::string str(int verbosity = 0, unsigned int columns = UINT_MAX) const override;

  String stringAlpha; /*!< The String of alpha-spin orbitals that make up the determinant */
  String stringBeta;  /*!< The String of beta-spin orbitals that make up the determinant */

private:
  friend class Operator;
};
} // namespace gci
} // namespace molpro

#endif // GCIDETERMINANT_H
