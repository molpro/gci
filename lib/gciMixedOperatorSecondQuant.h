#ifndef GCI_GCIMIXEDOPERATORSECONDQUANT_H
#define GCI_GCIMIXEDOPERATORSECONDQUANT_H

#include "gciVibOperator.h"

#include <FCIdump.h>

namespace gci {


/*!
 * @brief Mixed electron-vibration operator in a fully second quantized form.
 *
 * sqH_el = pd q h_pq + 2e- + pd q E_ij^A h_{pq,ij}^A
 *
 * @note Only 1MC operators are currently implemented
 *
 *
 */
class MixedOperatorSecondQuant {
public:
    using hel_t = SymmetryMatrix::Operator;
    int nMode; //!< Number of vibrational modes
    int nModal; //!< Number of modals per mode (for now assumed the same for each mode)
    hel_t Hel; //!< Purely electronic terms
    std::map<std::string, hel_t> nacHel; //!< Purely electronic terms from kinetic energy coupling
    VibOperator<double> Hvib;//!< Purely vibrational term
    std::map<std::string, VibOperator<hel_t >> mixedHam;//!< Mixed electronic-vibrational terms

    explicit MixedOperatorSecondQuant(const FCIdump &fcidump);
protected:
    bool includeHel;
    bool includeLambda;
    bool includeK;
    bool includeD;

    /*!
     * @brief Constructs purely vibrational operator
     * @note I'm assuming it's 1MC only
     * @param fcidump_name Name of the main fcidump file
     * @param nmode number of modes
     * @param nmodal  number of modals
     */
    static VibOperator<double> constructHvib(const std::string &fcidump_name, int nmode, int nmodal);

    /*!
     * @brief From FCIdump file generates antisymmetric electronic operator
     */
    static SymmetryMatrix::Operator constructOperatorAntisymm1el(const FCIdump &dump);

    static SymmetryMatrix::Operator constructK(const FCIdump &dump);
    static SymmetryMatrix::Operator constructD(const FCIdump &dump);
    void initializeHel(const FCIdump &fcidump);
    void initializeLambda(const FCIdump &fcidump);
    void initializeK(const FCIdump &fcidump);
    void initializeD(const FCIdump &fcidump);
};
} // namespace gci

#endif //GCI_GCIMIXEDOPERATORSECONDQUANT_H
