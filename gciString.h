#ifndef GCISTRING_H
#define GCISTRING_H
#include "gci.h"

#include "gciState.h"
#include <vector>

namespace gci {
class StringSet;
/*!
 \brief
A string, which is an ordered set of orbitals
*/
class String : public State
{
  friend class ExcitationSet;
  friend class StringSet;
public:
  /*!
   * \brief String Construct a vacuum object
   * \param State Some State object from which to copy number of electrons etc for bound checking, and to define orbital symmetries
   * \param spin 1=alpha, -1=beta
*/
  String(const State *State=NULL, const int spin=1);
  /*!
   * \brief String Construct from a serialised representation of data
   * \param bytestream representation produced by previous invocation of serialise()
   * \param State Some State object from which to copy number of electrons etc for bound checking, and to define orbital symmetries
   */
  String(const std::vector<char> bytestream, const State* State=NULL);
  /*!
     \brief

     \param orbital Add an orbital to the string.
     \return int On exit, the phase change required to bring the determinant into canonical form is returned (plus or minus 1), or else zero if the orbital was already present in the determinant.
    */
  int create(unsigned int orbital);
  /*!
     \brief

     \param orbital Remove an orbital from the string.
     \return int the phase change required to bring the determinant into canonical form before annihilation is returned (plus or minus 1), or else zero if the orbital was not present in the determinant.
    */
  int destroy(unsigned int orbital);
  /*!
     \brief advance to the canonically next string
    \param sym the desired symmetry of the string. Negative signifies any will do.
     \return whether successful; false if you try to advance the canonically last string
    */
  bool next(int sym=-1);

  /*!
     * \brief Set the string to the vacuum
     */
  void nullify();    /*!
     \brief
    Set to the first string with n objects
    \param n the number of objects. If 0, use whatever we have presently.
    \param sym the desired symmetry of the string. Negative signifies any will do.
    \return false if it was not possible to make even one string, otherwise true
    */
  bool first(int n=0, int sym=-1);
  std::vector<unsigned int> orbitals() const;  /*!< The orbitals that make up the string */
  size_t key; ///< \brief Hash key that can be associated with this object
  std::string str(int verbosity=0) const;
  int spin; ///< \brief spin 1=alpha, -1=beta
  /*!
     * \brief Calculate the spatial symmetry
     * \param nocheck If false, check whether the result is equal to the maintained symmetry variable
     * \return
     */
  unsigned int computed_symmetry(bool nocheck=false) const;
  static String exhausted; /*!< returned by next() when we're already on the last string */


  static size_t keyUnassigned; ///< conventional null value for key
  static size_t StringNotFound; ///< conventional null value for index

  /*!
     * \brief Find the location of this String in a given StringSet
     * \param set the StringSet that hopefully contains this String
     * \return the offset in set or StringNotFound if not in set
     */
  size_t index(const StringSet& set) const;

  /*!
   * \brief operator == test whether two String objects are identical
   * \param other
   * \return
   */
  bool operator==(const String& other) const;

  /*!
   * \brief serialise Produce a byte representation of the object's data
   * \return
   */
  std::vector<char> serialise() const;
private:
  typedef uint8_t orbital_type;
  std::vector<orbital_type> orbitals_; /*!< The orbitals that make up the string */
};
}

using namespace gci;

#endif // GCISTRING_H
