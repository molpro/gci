#ifndef GCIHAMILTONIAN_H
#define GCIHAMILTONIAN_H
#include "gci.h"
#include "FCIdump.h"
#include "gciSymmetrySpace.h"
#include <string>
#include <vector>

namespace gci {
/**
 * @brief
 * Class holds hamiltonian operator for FCI or other calculation
 *
 */
class Hamiltonian
{
public:

/*!
 \brief construct Hamiltonian object

 \param filename : if present, call load
*/
    Hamiltonian(std::string filename="");
    /*!
     \brief construct Hamiltonian object

     \param dump : if present, call load
    */   Hamiltonian(FCIdump* dump);
    ~Hamiltonian();
    void load(std::string filename="FCIDUMP", int verbosity=0); /**< \brief load integrals from FCIDUMP */
    void load(FCIdump* dump, int verbosity=0); /**< \brief load integrals from FCIDUMP */
    void unload(); /**< \brief destroy loaded integrals */
    /*!
     * \brief Construct a printable representation of the hamiltonian
     * \param verbosity how much information to include
     * \return printable representation of the hamiltonian
     */
    std::string str(int verbosity=0);
    bool loaded;  /**< \brief whether the integrals are loaded */
    bool spinUnrestricted; /**< \brief whether alpha and beta spin orbitals are different */
    double coreEnergy; /**< \brief core energy */
    std::vector<double> *integrals_a;  /**< \brief point to aa integrals */
    std::vector<double> *integrals_b; /**< \brief point to bb integrals */
    std::vector<double> *integrals_aa; /**< \brief point to aaaa integrals */
    std::vector<double> *integrals_ab; /**< \brief point to aabb integrals */
    std::vector<double> *integrals_bb; /**< \brief point to bbbb integrals */
    unsigned int basisSize;///< \brief size of orbital basis set
    std::vector<unsigned int> orbital_symmetries;///< \brief spatial symmetry of orbitals (0-7)
    SymmetrySpace nt; ///< \brief number of orbitals in each symmetry
    /*!
     * \brief calculate canonical index of a pair of orbitals.
     * \param i Absolute number (starting with 1) of first orbital.
     * \param j Absolute number (starting with 1) of second orbital.
     * \return Number of orbital pairs of the same symmetry canonically before ij.
     */
    unsigned int pairIndex(unsigned int i, unsigned int j);
    /*!
     * \brief calculate canonical index of an orbital within its symmetry.
     * \param i Absolute number (starting with 1) of orbital.
     * \return Number of orbitals of the same symmetry canonically before i.
     */
    unsigned int orbitalIndex(unsigned int i);
    /*!
     * \brief calculate canonical address of a 1-electron integral
     * \param i Absolute number (starting with 1) of first orbital.
     * \param j Absolute number (starting with 1) of second orbital.
     * \return
     */
    unsigned int int1Index (unsigned int i, unsigned int j);
    /*!
     * \brief calculate canonical address of a 2-electron integral
     * \param i Absolute number (starting with 1) of first orbital.
     * \param j Absolute number (starting with 1) of second orbital.
     * \param k Absolute number (starting with 1) of third orbital.
     * \param l Absolute number (starting with 1) of fourth orbital.
     * \return
     */
    unsigned int int2Index (unsigned int i, unsigned int j, unsigned int k, unsigned int l);

    /*!
     * \brief int1 Generate array of diagonal one-electron integrals
     * \param spin positive for alpha, negative for beta
     * \return one-dimensional array with h(i,i) at i-1
     */
    std::vector<double> int1(int spin);


    /*!
     * \brief intJ Generate array of two-electron exchange integrals
     * \param spini positive for alpha, negative for beta, first index
     * \param spinj positive for alpha, negative for beta, second index
     * \return one-dimensional array with (ii|jj) at i-1 + (j-1)*basisSize
     */
    std::vector<double> intJ(int spini, int spinj);
    /*!
     * \brief intK Generate array of two-electron Coulomb integrals
     * \param spin positive for alpha, negative for beta
     * \return one-dimensional array with (ij|ji) at i-1 + (j-1)*basisSize
     */
    std::vector<double> intK(int spin);
private:
    unsigned int ijSize;
    unsigned int ijklSize;
//    SymmetrySpace symmetric_pair_dimensions;
//    SymmetrySpace symmetry_offsets_pairs;
    SymmetrySpace symmetry_offsets_2e_ints;
};
}

using namespace gci;

#endif // GCIHAMILTONIAN_H
