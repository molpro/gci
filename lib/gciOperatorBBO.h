#ifndef GCI_GCIOPERATORBBO_H
#define GCI_GCIOPERATORBBO_H

#include "gciOptions.h"
#include "gciRHF.h"

#include <Operator.h>
#include <ostream>
#include <vector>
#include <string>
#include <valarray>

namespace gci {

/*!
 * @brief Full molecular Hamiltonian operator incorporating electronic, vibrational and interaction terms.
 *
 * Modal - Solution of the vibrational SCF equations (vibrational eqivalent of Molecular Orbital)
 */
class OperatorBBO {
public:
    std::string m_description; //! Description of the operator
    int m_nMode; //! number of vibrational modes
    int m_nModal; //! number of HO basis functions per mode
    std::vector<int> m_vibOcc; //! Occupancy of vibrational modals (which modal is occupied, ground state = 0)
    std::vector<int> m_symMode; //! symmetry of each mode
    std::vector<double> m_freq; //! vibrational frequencies in a.u.
    std::vector<double> m_nmDisp; //! Displacement of electronic reference point from vibrational
    std::string m_fcidump; //! Root name of the fcidump files defining this Hamiltonian
    SymmetryMatrix::Operator m_Hel; //! Electronic Hamiltonian
    std::vector<SymmetryMatrix::Operator> m_Hvib; //! Vibrational Hamiltonian
    std::vector<SymmetryMatrix::Operator> m_HintEl; //! Electronic component of the interaction Hamiltonian
    std::vector<SymmetryMatrix::Operator> m_HintVib; //! Vibrational component of the interaction Hamiltonian

    /*!
     * @brief Initialises Hel, Hvib and Hint from fcidump files. The vibrational Hamiltonian is assumed to be harmonic.
     */
    explicit OperatorBBO(const Options &options, std::string description = "BBO Molecular Hamiltonian");
    ~OperatorBBO() = default;

    /*!
     * @brief Calculates electronic, vibrational and interaction component of the total energy
     * @param density Electronic density matrix
     * @param U Vector of vibrational modal coefficients
     * @param energies Three energetic components
     * @return Total energy (electronic + vibrational + interaction)
     */
    void energy(const SymmetryMatrix::Operator &density, const std::vector<SymmetryMatrix::SMat> &U,
                std::valarray<double> &energies);


    /*!
     * @brief Element of the similarity transformed vibrational Hamiltonian
     * @param hamiltonian Original vibrational hamiltonian
     * @param U Unitary transformation matrix
     * @param r Row index
     * @param s Column index
     * @return matrix element = U.T[r,:] * H * U[:,s]
     */
    double
    transformedVibHamElement(const SymmetryMatrix::Operator &hamiltonian, const SymmetryMatrix::SMat &U, int r, int s,
                             int symm);

    /*!
     * @brief Similarity transformation of the vibrational Hamiltonian to a modal basis
     * @param hamiltonian Vibrational Hamiltonian in the harmonic oscillator basis
     * @param U Modal coefficients
     * @return
     */
    SymmetryMatrix::Operator
    transformedVibHam(const SymmetryMatrix::Operator &hamiltonian, const SymmetryMatrix::SMat &U);

    /*!
     * @brief Constructs the electronic Fock operator
     * @param P Electron density matrix
     * @param U Modal coefficients
     * @return Fock matrix
     */
    SymmetryMatrix::Operator electronicFock(const SymmetryMatrix::Operator &P, std::vector<SymmetryMatrix::SMat> &U,
                                            const SymmetryMatrix::SMat Cmat);

    /*!
     * @brief Constructs the vibrational Fock operator
     * @param P Electron density matrix
     * @param U Modal coefficients
     * @param iMode Correpsonding mode
     * @return Fock matrix
     */
    SymmetryMatrix::Operator
    vibrationalFock(const SymmetryMatrix::Operator &P, const SymmetryMatrix::SMat &U, int iMode);

};


std::ostream &operator<<(std::ostream &os, const OperatorBBO &obj);

}// namespace gci
#endif //GCI_GCIOPERATORBBO_H