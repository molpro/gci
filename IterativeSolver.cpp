#include "IterativeSolver.h"
#include <algorithm>

using namespace IterativeSolver;

IterativeSolverBase::IterativeSolverBase(ParameterSetTransformation updateFunction, ParameterSetTransformation residualFunction)
:  m_updateFunction(updateFunction), m_residualFunction(residualFunction), m_verbosity(0), m_thresh(1e-6)
{}

IterativeSolverBase::~IterativeSolverBase()
{
}


#include <limits>

bool IterativeSolverBase::iterate(ParameterVectorSet &residual, ParameterVectorSet &solution, ParameterVectorSet &other, std::string options)
{
	m_residuals.push_back(residual); m_solutions.push_back(solution); m_others.push_back(other);
	extrapolate(residual,solution,other,options);
	m_updateFunction(residual,solution,std::vector<ParameterScalar>());
	return calculateError(residual,solution) < m_thresh;
}


 void IterativeSolverBase::extrapolate(ParameterVectorSet & residual, ParameterVectorSet & solution, ParameterVectorSet & other, std::string options)
 {

 }

 void IterativeSolverBase::solve(ParameterVectorSet & residual, ParameterVectorSet & solution, std::string options)
 {
	 throw std::logic_error("solve not written yet"); // FIXME
 }

std::vector<double> IterativeSolverBase::calculateErrors(const ParameterVectorSet &residual, const ParameterVectorSet &solution)
{
    std::vector<double> result;
    for (size_t k=0; k<residual.size(); k++)
        result.push_back(residual.active[k] ? residual[k]*solution[k] : 0);
    return result;
}

double IterativeSolverBase::calculateError(const ParameterVectorSet &residual, const ParameterVectorSet &solution)
{
    std::vector<double> errs(1);
    std::cout<<"Hello"<<std::endl;
    errs=calculateErrors(residual,solution);
    return std::sqrt(std::inner_product(errs.begin(),errs.end(),errs.begin(),0));
}
