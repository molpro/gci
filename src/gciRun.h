#ifndef GCIRUN_H
#define GCIRUN_H
#include <vector>
#include "gci.h"
#include "gciOperator.h"
#include "gciState.h"
#include "gciWavefunction.h"
#include <stdint.h>

namespace gci {
/*!
 * \brief The Run class encapsulates a complete calculation using gci
 */
class Run
{
public:
  /*!
   * \brief Construct Run object from an FCIdump
   * \param fcidump the file name of the FCIdump
   */
  Run(std::string fcidump);
  ~Run();
  /*!
   * \brief Start the run
   */
  std::vector<double> run();
  /*!
   * \brief addParameter add a parameter
   * \param key key
   * \param values values
   * \param echo whether to print the parameter and value
   */
  void addParameter(const std::string& key, const std::vector<std::string>& values,
                    const bool echo=false);
  /*!
   * \brief addParameter add a parameter
   * \param key key
   * \param value single value
   * \param echo whether to print the parameter and value
   */
  void addParameter(const std::string& key, const std::string& value, const bool echo=false);
private:
  /*!
   * \brief Perform a Rayleigh-Schroedinger perturbation theory calculation
   * \param hams A vector of pointers to the zero, first, second... order hamiltonians
   * \param prototype A State object specifying number of electrons, symmetry, spin
   * If it is a Wavefunction , then that will be used also for specifying the configuration space, otherwise the default FCI
   * \param maxOrder The maximum order of perturbation theory
   * \param energyThreshold Convergence threshold for energy
   * \param maxIterations The maximum number of iterations to perform
   * \return the energies order by order
   */
  std::vector<double> RSPT(const std::vector<Operator *> &hams,
         const State &prototype,
         int maxOrder=-1,
         double energyThreshold=-1,
         int maxIterations=-1);
  std::vector<double> ISRSPT(const gci::Operator &ham, const gci::Operator &ham0,
         const State &prototype,
         int maxOrder=-1,
         double energyThreshold=-1,
         int maxIterations=-1);

  /*!
   * \brief Perform a variational calculation using the Davidson algorithm
   * \param ham The Hamiltonian
   * \param prototype A State object specifying number of electrons, symmetry, spin
   * If it is a Wavefunction , then that will be used also for specifying the configuration space, otherwise the default FCI
   * \param energyThreshold Convergence threshold for energy
   * \param nState The number of eigenstates to be converged
   * \param maxIterations The maximum number of iterations to perform
   * \return the energies for each state. Note that only the first nState energies are considered converged
   */
  std::vector<double> Davidson(const Operator &ham,
                               const State& prototype,
                               double energyThreshold=(double)-1, int nState=-1, int maxIterations=-1);
  std::vector<double> CSDavidson(const Operator &ham,
                               const State& prototype,
                               double energyThreshold=(double)-1, int nState=-1, int maxIterations=-1);
  /*!
   * \brief Perform a variational calculation using the preconditioned stepest descent algorithm
   * \param ham The Hamiltonian
   * \param prototype A State object specifying number of electrons, symmetry, spin
   * If it is a Wavefunction , then that will be used also for specifying the configuration space, otherwise the default FCI
   * \param energyThreshold Convergence threshold for energy
   * \param maxIterations The maximum number of iterations to perform
   * \return the energy of the state.
   */
  std::vector<double> DIIS(const Operator &ham,
                               const State& prototype,
                               double energyThreshold=(double)-1, int maxIterations=-1);

  void HamiltonianMatrixPrint (Operator &hamiltonian, const State &prototype, int verbosity=0);

public:
  /*!
     * \brief parameter Obtain an integer namelist parameter from Molpro input (if available) or the FCIDUMP data.
     * \param key The name of the parameter
     * \param def Default value if the parameter is not found.
     * \return  The result as a vector of integers.
     */
  std::vector<int> parameter(std::string key, std::vector<int> def=std::vector<int>(1,0));
private:

  /*!
     * \brief parameter Obtain a real namelist parameter from Molpro input (if available) or the FCIDUMP data.
     * \param key The name of the parameter
     * \param def Default value if the parameter is not found.
     * \return  The result as a vector of integers.
     */
  std::vector<double> parameter(std::string key, std::vector<double> def);

  /*!
     * \brief parameter Obtain a string namelist parameter from Molpro input (if available) or the FCIDUMP data.
     * \param key The name of the parameter
     * \param def Default value if the parameter is not found.
     * \return  The result as a vector of integers.
     */
  std::vector<std::string> parameter(std::string key, std::vector<std::string> def);

  std::unique_ptr<FCIdump> globalFCIdump; // the FCIdump

  std::vector<std::shared_ptr<Wavefunction> > m_wavefunctions;
};
}

using namespace gci;

#endif // GCIRUN_H