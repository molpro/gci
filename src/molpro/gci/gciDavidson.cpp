#include "gciDavidson.h"
#include "gciMixedWavefunction.h"
#include "gciUtils.h"
#include "gciWavefunction.h"
#include "wavefunction/WavefunctionHandler.h"
#include <molpro/linalg/itsolv/LinearEigensystemDavidsonOptions.h>

#include <limits>
#include <fstream>
#ifdef HAVE_HDF5
#include <hdf5.h>
#else // HAVE_HDF5
#define hid_t int
#endif // HAVE_HDF5
#include <iomanip>
#include <molpro/linalg/array/ArrayHandlerSparse.h>

namespace molpro {
namespace gci {
namespace run {
namespace {
template <class T, class P=std::map<size_t,typename T::value_type>>
auto make_handlers() {
  auto rr = std::make_shared<wavefunction::WavefunctionHandler<T, T>>();
  auto qq = std::make_shared<wavefunction::WavefunctionHandler<T, T>>();
  auto pp = std::make_shared<molpro::linalg::array::ArrayHandlerSparse<P, P>>();
  auto rq = std::make_shared<wavefunction::WavefunctionHandler<T, T>>();
  auto rp = std::make_shared<wavefunction::WavefunctionHandlerSparse<T, P>>();
  auto qr = std::make_shared<wavefunction::WavefunctionHandler<T, T>>();
  auto qp = std::make_shared<wavefunction::WavefunctionHandlerSparse<T, P>>();
  return std::make_shared<molpro::linalg::itsolv::ArrayHandlers<T, T, P>>(rr, qq, pp, rq, rp, qr, qp);
}
} // namespace
template <class t_Wavefunction, class t_Operator>
Davidson<t_Wavefunction, t_Operator>::Davidson(const t_Wavefunction &prototype, const t_Operator &_ham, Options opt)
    : prototype(prototype), ham(_ham), options(std::move(opt)), energyThreshold(options.parameter("TOL", 1e-9)),
      nState(options.parameter("NSTATE", 1)), maxIterations(options.parameter("MAXIT", 1000)),
      solverVerbosity(options.parameter("SOLVER_VERBOSITY", 1)),
      parallel_stringset(options.parameter("PARALLEL_STRINGSET")), restart_file(options.parameter("RESTART_FILE", "")),
      backup_file(options.parameter("BACKUP_FILE", "")), solver(linalg::itsolv::create_LinearEigensystem<t_Wavefunction,t_Wavefunction>(
          "Davidson","max_size_qspace=10"
//molpro::linalg::itsolv::LinearEigensystemDavidsonOptions()
        ,make_handlers<t_Wavefunction>()
    )) {
  solver->set_convergence_threshold(1e-5);// TODO get this from options
//  solver.m_verbosity = solverVerbosity;
//  solver.m_maxIterations = (unsigned int)maxIterations;
  solver->set_n_roots(nState);
  solver->set_hermiticity(true);
//  solver.m_maxQ = 1000;
//  solver.m_verbosity = 1;
}

template <class t_Wavefunction, class t_Operator>
void Davidson<t_Wavefunction, t_Operator>::message() const {
  int id;
  MPI_Comm_rank(molpro::gci::mpi_comm_compute, &id);
  if (id == 0) {
    cout << "Davidson eigensolver, maximum iterations=" << maxIterations;
    cout << "; number of states=" << nState;
    cout << "; energy threshold=" << std::scientific << std::setprecision(1) << energyThreshold << std::endl;
    cout << "size of Fock space=" << prototype.size() << std::endl;
    cout << std::fixed << std::setprecision(12);
  }
}

template <class t_Wavefunction, class t_Operator>
void Davidson<t_Wavefunction, t_Operator>::printMatrix(const std::string &fname) const {
  int id;
  MPI_Comm_rank(molpro::gci::mpi_comm_compute,&id);
  if (id != 0)
    return;
  auto file = std::ofstream(fname);
  if (!file.is_open())
    throw std::runtime_error("Couldn't open file " + fname);
  //  file << std::setprecision(15) << std::fixed;
  file << std::scientific << std::setprecision(15);
  t_Wavefunction w(ww[0]);
  t_Wavefunction action(gg[0]);
  w.allocate_buffer();
  action.allocate_buffer();
  auto n = w.size();
  std::vector<std::vector<double>> H(n, std::vector<double>(n, 0));
  for (size_t i = 0; i < n; ++i) {
    w.zero();
    w.set(i, 1.0);
    action.zero();
    action.operatorOnWavefunction(ham, w);
    for (size_t j = 0; j < n; ++j)
      H[i][j] = action.at(j);
  }
  {
    //    file << "(* Hamiltonian matrix (nxn) *)" << std::endl;
    //    file << "n = " << n << std::endl;
    file << n << std::endl;
    //    file << " H = {";
    for (size_t i = 0; i < n; ++i) {
      //      file << "{";
      for (size_t j = 0; j < n; ++j) {
        auto v = H[i][j];
        auto vs = std::ostringstream{};
        vs << std::scientific << std::setprecision(15);
        if (std::abs(v) < 1.0e-12)
          file << "0 ";
        else
          file << v << " ";
        //        if (j == n - 1)
        //          file << vs.str() << "";
        //        else
        //          file << vs.str() << ",";
      }
      //      if (i == n - 1)
      //        file << "}};" << std::endl;
      //      else
      //        file << "}," << std::endl;
    }
    file << std::endl;
  }
}

void davidson_read_write_array(MixedWavefunction &w, const std::string &fname, unsigned int i, hid_t id, bool save) {
#ifdef HAVE_HDF5
  auto dataset = utils::open_or_create_hdf5_dataset(id, "result_" + std::to_string(i), H5T_NATIVE_DOUBLE, w.size());
  auto buffer = w.distr_buffer->local_buffer(); // array::Array::LocalBuffer(w);
  hsize_t count[1] = {(hsize_t)buffer->size()};
  hsize_t offset[1] = {(hsize_t)buffer->start()};
  auto memspace = H5Screate_simple(1, count, nullptr);
  auto fspace = H5Dget_space(dataset);
  H5Sselect_hyperslab(fspace, H5S_SELECT_SET, offset, nullptr, count, nullptr);
  auto plist_id = H5Pcreate(H5P_DATASET_XFER);
  H5Pset_dxpl_mpio(plist_id, H5FD_MPIO_INDEPENDENT);
  if (save) {
    auto error = H5Dwrite(dataset, H5T_NATIVE_DOUBLE, memspace, fspace, plist_id, buffer->data());
    if (error < 0)
      throw std::runtime_error("davidson_read_write_array(): write failed");
  } else {
    auto error = H5Dread(dataset, H5T_NATIVE_DOUBLE, memspace, fspace, plist_id, buffer->data());
    if (error < 0)
      throw std::runtime_error("davidson_read_write_array(): read failed");
  }
  H5Dclose(dataset);
  H5Sclose(fspace);
  H5Sclose(memspace);
  H5Pclose(plist_id);
#else //HAVE_HDF5
  throw std::logic_error("HDF5 support not compiled");
#endif //HAVE_HDF5
}

template <typename t_Wavefunction>
void davidson_read_write_wfn(std::vector<t_Wavefunction> &ww, const std::string &fname, bool save) {
  if (fname.empty())
    return;
  auto id = utils::open_hdf5_file(fname, mpi_comm_compute, save);
  for (auto i = 0ul; i < ww.size(); ++i) {
    davidson_read_write_array(ww[i], fname, i, id, save);
  }
#ifdef HAVE_HDF5
  H5Fclose(id);
#else // HAVE_HDF5
  throw std::logic_error("HDF5 support not compiled");
#endif // HAVE_HDF5
}
template <>
void davidson_read_write_wfn(std::vector<Wavefunction> &ww, const std::string &fname, bool save) {}

template <class t_Wavefunction, class t_Operator>
void Davidson<t_Wavefunction, t_Operator>::reference_electronic_states() {}

template <>
void Davidson<MixedWavefunction, MixedOperatorSecondQuant>::reference_electronic_states() {
  if (ref_elec_states)
    return;
  Wavefunction w = prototype.wavefunctionAt(0, ww[0].m_child_communicator);
  // get number of electronic states from options
  auto nM = options.parameter("NMODAL", int(0));
  int nElSt = nState / nM + nState % nM ? 1 : 0;
  nElSt = options.parameter("NELSTATE_INIT", nElSt); // number of electronic states to search for
  auto modOptions = Options(options);
  modOptions.addParameter("NSTATE", nElSt);
  modOptions.addParameter("MAXIT", (int)100);
  modOptions.addParameter("TOL", options.parameter("TOLGUESS", energyThreshold));
  modOptions.addParameter("BACKUP_FILE", "");
  modOptions.addParameter("RESTART_FILE", "");
  auto h = ham.elHam.at("Hel[0]").get();
  Davidson<Wavefunction, molpro::Operator> elecSolver(w, *h, modOptions);
  elecSolver.run();
  ref_elec_states = std::make_shared<std::vector<Wavefunction>>(elecSolver.ww);
  // normalise
  for (auto &w_ref : *ref_elec_states) {
    auto ov = w_ref.dot(w_ref);
    w_ref *= 1. / std::sqrt(ov);
  }
}

template <class t_Wavefunction, class t_Operator>
void Davidson<t_Wavefunction, t_Operator>::prepareGuess() {}

template <>
void Davidson<MixedWavefunction, MixedOperatorSecondQuant>::prepareGuess() {
  if (!restart_file.empty()) {
    cout << "Restarting from wfn backup, file = " << restart_file << std::endl;
    davidson_read_write_wfn<MixedWavefunction>(ww, restart_file, false);
    return;
  }
  // Currently assumes only 1 mode
  if (options.parameter("NOGUESS", int(0)))
    return;
  auto prof = profiler->push("prepareGuess");
  auto nMode = options.parameter("NMODE", int(0));
  if (nMode != 1)
    return;
  for (auto &root : ww)
    root.zero();
  int id;
  MPI_Comm_rank(molpro::gci::mpi_comm_compute,&id);
  if (id == 0) {
    cout << "Entered Davidson::prepareGuess()" << std::endl;
    // get number of electronic states from options
    auto nM = options.parameter("NMODAL", int(0));
    int nElSt = nState / nM + nState % nM ? 1 : 0;
    nElSt = options.parameter("NELSTATE_INIT", nElSt); // number of electronic states to search for
    reference_electronic_states();
    // get initial guess vectors from options
    auto nElStG = options.parameter("NELSTATE_GUESS",
                                    nElSt); // number of lowest energy electronic states to construct the guess from
    int guess_size = nState * nM * nElStG;
    std::vector<double> init_guess;
    auto guess_file = options.parameter("INIT_GUESS", std::string(""));
    if (guess_file.empty()) {
      init_guess.resize(guess_size, 0.);
      for (auto i = 0ul; i < nState; ++i) {
        auto iVibSt = i % nM;
        auto iElSt = i / nM;
        init_guess[i * nM * nElStG + iVibSt * nElStG + iElSt] = 1.0;
      }
    } else {
      cout << "Read guess from file, " << guess_file << std::endl;
      auto input = std::ifstream(guess_file);
      std::string val;
      while (std::getline(input, val))
        if (!val.empty()) {
          init_guess.push_back(std::stod(val));
        }
      if (init_guess.size() != guess_size)
        throw std::runtime_error("initial guess vector is of the wrong size");
    }
    for (auto i = 0ul; i < nState; ++i) {
      for (int iVibSt = 0; iVibSt < nM; ++iVibSt) {
        auto ind = i * nM * nElStG + iVibSt * nElStG;
        auto weight = init_guess.at(ind);
        auto wfn = weight * ref_elec_states->at(0);
        for (auto j = 1ul; j < nElStG; ++j) {
          weight = init_guess.at(ind + j);
          wfn += weight * ref_elec_states->at(j);
        }
        ww[i].put(iVibSt, wfn);
      }
    }
    cout << "Exit Davidson::prepareGuess()" << std::endl;
  }
  for (auto &root : ww)
    root.sync();
  backup(ww);
}

template <class t_Wavefunction, class t_Operator>
void Davidson<t_Wavefunction, t_Operator>::energy_decomposition() {}

template <>
void Davidson<MixedWavefunction, MixedOperatorSecondQuant>::energy_decomposition() {
  // split Hamiltonian into different parts
  std::map<std::string, MixedOperatorSecondQuant> hams;
  auto names = std::vector<std::string>{"Hvib", "Hel[0]", "Hel[1]", "Lambda[1]", "K[0]", "K[1]", "D[0]", "D[1]"};
  for (const auto &name : names)
    hams.insert({name, MixedOperatorSecondQuant(ham, name)});
  cout << "Energetic contributions from different terms of the Hamiltonian" << std::endl;
  auto format_string = std::string{"{:8} "};
  cout << "State  ";
  for (const auto &name : names)
    cout << name << "    ";
  cout << std::endl;
  for (size_t i = 0; i < ww.size(); ++i) {
    auto &w = ww[i];
    auto &g = gg[i];
    auto ov = w.dot(w);
    auto norm = 1. / std::sqrt(ov);
    cout << "{" << i;
    for (const auto &name : names) {
      g.zero();
      g.operatorOnWavefunction(hams.at(name), w);
      ov = g.dot(w);
      auto e = ov / norm;
      cout << ",   " << e;
    }
    cout << "}" << std::endl;
  }
  cout << "Vibrational Density matrix " << std::endl;
  cout << "dm"
            << " = {";
  for (size_t i = 0; i < ww.size(); ++i) {
    cout << "{";
    auto dm = ww[i].vibDensity();
    for (size_t j = 0; j < dm.size(); ++j) {
      cout << dm[j];
      if (j != dm.size() - 1)
        cout << ", ";
    }
    cout << "}";
    if (i != ww.size() - 1)
      cout << "," << std::endl;
  }
  cout << "};" << std::endl;
}

template <class t_Wavefunction, class t_Operator>
void Davidson<t_Wavefunction, t_Operator>::analysis() {}

template <>
void Davidson<MixedWavefunction, MixedOperatorSecondQuant>::analysis() {
  if (!ref_elec_states)
    return;
  if (!options.parameter("ASSIGN", int(0)))
    return;
  auto nM = options.parameter("NMODAL", int(0));
  auto nRefState = ref_elec_states->size();
  // normalise solutions
  for (auto &w : ww) {
    auto ov = w.dot(w);
    w.distr_buffer->scal(1. / std::sqrt(ov));
  }
  int id;
  MPI_Comm_rank(molpro::gci::mpi_comm_compute,&id);
  if (id == 0) {
    cout << "Analysis:" << std::endl;
    // transform to basis of BO electronic states
    auto ww_bo = std::vector<std::vector<double>>(nState);
    for (size_t i = 0; i < nState; ++i) {
      for (size_t j_vib = 0; j_vib < nM; ++j_vib) {
        auto w = ww[i].wavefunctionAt(j_vib, ww[i].distr_buffer->communicator());
        for (const auto &w_ref : *ref_elec_states) {
          auto ov = w.dot(w_ref);
          ww_bo[i].push_back(ov);
        }
      }
    }
    // Assignment of electronic states and bosonic states
    // diagonal elements of electronic density matrix
    auto electronic_assignment = std::vector<std::vector<double>>(nState);
    for (size_t i = 0; i < nState; ++i) {
      for (size_t n = 0; n < nRefState; ++n) {
        double rho = 0;
        for (size_t j_vib = 0; j_vib < nM; ++j_vib) {
          rho += std::pow(ww_bo[i][j_vib * nRefState + n], 2.);
        }
        electronic_assignment[i].push_back(rho);
      }
    }
    // Assignment of bosonic state
    // diagonal elements of bosonic density matrix
    auto bosonic_assignment = std::vector<std::vector<double>>(nState);
    for (size_t i = 0; i < nState; ++i) {
      for (size_t j_vib = 0; j_vib < nM; ++j_vib) {
        auto w = ww[i].wavefunctionAt(j_vib, ww[i].distr_buffer->communicator());
        auto ov = w.dot(w);
        bosonic_assignment[i].push_back(ov);
      }
    }
    // Print out
    cout << "electronic assignment" << std::endl;
    for (size_t i = 0; i < nState; ++i) {
      for (auto ov : electronic_assignment[i])
        cout << ov << ",";
      cout << std::endl;
    }
    cout << "bosonic assignment" << std::endl;
    for (size_t i = 0; i < nState; ++i) {
      for (auto ov : bosonic_assignment[i])
        cout << ov << ",";
      cout << std::endl;
    }
  }
  for (auto &root : ww)
    root.sync();
}

template <class t_Wavefunction, class t_Operator>
void Davidson<t_Wavefunction, t_Operator>::run() {
  auto prof = profiler->push("Davidson");
  message();
  initialize();
  prepareGuess();
  if (options.parameter("ASSIGN", int(0)))
    reference_electronic_states();
  if (!options.parameter("PRINTMATRIX", "").empty())
    printMatrix(options.parameter("PRINTMATRIX", ""));
  auto working_set = std::vector<int>(nState);
  std::iota(begin(working_set), end(working_set), 0);
  for (unsigned int iteration = 1; iteration <= maxIterations; iteration++) {
    action(working_set);
    solver->add_vector(ww, gg);
    working_set = solver->working_set();
    if (false) {
      cout << "working set = ";
      std::copy(begin(working_set), end(working_set), std::ostream_iterator<int>(cout, ","));
      cout << std::endl;
    }
    solver->report();
    update(working_set);
    if (true)
      cout << solver->statistics() << std::endl;
    backup(ww);
    solver->end_iteration(ww,gg);
    if (solver->working_set().empty())
      break;
  }
  working_set.resize(nState);
  std::iota(begin(working_set), end(working_set), 0);
  solver->solution(working_set, ww, gg);
  if (maxIterations > 0) {
    cout << "energies: ";
    for (unsigned int i = 0; i < nState; ++i)
      cout << solver->eigenvalues()[i] << ", ";
    cout << std::endl;
    analysis();
  }
  if (options.parameter("ENERGY_DECOMPOSITION", 0))
    energy_decomposition();
  cout << "Exit Davidson::run()" << std::endl;
}

template <class t_Wavefunction, class t_Operator>
void Davidson<t_Wavefunction, t_Operator>::initialize() {
  if (!diagonalH)
    diagonalH = std::make_shared<t_Wavefunction>(prototype, 0);
  diagonalH->allocate_buffer();
  diagonalH->diagonalOperator(ham);
  diag_minlocN = diagonalH->minlocN(nState);
  for (auto i = 0ul; i < nState; ++i)
    diag_val_at_minlocN.push_back(diagonalH->at(diag_minlocN[i]));
  std::vector<int> roots(nState, 0);
  int id;
  MPI_Comm_rank(molpro::gci::mpi_comm_compute,&id);
  for (unsigned int root = 0; root < nState; root++) {
    ww.emplace_back(prototype, 0);
    ww.back().allocate_buffer();
    ww.back().zero();
    auto n = diag_minlocN[root];
    if (id == 0)
      if (std::count(roots.begin(), roots.begin() + root, n) != 0)
        throw std::logic_error("Davidson::initialize duplicate guess vector, n =" + std::to_string(n));
    roots[root] = n;
    ww.back().set(n, 1.0);
    auto l = ww.back().distr_buffer->local_buffer();
    gg.emplace_back(prototype, 0);
    gg.back().allocate_buffer();
    gg.back().settilesize(options.parameter("TILESIZE", std::vector<int>(1, -1)).at(0),
                          options.parameter("ALPHATILESIZE", std::vector<int>(1, -1)).at(0),
                          options.parameter("BETATILESIZE", std::vector<int>(1, -1)).at(0));
  }
}

template <class t_Wavefunction, class t_Operator>
void Davidson<t_Wavefunction, t_Operator>::action(const std::vector<int> &working_set) {
  for (size_t k = 0; k < working_set.size(); ++k)
    gg[k].zero();
  for (size_t k = 0; k < working_set.size(); ++k) {
    const auto &x = ww[k];
    auto &g = gg[k];
    auto prof = profiler->push("Hc");
    g.operatorOnWavefunction(ham, x, false);
  }
}

template <>
void Davidson<MixedWavefunction, MixedOperatorSecondQuant>::action(const std::vector<int> &working_set) {
  for (size_t k = 0; k < working_set.size(); ++k)
    gg[k].zero();
  gg[0].sync();
  DivideTasks(std::numeric_limits<size_t>::max(), 1, 1, gg[0].distr_buffer->communicator());
  for (size_t k = 0; k < working_set.size(); ++k) {
    auto &x = ww[k];
    auto &g = gg[k];
    auto prof = profiler->push("Hc");
    g.operatorOnWavefunction(ham, x, false, false);
  }
  for (const auto &g : gg)
    g.sync();
}

template <class t_Wavefunction, class t_Operator>
void Davidson<t_Wavefunction, t_Operator>::update(const std::vector<int> &working_set) {
  auto eigval = solver->working_set_eigenvalues();
  for (size_t state = 0; state < working_set.size(); ++state) {
    t_Wavefunction &cw = ww[state];
    t_Wavefunction &gw = gg[state];
    auto shift = -eigval[state] + 1e-10;
    shift += 2 * std::numeric_limits<value_type>::epsilon() *
             std::max<value_type>(1, std::abs(diag_val_at_minlocN[working_set[state]])); // to guard against zero
    gw.divide(&gw, diagonalH.get(), shift, false, true);
    gw.replicate();
  }
}

template <class t_Wavefunction, class t_Operator>
void Davidson<t_Wavefunction, t_Operator>::backup(std::vector<t_Wavefunction> &ww) {
  davidson_read_write_wfn<t_Wavefunction>(ww, backup_file, true);
}

template class Davidson<MixedWavefunction, MixedOperatorSecondQuant>;

template class Davidson<Wavefunction, molpro::Operator>;

} // namespace run
} // namespace gci
} // namespace molpro
