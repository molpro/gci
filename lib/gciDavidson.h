#ifndef GCI_GCIDAVIDSON_H
#define GCI_GCIDAVIDSON_H

#include <vector>
#include <IterativeSolver.h>
#include <Operator.h>

#include "gci.h"
#include "gciOptions.h"
#include "gciWavefunction.h"
#include "gciMixedWavefunction.h"
#include "gciMixedOperator.h"

/*
 * Now that there are two wavefunction objects and two operators (pure electronic and mixed). There is no
 * point in having a Run class.
 * Each member function runs independently and they should be kept independent as templated functions in a common
 * namespace. I'll write a simple example to illustrate my point using with Davidson's algorithm.
 *
 * The `main` will initiate the calculation by reading in options and calling run::drive function.
 */

namespace gci {
namespace run {

/*!
 * @note Copied from gci::Run::Davidson and transformed into a template
 * \brief Perform a variational calculation using the Davidson algorithm
 *
 *
 * @brief Exposes key options for the Davidson's diagonalisation algorithm. Also provides access to the global options
 * class.
 * @note Design structure I have in my head assumes that there is only one options class and it is available through
 * out the calculation at the top level `main` routine.
 *
 * Releveant FCIdump keys:
 *      TOL     -- Energy threshold for convergence
 *      NSTATE  -- Number of target states
 *      MAXIT   -- Maximum number of iterations
 *      PSPACE_INITIAL  -- Size of the initial parameter sapce
 *      PSPACE  -- Maximum size of the parameter space
 *      PSPACE_REBUILD  -- Rebuild P space at every iteration
 *      SOLVER_VERBOSITY -- Verbosity of the output from solver (see IterativeSolver)
 *
 * \param ham The Hamiltonian
 * \param prototype A State object specifying number of electrons, symmetry, spin
 * If it is a Wavefunction , then that will be used also for specifying the configuration space, otherwise the default FCI
 * \param energyThreshold Convergence threshold for energy
 * \param nState The number of eigenstates to be converged
 * \param maxIterations The maximum number of iterations to perform
 * \return the energies for each state. Note that only the first nState energies are considered converged
 */
template<class t_Wavefunction, class t_Operator>
class Davidson {
public:
    using ParameterVectorSet = std::vector<t_Wavefunction>;
    using value_type = typename t_Wavefunction::value_type;

    /*!
     * @brief Sets up the linear eigenvalue problem
     * @param prototype Prototype wavefunction; it defines the Fock space for the problem.
     * @param ham Hamiltonian operator that is to be diagonalised
     * @param options Global options defining the state of the whole calculation. Options relevant to the calculation
     *        are extracted into DavidsonOptions member.
     */
    explicit Davidson(t_Wavefunction &&prototype, t_Operator &&ham, Options &options);

    /*!
     * @brief Runs the calculation.
     */
    void run();

    Options &options;//!< Options governing the type of calculation
    std::shared_ptr<t_Wavefunction> prototype; //!< Prototype wavefunction
    std::shared_ptr<t_Operator> ham; //!< Hamiltonian operator that is being diagonalized
    std::shared_ptr<t_Wavefunction> diagonalH; //!< Stored diagonal values of the hamiltonian operator
    std::vector<value_type> eigVal; //!< Solution eigenvalues
    std::vector<t_Wavefunction> eigVec; //!< Solution eigenvectors
protected:
    void printMatrix();
    void message();
    //!@brief Initializes containers necessary for running the calculation
    void initialize();
    //! Apply the Hamiltonian on the current solution
    void action();
    //! Get the new vector, $r = A u - \lambda u$
    void update();
    LinearAlgebra::LinearEigensystem<t_Wavefunction> solver; //!< Iterative solver
    std::vector<bool> active; //!<
    ParameterVectorSet ww; //!< Set of current solutions
    ParameterVectorSet gg; //!< Set of residual vectors

    double energyThreshold;
    int nState;
    int maxIterations;
    int solverVerbosity;
    int parallel_stringset;
};

template
class Davidson<MixedWavefunction, MixedOperator>;
template
class Davidson<Wavefunction, SymmetryMatrix::Operator>;

}  // namespace run
}  // namespace gci

#endif //GCI_GCIDAVIDSON_H
