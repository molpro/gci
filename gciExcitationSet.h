#ifndef GCIEXCITATIONSET_H
#define GCIEXCITATIONSET_H
#include "gciStringSet.h"
#include <vector>

/*!
 * \brief Holds a set of excitations from a single String.
 * Not stored in the class, but in the context in which it is used, are
 * the number of annihilations/creations in the excitation (which affects
 * the interpretation of orbitalAddress), and the StringSet into which the Excitation
 * points (via stringIndex).
 */
class Excitation
{
public:
    /*!
     * \brief Constructor
     * \param StringIndex points to the destination of the excitation in a StringSet
     * \param Phase plus or minus one, giving the parity of the line-up permutation
     * \param OrbitalAddress An address representing the orbital(s) involved.
     */
    Excitation(long StringIndex, int Phase, long OrbitalAddress);
    /*!
     * \brief stringIndex points to the destination of the excitation in a StringSet
     */
    long stringIndex;
    /*!
     * \brief phase plus or minus one, giving the parity of the line-up permutation
     */
    int phase;
    /*!
     * \brief orbitalAddress An address representing the orbital(s) involved.
     */
    long orbitalAddress;
};


/*!
 * \brief Container for a number of Excitation objects
 */
class ExcitationSet : std::vector<Excitation>
{
public:
    /*!
     * \brief Construct the ExcitationSet containing all excitations
     * from a given String
     * with a specified number of annihilations and creations.
     * \param from The String to be excited.
     * \param to StringSet against which results will be indexed.
     * \param annihilations How many annihilations.
     * \param creations How many creations.
     */
    ExcitationSet(String &from, StringSet &to, int annihilations, int creations);
};

#endif // GCIEXCITATIONSET_H
