<?xml version='1.0' encoding='UTF-8' standalone='yes' ?>
<tagfile doxygen_version="1.9.1">
  <compound kind="file">
    <name>gci.h</name>
    <path>/__w/gci/gci/src/molpro/gci/</path>
    <filename>gci_8h.html</filename>
    <includes id="SharedCounter_8h" name="SharedCounter.h" local="yes" imported="no">molpro/gci/schedule/SharedCounter.h</includes>
    <namespace>molpro</namespace>
    <namespace>molpro::gci</namespace>
    <member kind="function">
      <type>void</type>
      <name>create_new_counter</name>
      <anchorfile>namespacemolpro_1_1gci.html</anchorfile>
      <anchor>a9d22e939230de8d8c210abf6ef022518</anchor>
      <arglist>(MPI_Comm communicator)</arglist>
    </member>
    <member kind="function">
      <type>long</type>
      <name>nextval</name>
      <anchorfile>namespacemolpro_1_1gci.html</anchorfile>
      <anchor>ab44389f5c53dc69719109403ef3490d4</anchor>
      <arglist>(MPI_Comm communicator, int64_t option=parallel_size)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>DivideTasks</name>
      <anchorfile>namespacemolpro_1_1gci.html</anchorfile>
      <anchor>aae40c4d391e95e3aab7e7e04db9df6e8</anchor>
      <arglist>(std::size_t ntasks, std::size_t nMinBatch, std::size_t nMaxBatch, MPI_Comm communicator)</arglist>
    </member>
    <member kind="function">
      <type>bool</type>
      <name>NextTask</name>
      <anchorfile>namespacemolpro_1_1gci.html</anchorfile>
      <anchor>ab9afaee349f6667c200845bb7e7b0dd8</anchor>
      <arglist>(MPI_Comm communicator)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>EndTasks</name>
      <anchorfile>namespacemolpro_1_1gci.html</anchorfile>
      <anchor>a4d731ebd047599af13d647023898b74c</anchor>
      <arglist>(MPI_Comm communicator)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>gather_chunks</name>
      <anchorfile>namespacemolpro_1_1gci.html</anchorfile>
      <anchor>ada0ad6980ad3eed9dfae614c5eb98d5c</anchor>
      <arglist>(double *buffer, const size_t length, const size_t chunk, MPI_Comm communicator)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>gsum</name>
      <anchorfile>namespacemolpro_1_1gci.html</anchorfile>
      <anchor>afbedafc56dab2f307775ea18d64b9f71</anchor>
      <arglist>(double *buffer, size_t len, MPI_Comm communicator)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>gsum</name>
      <anchorfile>namespacemolpro_1_1gci.html</anchorfile>
      <anchor>a24c504d28e50c1888b7dc6245bc18cca</anchor>
      <arglist>(std::map&lt; size_t, double &gt; &amp;buffer, MPI_Comm communicator)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>gsum</name>
      <anchorfile>namespacemolpro_1_1gci.html</anchorfile>
      <anchor>ae4582e83757c8320433c2e72a2ac47d7</anchor>
      <arglist>(molpro::array&lt; double &gt; v, MPI_Comm communicator)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>gsum</name>
      <anchorfile>namespacemolpro_1_1gci.html</anchorfile>
      <anchor>a375859886a6cec9371f796286c4c845f</anchor>
      <arglist>(molpro::vector&lt; double &gt; v, MPI_Comm communicator)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>gsum</name>
      <anchorfile>namespacemolpro_1_1gci.html</anchorfile>
      <anchor>a3a5b3e42f12d16596ec7641ee3ad841e</anchor>
      <arglist>(std::vector&lt; double &gt; v, MPI_Comm communicator)</arglist>
    </member>
  </compound>
  <compound kind="file">
    <name>gciDavidson.cpp</name>
    <path>/__w/gci/gci/src/molpro/gci/</path>
    <filename>gciDavidson_8cpp.html</filename>
    <includes id="gciDavidson_8h" name="gciDavidson.h" local="yes" imported="no">gciDavidson.h</includes>
    <includes id="gciMixedWavefunction_8h" name="gciMixedWavefunction.h" local="yes" imported="no">gciMixedWavefunction.h</includes>
    <includes id="gciUtils_8h" name="gciUtils.h" local="yes" imported="no">gciUtils.h</includes>
    <includes id="gciWavefunction_8h" name="gciWavefunction.h" local="yes" imported="no">gciWavefunction.h</includes>
    <includes id="WavefunctionHandler_8h" name="WavefunctionHandler.h" local="yes" imported="no">wavefunction/WavefunctionHandler.h</includes>
    <namespace>molpro</namespace>
    <namespace>molpro::gci</namespace>
    <namespace>molpro::gci::run</namespace>
    <member kind="define">
      <type>#define</type>
      <name>hid_t</name>
      <anchorfile>gciDavidson_8cpp.html</anchorfile>
      <anchor>a72876d2394751bd0ac29c69171515d62</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>davidson_read_write_array</name>
      <anchorfile>namespacemolpro_1_1gci_1_1run.html</anchorfile>
      <anchor>a64b77d8c195caf4fa08c7951d3a905aa</anchor>
      <arglist>(MixedWavefunction &amp;w, const std::string &amp;fname, unsigned int i, int id, bool save)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>davidson_read_write_wfn</name>
      <anchorfile>namespacemolpro_1_1gci_1_1run.html</anchorfile>
      <anchor>af8837323f27bb72f4c594b339aba6320</anchor>
      <arglist>(std::vector&lt; t_Wavefunction &gt; &amp;ww, const std::string &amp;fname, bool save)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>davidson_read_write_wfn</name>
      <anchorfile>namespacemolpro_1_1gci_1_1run.html</anchorfile>
      <anchor>a2b3aaef693eec2db68d6a21c09fa8f29</anchor>
      <arglist>(std::vector&lt; Wavefunction &gt; &amp;ww, const std::string &amp;fname, bool save)</arglist>
    </member>
  </compound>
  <compound kind="file">
    <name>gciDavidson.h</name>
    <path>/__w/gci/gci/src/molpro/gci/</path>
    <filename>gciDavidson_8h.html</filename>
    <includes id="Operator_8h" name="Operator.h" local="no" imported="no">molpro/symmetry_matrix/Operator.h</includes>
    <includes id="gci_8h" name="gci.h" local="yes" imported="no">molpro/gci/gci.h</includes>
    <includes id="gciOptions_8h" name="gciOptions.h" local="yes" imported="no">molpro/gci/gciOptions.h</includes>
    <includes id="gciWavefunction_8h" name="gciWavefunction.h" local="yes" imported="no">molpro/gci/gciWavefunction.h</includes>
    <class kind="class">molpro::gci::run::Davidson</class>
    <namespace>molpro</namespace>
    <namespace>molpro::gci</namespace>
    <namespace>molpro::gci::run</namespace>
    <member kind="function">
      <type>void</type>
      <name>davidson_read_write_wfn</name>
      <anchorfile>namespacemolpro_1_1gci_1_1run.html</anchorfile>
      <anchor>af8837323f27bb72f4c594b339aba6320</anchor>
      <arglist>(std::vector&lt; t_Wavefunction &gt; &amp;ww, const std::string &amp;fname, bool save)</arglist>
    </member>
  </compound>
  <compound kind="file">
    <name>gciDeterminant.cpp</name>
    <path>/__w/gci/gci/src/molpro/gci/</path>
    <filename>gciDeterminant_8cpp.html</filename>
    <includes id="gciDeterminant_8h" name="gciDeterminant.h" local="yes" imported="no">gciDeterminant.h</includes>
    <namespace>molpro</namespace>
    <namespace>molpro::gci</namespace>
  </compound>
  <compound kind="file">
    <name>gciDeterminant.h</name>
    <path>/__w/gci/gci/src/molpro/gci/</path>
    <filename>gciDeterminant_8h.html</filename>
    <includes id="gci_8h" name="gci.h" local="yes" imported="no">molpro/gci/gci.h</includes>
    <includes id="gciState_8h" name="gciState.h" local="yes" imported="no">molpro/gci/gciState.h</includes>
    <includes id="gciString_8h" name="gciString.h" local="yes" imported="no">molpro/gci/gciString.h</includes>
    <class kind="class">molpro::gci::Determinant</class>
    <namespace>molpro</namespace>
    <namespace>molpro::gci</namespace>
  </compound>
  <compound kind="file">
    <name>gciExcitationSet.cpp</name>
    <path>/__w/gci/gci/src/molpro/gci/</path>
    <filename>gciExcitationSet_8cpp.html</filename>
    <includes id="gciExcitationSet_8h" name="gciExcitationSet.h" local="yes" imported="no">gciExcitationSet.h</includes>
    <includes id="gciStringSet_8h" name="gciStringSet.h" local="yes" imported="no">gciStringSet.h</includes>
    <namespace>molpro</namespace>
    <namespace>molpro::gci</namespace>
    <member kind="function">
      <type>std::ostream &amp;</type>
      <name>operator&lt;&lt;</name>
      <anchorfile>namespacemolpro_1_1gci.html</anchorfile>
      <anchor>a425973d8799515ed20b0604c078bfdb0</anchor>
      <arglist>(std::ostream &amp;os, ExcitationSet const &amp;obj)</arglist>
    </member>
  </compound>
  <compound kind="file">
    <name>gciExcitationSet.h</name>
    <path>/__w/gci/gci/src/molpro/gci/</path>
    <filename>gciExcitationSet_8h.html</filename>
    <includes id="gciString_8h" name="gciString.h" local="yes" imported="no">molpro/gci/gciString.h</includes>
    <includes id="SMat_8h" name="SMat.h" local="no" imported="no">molpro/symmetry_matrix/SMat.h</includes>
    <class kind="class">molpro::gci::Excitation</class>
    <class kind="class">molpro::gci::ExcitationSet</class>
    <namespace>molpro</namespace>
    <namespace>molpro::gci</namespace>
    <member kind="typedef">
      <type>std::vector&lt; Excitation &gt;</type>
      <name>ExcitationSetContainer</name>
      <anchorfile>namespacemolpro_1_1gci.html</anchorfile>
      <anchor>a7045e610f51477b48f588b9d924d7cdb</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>std::ostream &amp;</type>
      <name>operator&lt;&lt;</name>
      <anchorfile>namespacemolpro_1_1gci.html</anchorfile>
      <anchor>a425973d8799515ed20b0604c078bfdb0</anchor>
      <arglist>(std::ostream &amp;os, ExcitationSet const &amp;obj)</arglist>
    </member>
  </compound>
  <compound kind="file">
    <name>gciFile.cpp</name>
    <path>/__w/gci/gci/src/molpro/gci/</path>
    <filename>gciFile_8cpp.html</filename>
    <includes id="gciFile_8h" name="gciFile.h" local="yes" imported="no">gciFile.h</includes>
    <namespace>molpro</namespace>
    <namespace>molpro::gci</namespace>
  </compound>
  <compound kind="file">
    <name>gciFile.h</name>
    <path>/__w/gci/gci/src/molpro/gci/</path>
    <filename>gciFile_8h.html</filename>
    <class kind="class">molpro::gci::File</class>
    <namespace>molpro</namespace>
    <namespace>molpro::gci</namespace>
  </compound>
  <compound kind="file">
    <name>gciHProduct.cpp</name>
    <path>/__w/gci/gci/src/molpro/gci/</path>
    <filename>gciHProduct_8cpp.html</filename>
    <includes id="gciHProduct_8h" name="gciHProduct.h" local="yes" imported="no">gciHProduct.h</includes>
    <namespace>molpro</namespace>
    <namespace>molpro::gci</namespace>
    <member kind="function">
      <type>std::ostream &amp;</type>
      <name>operator&lt;&lt;</name>
      <anchorfile>namespacemolpro_1_1gci.html</anchorfile>
      <anchor>a6a98b862d7dd4647cac838d26456a32c</anchor>
      <arglist>(std::ostream &amp;os, HProduct const &amp;obj)</arglist>
    </member>
  </compound>
  <compound kind="file">
    <name>gciHProduct.h</name>
    <path>/__w/gci/gci/src/molpro/gci/</path>
    <filename>gciHProduct_8h.html</filename>
    <includes id="gciVibExcitation_8h" name="gciVibExcitation.h" local="yes" imported="no">molpro/gci/gciVibExcitation.h</includes>
    <includes id="gciVibSpace_8h" name="gciVibSpace.h" local="yes" imported="no">molpro/gci/gciVibSpace.h</includes>
    <class kind="class">molpro::gci::HProduct</class>
    <namespace>molpro</namespace>
    <namespace>molpro::gci</namespace>
    <member kind="function">
      <type>std::ostream &amp;</type>
      <name>operator&lt;&lt;</name>
      <anchorfile>namespacemolpro_1_1gci.html</anchorfile>
      <anchor>a6a98b862d7dd4647cac838d26456a32c</anchor>
      <arglist>(std::ostream &amp;os, HProduct const &amp;obj)</arglist>
    </member>
  </compound>
  <compound kind="file">
    <name>gciHProductSet.cpp</name>
    <path>/__w/gci/gci/src/molpro/gci/</path>
    <filename>gciHProductSet_8cpp.html</filename>
    <includes id="gciHProductSet_8h" name="gciHProductSet.h" local="yes" imported="no">gciHProductSet.h</includes>
    <namespace>molpro</namespace>
    <namespace>molpro::gci</namespace>
  </compound>
  <compound kind="file">
    <name>gciHProductSet.h</name>
    <path>/__w/gci/gci/src/molpro/gci/</path>
    <filename>gciHProductSet_8h.html</filename>
    <includes id="gciHProduct_8h" name="gciHProduct.h" local="yes" imported="no">molpro/gci/gciHProduct.h</includes>
    <includes id="gciMixedOperator_8h" name="gciMixedOperator.h" local="yes" imported="no">molpro/gci/gciMixedOperator.h</includes>
    <includes id="gciVibSpace_8h" name="gciVibSpace.h" local="yes" imported="no">molpro/gci/gciVibSpace.h</includes>
    <class kind="class">molpro::gci::HProductSet</class>
    <namespace>molpro</namespace>
    <namespace>molpro::gci</namespace>
  </compound>
  <compound kind="file">
    <name>gciMixedOperator.cpp</name>
    <path>/__w/gci/gci/src/molpro/gci/</path>
    <filename>gciMixedOperator_8cpp.html</filename>
    <includes id="gciMixedOperator_8h" name="gciMixedOperator.h" local="yes" imported="no">gciMixedOperator.h</includes>
    <includes id="gciRun_8h" name="gciRun.h" local="yes" imported="no">gciRun.h</includes>
    <namespace>molpro</namespace>
    <namespace>molpro::gci</namespace>
    <member kind="function">
      <type>molpro::Operator</type>
      <name>constructOperatorT1</name>
      <anchorfile>namespacemolpro_1_1gci.html</anchorfile>
      <anchor>ac4c7ecbe6e8c5527cf065869a85cb8a2</anchor>
      <arglist>(const molpro::FCIdump &amp;dump)</arglist>
    </member>
  </compound>
  <compound kind="file">
    <name>gciMixedOperator.h</name>
    <path>/__w/gci/gci/src/molpro/gci/</path>
    <filename>gciMixedOperator_8h.html</filename>
    <includes id="Operator_8h" name="Operator.h" local="no" imported="no">molpro/symmetry_matrix/Operator.h</includes>
    <includes id="gciHProduct_8h" name="gciHProduct.h" local="yes" imported="no">gciHProduct.h</includes>
    <includes id="gciRun_8h" name="gciRun.h" local="yes" imported="no">gciRun.h</includes>
    <class kind="class">molpro::gci::VibOp</class>
    <class kind="struct">molpro::gci::MixedOpTerm</class>
    <class kind="class">molpro::gci::MixedOperator</class>
    <namespace>molpro</namespace>
    <namespace>molpro::gci</namespace>
    <member kind="enumeration">
      <type></type>
      <name>VibOpType</name>
      <anchorfile>namespacemolpro_1_1gci.html</anchorfile>
      <anchor>a75e1db8c4a2e6df48f661dd3ba9352ba</anchor>
      <arglist></arglist>
      <enumvalue file="namespacemolpro_1_1gci.html" anchor="a75e1db8c4a2e6df48f661dd3ba9352baa3969dc7ec85ba96faa4cc7c446f7401c">HO</enumvalue>
      <enumvalue file="namespacemolpro_1_1gci.html" anchor="a75e1db8c4a2e6df48f661dd3ba9352baaf09564c9ca56850d4cd6b3319e541aee">Q</enumvalue>
      <enumvalue file="namespacemolpro_1_1gci.html" anchor="a75e1db8c4a2e6df48f661dd3ba9352baa623ce4ee9b146516003af19773c3cb41">dQ</enumvalue>
      <enumvalue file="namespacemolpro_1_1gci.html" anchor="a75e1db8c4a2e6df48f661dd3ba9352baa3bc0a671839f3692167917d77b9444cb">Qsq</enumvalue>
    </member>
  </compound>
  <compound kind="file">
    <name>gciMixedOperatorSecondQuant.cpp</name>
    <path>/__w/gci/gci/src/molpro/gci/</path>
    <filename>gciMixedOperatorSecondQuant_8cpp.html</filename>
    <includes id="gciMixedOperatorSecondQuant_8h" name="gciMixedOperatorSecondQuant.h" local="yes" imported="no">gciMixedOperatorSecondQuant.h</includes>
    <includes id="gciPersistentOperator_8h" name="gciPersistentOperator.h" local="yes" imported="no">gciPersistentOperator.h</includes>
    <includes id="gciRun_8h" name="gciRun.h" local="yes" imported="no">gciRun.h</includes>
    <includes id="gciUtils_8h" name="gciUtils.h" local="yes" imported="no">gciUtils.h</includes>
    <namespace>molpro</namespace>
    <namespace>molpro::gci</namespace>
    <member kind="function">
      <type>PersistentOperator</type>
      <name>create_persistentoperator</name>
      <anchorfile>namespacemolpro_1_1gci.html</anchorfile>
      <anchor>afde796ffae8dec801f2d15c14096691f</anchor>
      <arglist>(const std::string &amp;fcidump, bool restart, std::string description, int hid_file, int root, Op(*construct_op)(const molpro::FCIdump &amp;, bool))</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>constructHvib</name>
      <anchorfile>namespacemolpro_1_1gci.html</anchorfile>
      <anchor>a07f7d9dafcc03d24b27bdf58528246b6</anchor>
      <arglist>(VibOperator&lt; double &gt; &amp;Hvib, const std::string &amp;fcidump_name, int nmode, int nmodal)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>constructHvib</name>
      <anchorfile>namespacemolpro_1_1gci.html</anchorfile>
      <anchor>ad2ba4c052820d85cc3b9bf6e9e571f54</anchor>
      <arglist>(VibOperator&lt; double &gt; &amp;Hvib, int nmode, int nmodal, std::vector&lt; double &gt; freq)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>constructDMcoupling</name>
      <anchorfile>namespacemolpro_1_1gci.html</anchorfile>
      <anchor>a2368b28f705b3703dc6a052600799382</anchor>
      <arglist>(std::map&lt; std::string, MixedOperatorSecondQuant::hel_t &gt; &amp;elHam2, std::map&lt; std::string, VibOperator&lt; MixedOperatorSecondQuant::hel_t &gt;&gt; &amp;mixedHam, const std::string &amp;fcidump_f, const std::vector&lt; double &gt; &amp;gamma, const std::vector&lt; double &gt; &amp;freq, int nmode, int nmodal)</arglist>
    </member>
  </compound>
  <compound kind="file">
    <name>gciMixedOperatorSecondQuant.h</name>
    <path>/__w/gci/gci/src/molpro/gci/</path>
    <filename>gciMixedOperatorSecondQuant_8h.html</filename>
    <includes id="gciOptions_8h" name="gciOptions.h" local="yes" imported="no">molpro/gci/gciOptions.h</includes>
    <includes id="gciPersistentOperator_8h" name="gciPersistentOperator.h" local="yes" imported="no">molpro/gci/gciPersistentOperator.h</includes>
    <includes id="gciVibOperator_8h" name="gciVibOperator.h" local="yes" imported="no">molpro/gci/gciVibOperator.h</includes>
    <class kind="class">molpro::gci::MixedOperatorSecondQuant</class>
    <namespace>molpro</namespace>
    <namespace>molpro::gci</namespace>
    <member kind="define">
      <type>#define</type>
      <name>hid_t</name>
      <anchorfile>gciMixedOperatorSecondQuant_8h.html</anchorfile>
      <anchor>a72876d2394751bd0ac29c69171515d62</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>constructHvib</name>
      <anchorfile>namespacemolpro_1_1gci.html</anchorfile>
      <anchor>a07f7d9dafcc03d24b27bdf58528246b6</anchor>
      <arglist>(VibOperator&lt; double &gt; &amp;Hvib, const std::string &amp;fcidump_name, int nmode, int nmodal)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>constructHvib</name>
      <anchorfile>namespacemolpro_1_1gci.html</anchorfile>
      <anchor>ad2ba4c052820d85cc3b9bf6e9e571f54</anchor>
      <arglist>(VibOperator&lt; double &gt; &amp;Hvib, int nmode, int nmodal, std::vector&lt; double &gt; freq)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>constructDMcoupling</name>
      <anchorfile>namespacemolpro_1_1gci.html</anchorfile>
      <anchor>a2368b28f705b3703dc6a052600799382</anchor>
      <arglist>(std::map&lt; std::string, MixedOperatorSecondQuant::hel_t &gt; &amp;elHam2, std::map&lt; std::string, VibOperator&lt; MixedOperatorSecondQuant::hel_t &gt;&gt; &amp;mixedHam, const std::string &amp;fcidump_f, const std::vector&lt; double &gt; &amp;gamma, const std::vector&lt; double &gt; &amp;freq, int nmode, int nmodal)</arglist>
    </member>
    <member kind="function">
      <type>std::ostream &amp;</type>
      <name>operator&lt;&lt;</name>
      <anchorfile>namespacemolpro_1_1gci.html</anchorfile>
      <anchor>af11e0e1ee586418f66120d0e9aee5a8b</anchor>
      <arglist>(std::ostream &amp;o, const MixedOperatorSecondQuant &amp;op)</arglist>
    </member>
  </compound>
  <compound kind="file">
    <name>gciMixedWavefunction.cpp</name>
    <path>/__w/gci/gci/src/molpro/gci/</path>
    <filename>gciMixedWavefunction_8cpp.html</filename>
    <includes id="gciMixedWavefunction_8h" name="gciMixedWavefunction.h" local="yes" imported="no">gciMixedWavefunction.h</includes>
    <includes id="gciHProductSet_8h" name="gciHProductSet.h" local="yes" imported="no">gciHProductSet.h</includes>
    <namespace>molpro</namespace>
    <namespace>molpro::gci</namespace>
  </compound>
  <compound kind="file">
    <name>gciMixedWavefunction.h</name>
    <path>/__w/gci/gci/src/molpro/gci/</path>
    <filename>gciMixedWavefunction_8h.html</filename>
    <includes id="gciHProductSet_8h" name="gciHProductSet.h" local="yes" imported="no">molpro/gci/gciHProductSet.h</includes>
    <includes id="gciMixedOperator_8h" name="gciMixedOperator.h" local="yes" imported="no">molpro/gci/gciMixedOperator.h</includes>
    <includes id="gciMixedOperatorSecondQuant_8h" name="gciMixedOperatorSecondQuant.h" local="yes" imported="no">molpro/gci/gciMixedOperatorSecondQuant.h</includes>
    <includes id="gciWavefunction_8h" name="gciWavefunction.h" local="yes" imported="no">molpro/gci/gciWavefunction.h</includes>
    <class kind="class">molpro::gci::MixedWavefunction</class>
    <namespace>molpro</namespace>
    <namespace>molpro::gci</namespace>
    <namespace>molpro::gci::array</namespace>
  </compound>
  <compound kind="file">
    <name>gciOptions.h</name>
    <path>/__w/gci/gci/src/molpro/gci/</path>
    <filename>gciOptions_8h.html</filename>
    <class kind="class">molpro::gci::Options</class>
    <namespace>molpro</namespace>
    <namespace>molpro::gci</namespace>
  </compound>
  <compound kind="file">
    <name>gciOrbitals.h</name>
    <path>/__w/gci/gci/src/molpro/gci/</path>
    <filename>gciOrbitals_8h.html</filename>
    <includes id="gciOrbitalSpace_8h" name="gciOrbitalSpace.h" local="yes" imported="no">molpro/gci/gciOrbitalSpace.h</includes>
    <includes id="gciPrintable_8h" name="gciPrintable.h" local="yes" imported="no">molpro/gci/gciPrintable.h</includes>
    <includes id="SMat_8h" name="SMat.h" local="no" imported="no">molpro/symmetry_matrix/SMat.h</includes>
    <class kind="class">molpro::gci::Orbitals</class>
    <namespace>molpro</namespace>
    <namespace>molpro::gci</namespace>
  </compound>
  <compound kind="file">
    <name>gciOrbitalSpace.cpp</name>
    <path>/__w/gci/gci/src/molpro/gci/</path>
    <filename>gciOrbitalSpace_8cpp.html</filename>
    <includes id="gciOrbitalSpace_8h" name="gciOrbitalSpace.h" local="yes" imported="no">gciOrbitalSpace.h</includes>
    <namespace>molpro</namespace>
    <namespace>molpro::gci</namespace>
  </compound>
  <compound kind="file">
    <name>gciOrbitalSpace.h</name>
    <path>/__w/gci/gci/src/molpro/gci/</path>
    <filename>gciOrbitalSpace_8h.html</filename>
    <includes id="gciOptions_8h" name="gciOptions.h" local="yes" imported="no">gciOptions.h</includes>
    <includes id="gciSymmetrySpace_8h" name="gciSymmetrySpace.h" local="yes" imported="no">gciSymmetrySpace.h</includes>
    <includes id="Operator_8h" name="Operator.h" local="no" imported="no">molpro/symmetry_matrix/Operator.h</includes>
    <class kind="class">molpro::gci::OrbitalSpace</class>
    <namespace>molpro</namespace>
    <namespace>molpro::gci</namespace>
  </compound>
  <compound kind="file">
    <name>gciPersistentOperator.cpp</name>
    <path>/__w/gci/gci/src/molpro/gci/</path>
    <filename>gciPersistentOperator_8cpp.html</filename>
    <includes id="gciPersistentOperator_8h" name="gciPersistentOperator.h" local="yes" imported="no">gciPersistentOperator.h</includes>
    <includes id="gci_8h" name="gci.h" local="yes" imported="no">gci.h</includes>
    <includes id="gciUtils_8h" name="gciUtils.h" local="yes" imported="no">gciUtils.h</includes>
    <namespace>molpro</namespace>
    <namespace>molpro::gci</namespace>
  </compound>
  <compound kind="file">
    <name>gciPersistentOperator.h</name>
    <path>/__w/gci/gci/src/molpro/gci/</path>
    <filename>gciPersistentOperator_8h.html</filename>
    <includes id="Operator_8h" name="Operator.h" local="no" imported="no">molpro/symmetry_matrix/Operator.h</includes>
    <class kind="class">molpro::gci::PersistentOperator</class>
    <namespace>molpro</namespace>
    <namespace>molpro::gci</namespace>
    <member kind="define">
      <type>#define</type>
      <name>hid_t</name>
      <anchorfile>gciPersistentOperator_8h.html</anchorfile>
      <anchor>a72876d2394751bd0ac29c69171515d62</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="file">
    <name>gciPrintable.h</name>
    <path>/__w/gci/gci/src/molpro/gci/</path>
    <filename>gciPrintable_8h.html</filename>
    <includes id="gci_8h" name="gci.h" local="yes" imported="no">molpro/gci/gci.h</includes>
    <class kind="class">molpro::gci::Printable</class>
    <namespace>molpro</namespace>
    <namespace>molpro::gci</namespace>
    <member kind="function">
      <type>std::ostream &amp;</type>
      <name>operator&lt;&lt;</name>
      <anchorfile>namespacemolpro_1_1gci.html</anchorfile>
      <anchor>afe901d292779e127d2e208c7a5562c38</anchor>
      <arglist>(std::ostream &amp;os, Printable const &amp;obj)</arglist>
    </member>
  </compound>
  <compound kind="file">
    <name>gciRun.cpp</name>
    <path>/__w/gci/gci/src/molpro/gci/</path>
    <filename>gciRun_8cpp.html</filename>
    <includes id="Operator_8h" name="Operator.h" local="no" imported="no">molpro/symmetry_matrix/Operator.h</includes>
    <includes id="gciWavefunction_8h" name="gciWavefunction.h" local="yes" imported="no">molpro/gci/gciWavefunction.h</includes>
    <includes id="WavefunctionHandler_8h" name="WavefunctionHandler.h" local="no" imported="no">molpro/gci/wavefunction/WavefunctionHandler.h</includes>
    <includes id="Problem_8h" name="Problem.h" local="yes" imported="no">Problem.h</includes>
    <includes id="gciDavidson_8h" name="gciDavidson.h" local="yes" imported="no">gciDavidson.h</includes>
    <includes id="gciMixedWavefunction_8h" name="gciMixedWavefunction.h" local="yes" imported="no">gciMixedWavefunction.h</includes>
    <includes id="gciRun_8h" name="gciRun.h" local="yes" imported="no">gciRun.h</includes>
    <includes id="gciOptions_8h" name="gciOptions.h" local="yes" imported="no">gciOptions.h</includes>
    <class kind="struct">molpro::gci::residual</class>
    <class kind="struct">molpro::gci::Presidual</class>
    <class kind="struct">molpro::gci::meanfield_residual</class>
    <class kind="struct">molpro::gci::updater</class>
    <namespace>molpro</namespace>
    <namespace>molpro::linalg</namespace>
    <namespace>molpro::gci</namespace>
    <member kind="typedef">
      <type>unsigned int</type>
      <name>uint</name>
      <anchorfile>gciRun_8cpp.html</anchorfile>
      <anchor>a69aa29b598b851b0640aa225a9e5d61d</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>std::vector&lt; Wavefunction &gt;</type>
      <name>ParameterVectorSet</name>
      <anchorfile>namespacemolpro_1_1gci.html</anchorfile>
      <anchor>a6aff8525163d30020a0dfc9f03dbac92</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>double</type>
      <name>scalar</name>
      <anchorfile>namespacemolpro_1_1gci.html</anchorfile>
      <anchor>ad290ac7c1ac2e78dfb9a34ace3c59082</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>std::map&lt; size_t, double &gt;</type>
      <name>Pvector</name>
      <anchorfile>namespacemolpro_1_1gci.html</anchorfile>
      <anchor>a93bc4e37dd503e5a6334adfbd5dc43a5</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>set_molpro_variable</name>
      <anchorfile>gciRun_8cpp.html</anchorfile>
      <anchor>a277daf29a1749705d9341a30681f59d5</anchor>
      <arglist>(const std::string &amp;name, const std::vector&lt; double &gt; &amp;values, size_t offset=0, size_t length=SIZE_MAX)</arglist>
    </member>
    <member kind="function">
      <type>MPI_Comm</type>
      <name>create_new_comm</name>
      <anchorfile>namespacemolpro_1_1gci.html</anchorfile>
      <anchor>a5b972710edeaf1387434f969e65ea44b</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>Eigen::VectorXd</type>
      <name>int1</name>
      <anchorfile>namespacemolpro_1_1gci.html</anchorfile>
      <anchor>a8b577999c4d871d66410fe046692cd70</anchor>
      <arglist>(const molpro::Operator &amp;hamiltonian, int spin)</arglist>
    </member>
    <member kind="function">
      <type>Eigen::MatrixXd</type>
      <name>intJ</name>
      <anchorfile>namespacemolpro_1_1gci.html</anchorfile>
      <anchor>adf86f34bf19ae32b3a84dde1a10b2d60</anchor>
      <arglist>(const molpro::Operator &amp;hamiltonian, int spini, int spinj)</arglist>
    </member>
    <member kind="function">
      <type>Eigen::MatrixXd</type>
      <name>intK</name>
      <anchorfile>namespacemolpro_1_1gci.html</anchorfile>
      <anchor>a152bd8328e9e1fe853d5a395f0437950</anchor>
      <arglist>(const molpro::Operator &amp;hamiltonian, int spin)</arglist>
    </member>
    <member kind="function">
      <type>molpro::Operator</type>
      <name>constructOperator</name>
      <anchorfile>namespacemolpro_1_1gci.html</anchorfile>
      <anchor>aec7484a4f64e8334c4665b49a9eab953</anchor>
      <arglist>(const molpro::FCIdump &amp;dump, bool collective=true)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>FCIDump</name>
      <anchorfile>namespacemolpro_1_1gci.html</anchorfile>
      <anchor>a48a994389e84ce021f24245c03dbf33e</anchor>
      <arglist>(const molpro::Operator &amp;op, const std::string filename, std::vector&lt; int &gt; orbital_symmetries=std::vector&lt; int &gt;(0))</arglist>
    </member>
    <member kind="function">
      <type>molpro::Operator</type>
      <name>fockOperator</name>
      <anchorfile>namespacemolpro_1_1gci.html</anchorfile>
      <anchor>a4fb1d4d9051a5c77e5cf63472b2038fe</anchor>
      <arglist>(const molpro::Operator &amp;hamiltonian, const Determinant &amp;reference, std::string description=&quot;Fock&quot;)</arglist>
    </member>
    <member kind="function">
      <type>molpro::Operator</type>
      <name>sameSpinOperator</name>
      <anchorfile>namespacemolpro_1_1gci.html</anchorfile>
      <anchor>aff0a782594874cd13b816f3248e5645f</anchor>
      <arglist>(const molpro::Operator &amp;hamiltonian, const Determinant &amp;reference, std::string description=&quot;Same Spin Hamiltonian&quot;)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>gsum</name>
      <anchorfile>namespacemolpro_1_1gci.html</anchorfile>
      <anchor>a2b9b892dfad15e9f6ce88e7c363accee</anchor>
      <arglist>(molpro::Operator &amp;op)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>gcirun</name>
      <anchorfile>gciRun_8cpp.html</anchorfile>
      <anchor>a4935915813c73a596de74034afeb9583</anchor>
      <arglist>(double *energies, int nenergies, char *fcidump, int64_t communicator)</arglist>
    </member>
    <member kind="variable">
      <type>int</type>
      <name>parallel_size</name>
      <anchorfile>namespacemolpro_1_1gci.html</anchorfile>
      <anchor>a03a3f22b8cd7b2789b98e6e3474bcb9b</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>int</type>
      <name>parallel_rank</name>
      <anchorfile>namespacemolpro_1_1gci.html</anchorfile>
      <anchor>a69609a4424d1e27aae322f69a8d6194e</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>bool</type>
      <name>molpro_plugin</name>
      <anchorfile>namespacemolpro_1_1gci.html</anchorfile>
      <anchor>ac21415d9dbec3ac5a369b37e5a75c494</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>MPI_Comm</type>
      <name>molpro_plugin_intercomm</name>
      <anchorfile>namespacemolpro_1_1gci.html</anchorfile>
      <anchor>afe262cf1cfd346b886eb2e6960cc80b7</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>std::map&lt; MPI_Comm, std::unique_ptr&lt; schedule::SharedCounter &gt; &gt;</type>
      <name>_nextval_counter</name>
      <anchorfile>namespacemolpro_1_1gci.html</anchorfile>
      <anchor>af584c0dd9eb59177902e0c9b09cd6d19</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>std::map&lt; MPI_Comm, int &gt;</type>
      <name>_ga_pgroups</name>
      <anchorfile>namespacemolpro_1_1gci.html</anchorfile>
      <anchor>ab68e9705410b18a0c47e1474b60595c6</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>MPI_Comm</type>
      <name>_sub_communicator</name>
      <anchorfile>namespacemolpro_1_1gci.html</anchorfile>
      <anchor>a6c1a231dfda15edff66c0b83603c18cd</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>MPI_Comm</type>
      <name>mpi_comm_compute</name>
      <anchorfile>namespacemolpro_1_1gci.html</anchorfile>
      <anchor>a40ef598d77230c2fd441c7800ae19540</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>std::map&lt; MPI_Comm, long int &gt;</type>
      <name>__my_first_task</name>
      <anchorfile>namespacemolpro_1_1gci.html</anchorfile>
      <anchor>add4a7d73fd92aee07b5d4a5c3d6af6d4</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>std::map&lt; MPI_Comm, long int &gt;</type>
      <name>__task</name>
      <anchorfile>namespacemolpro_1_1gci.html</anchorfile>
      <anchor>ab0edc7c75d899e607ea44372db45d53d</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>std::map&lt; MPI_Comm, long int &gt;</type>
      <name>__task_granularity</name>
      <anchorfile>namespacemolpro_1_1gci.html</anchorfile>
      <anchor>a0ae7fb09ab1a40ffcc81594ee448e9a5</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>std::unique_ptr&lt; molpro::Profiler &gt;</type>
      <name>profiler</name>
      <anchorfile>namespacemolpro_1_1gci.html</anchorfile>
      <anchor>a693228c63ef13caf937a222aed70c61c</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="file">
    <name>gciRun.h</name>
    <path>/__w/gci/gci/src/molpro/gci/</path>
    <filename>gciRun_8h.html</filename>
    <includes id="gciState_8h" name="gciState.h" local="yes" imported="no">molpro/gci/gciState.h</includes>
    <includes id="gciWavefunction_8h" name="gciWavefunction.h" local="yes" imported="no">molpro/gci/gciWavefunction.h</includes>
    <class kind="class">molpro::gci::Run</class>
    <namespace>molpro</namespace>
    <namespace>molpro::gci</namespace>
    <member kind="function">
      <type>Eigen::VectorXd</type>
      <name>int1</name>
      <anchorfile>namespacemolpro_1_1gci.html</anchorfile>
      <anchor>a8b577999c4d871d66410fe046692cd70</anchor>
      <arglist>(const molpro::Operator &amp;hamiltonian, int spin)</arglist>
    </member>
    <member kind="function">
      <type>Eigen::MatrixXd</type>
      <name>intJ</name>
      <anchorfile>namespacemolpro_1_1gci.html</anchorfile>
      <anchor>adf86f34bf19ae32b3a84dde1a10b2d60</anchor>
      <arglist>(const molpro::Operator &amp;hamiltonian, int spini, int spinj)</arglist>
    </member>
    <member kind="function">
      <type>Eigen::MatrixXd</type>
      <name>intK</name>
      <anchorfile>namespacemolpro_1_1gci.html</anchorfile>
      <anchor>a152bd8328e9e1fe853d5a395f0437950</anchor>
      <arglist>(const molpro::Operator &amp;hamiltonian, int spin)</arglist>
    </member>
    <member kind="function">
      <type>molpro::Operator</type>
      <name>constructOperator</name>
      <anchorfile>namespacemolpro_1_1gci.html</anchorfile>
      <anchor>aec7484a4f64e8334c4665b49a9eab953</anchor>
      <arglist>(const molpro::FCIdump &amp;dump, bool collective=true)</arglist>
    </member>
    <member kind="function">
      <type>molpro::Operator</type>
      <name>fockOperator</name>
      <anchorfile>namespacemolpro_1_1gci.html</anchorfile>
      <anchor>a4fb1d4d9051a5c77e5cf63472b2038fe</anchor>
      <arglist>(const molpro::Operator &amp;hamiltonian, const Determinant &amp;reference, std::string description=&quot;Fock&quot;)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>gsum</name>
      <anchorfile>namespacemolpro_1_1gci.html</anchorfile>
      <anchor>a2b9b892dfad15e9f6ce88e7c363accee</anchor>
      <arglist>(molpro::Operator &amp;op)</arglist>
    </member>
    <member kind="function">
      <type>molpro::Operator</type>
      <name>sameSpinOperator</name>
      <anchorfile>namespacemolpro_1_1gci.html</anchorfile>
      <anchor>aff0a782594874cd13b816f3248e5645f</anchor>
      <arglist>(const molpro::Operator &amp;hamiltonian, const Determinant &amp;reference, std::string description=&quot;Same Spin Hamiltonian&quot;)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>FCIDump</name>
      <anchorfile>namespacemolpro_1_1gci.html</anchorfile>
      <anchor>a48a994389e84ce021f24245c03dbf33e</anchor>
      <arglist>(const molpro::Operator &amp;op, const std::string filename, std::vector&lt; int &gt; orbital_symmetries=std::vector&lt; int &gt;(0))</arglist>
    </member>
  </compound>
  <compound kind="file">
    <name>gciState.cpp</name>
    <path>/__w/gci/gci/src/molpro/gci/</path>
    <filename>gciState_8cpp.html</filename>
    <includes id="gciState_8h" name="gciState.h" local="yes" imported="no">gciState.h</includes>
    <namespace>molpro</namespace>
    <namespace>molpro::gci</namespace>
  </compound>
  <compound kind="file">
    <name>gciState.h</name>
    <path>/__w/gci/gci/src/molpro/gci/</path>
    <filename>gciState_8h.html</filename>
    <includes id="gci_8h" name="gci.h" local="yes" imported="no">molpro/gci/gci.h</includes>
    <includes id="gciOptions_8h" name="gciOptions.h" local="yes" imported="no">molpro/gci/gciOptions.h</includes>
    <includes id="gciOrbitalSpace_8h" name="gciOrbitalSpace.h" local="yes" imported="no">molpro/gci/gciOrbitalSpace.h</includes>
    <includes id="gciPrintable_8h" name="gciPrintable.h" local="yes" imported="no">molpro/gci/gciPrintable.h</includes>
    <class kind="class">molpro::gci::State</class>
    <namespace>molpro</namespace>
    <namespace>molpro::gci</namespace>
  </compound>
  <compound kind="file">
    <name>gciString.cpp</name>
    <path>/__w/gci/gci/src/molpro/gci/</path>
    <filename>gciString_8cpp.html</filename>
    <includes id="gciString_8h" name="gciString.h" local="yes" imported="no">gciString.h</includes>
    <includes id="gciStringSet_8h" name="gciStringSet.h" local="yes" imported="no">gciStringSet.h</includes>
    <namespace>molpro</namespace>
    <namespace>molpro::gci</namespace>
  </compound>
  <compound kind="file">
    <name>gciString.h</name>
    <path>/__w/gci/gci/src/molpro/gci/</path>
    <filename>gciString_8h.html</filename>
    <includes id="gci_8h" name="gci.h" local="yes" imported="no">molpro/gci/gci.h</includes>
    <includes id="gciState_8h" name="gciState.h" local="yes" imported="no">molpro/gci/gciState.h</includes>
    <class kind="class">molpro::gci::String</class>
    <namespace>molpro</namespace>
    <namespace>molpro::gci</namespace>
  </compound>
  <compound kind="file">
    <name>gciStringSet.cpp</name>
    <path>/__w/gci/gci/src/molpro/gci/</path>
    <filename>gciStringSet_8cpp.html</filename>
    <includes id="gciStringSet_8h" name="gciStringSet.h" local="yes" imported="no">gciStringSet.h</includes>
    <namespace>molpro</namespace>
    <namespace>molpro::gci</namespace>
  </compound>
  <compound kind="file">
    <name>gciStringSet.h</name>
    <path>/__w/gci/gci/src/molpro/gci/</path>
    <filename>gciStringSet_8h.html</filename>
    <includes id="gciExcitationSet_8h" name="gciExcitationSet.h" local="yes" imported="no">molpro/gci/gciExcitationSet.h</includes>
    <includes id="gciPrintable_8h" name="gciPrintable.h" local="yes" imported="no">molpro/gci/gciPrintable.h</includes>
    <includes id="gciString_8h" name="gciString.h" local="yes" imported="no">molpro/gci/gciString.h</includes>
    <class kind="class">molpro::gci::StringSet</class>
    <namespace>molpro</namespace>
    <namespace>molpro::gci</namespace>
  </compound>
  <compound kind="file">
    <name>gciSymmetrySpace.cpp</name>
    <path>/__w/gci/gci/src/molpro/gci/</path>
    <filename>gciSymmetrySpace_8cpp.html</filename>
    <includes id="gciSymmetrySpace_8h" name="gciSymmetrySpace.h" local="yes" imported="no">gciSymmetrySpace.h</includes>
    <namespace>molpro</namespace>
    <namespace>molpro::gci</namespace>
  </compound>
  <compound kind="file">
    <name>gciSymmetrySpace.h</name>
    <path>/__w/gci/gci/src/molpro/gci/</path>
    <filename>gciSymmetrySpace_8h.html</filename>
    <includes id="gciPrintable_8h" name="gciPrintable.h" local="yes" imported="no">molpro/gci/gciPrintable.h</includes>
    <class kind="class">molpro::gci::SymmetrySpace</class>
    <namespace>molpro</namespace>
    <namespace>molpro::gci</namespace>
  </compound>
  <compound kind="file">
    <name>gciTransitionDensity.cpp</name>
    <path>/__w/gci/gci/src/molpro/gci/</path>
    <filename>gciTransitionDensity_8cpp.html</filename>
    <includes id="gciTransitionDensity_8h" name="gciTransitionDensity.h" local="yes" imported="no">gciTransitionDensity.h</includes>
    <namespace>molpro</namespace>
    <namespace>molpro::gci</namespace>
  </compound>
  <compound kind="file">
    <name>gciTransitionDensity.h</name>
    <path>/__w/gci/gci/src/molpro/gci/</path>
    <filename>gciTransitionDensity_8h.html</filename>
    <includes id="Operator_8h" name="Operator.h" local="no" imported="no">molpro/symmetry_matrix/Operator.h</includes>
    <includes id="SMat_8h" name="SMat.h" local="no" imported="no">molpro/symmetry_matrix/SMat.h</includes>
    <includes id="gciOrbitalSpace_8h" name="gciOrbitalSpace.h" local="yes" imported="no">molpro/gci/gciOrbitalSpace.h</includes>
    <includes id="gciPrintable_8h" name="gciPrintable.h" local="yes" imported="no">molpro/gci/gciPrintable.h</includes>
    <includes id="gciStringSet_8h" name="gciStringSet.h" local="yes" imported="no">molpro/gci/gciStringSet.h</includes>
    <includes id="gciWavefunction_8h" name="gciWavefunction.h" local="yes" imported="no">molpro/gci/gciWavefunction.h</includes>
    <class kind="class">molpro::gci::ctor_allocator</class>
    <class kind="struct">molpro::gci::ctor_allocator::rebind</class>
    <class kind="class">molpro::gci::TransitionDensity</class>
    <namespace>molpro</namespace>
    <namespace>molpro::gci</namespace>
  </compound>
  <compound kind="file">
    <name>gciUtils.cpp</name>
    <path>/__w/gci/gci/src/molpro/gci/</path>
    <filename>gciUtils_8cpp.html</filename>
    <includes id="gciUtils_8h" name="gciUtils.h" local="yes" imported="no">gciUtils.h</includes>
    <namespace>molpro</namespace>
    <namespace>molpro::gci</namespace>
    <namespace>molpro::gci::utils</namespace>
    <member kind="function">
      <type>bool</type>
      <name>file_exists</name>
      <anchorfile>namespacemolpro_1_1gci_1_1utils.html</anchorfile>
      <anchor>af40e41132a0026382ba114be8fbff4fa</anchor>
      <arglist>(const std::string &amp;fname, const std::string &amp;message=&quot;&quot;)</arglist>
    </member>
    <member kind="function">
      <type>int</type>
      <name>open_hdf5_file</name>
      <anchorfile>namespacemolpro_1_1gci_1_1utils.html</anchorfile>
      <anchor>a82309a03d6f6d74b61efa6c3a1bd37e1</anchor>
      <arglist>(const std::string &amp;fname, MPI_Comm communicator, bool create)</arglist>
    </member>
    <member kind="function">
      <type>bool</type>
      <name>hdf5_file_open</name>
      <anchorfile>namespacemolpro_1_1gci_1_1utils.html</anchorfile>
      <anchor>af70b57521b6923b2bb7c9716519bbae6</anchor>
      <arglist>(int file_id)</arglist>
    </member>
    <member kind="function">
      <type>bool</type>
      <name>hdf5_dataset_exists</name>
      <anchorfile>namespacemolpro_1_1gci_1_1utils.html</anchorfile>
      <anchor>ac2298febd5f20fb4daed9b79a5581039</anchor>
      <arglist>(int location, const std::string &amp;dataset_name)</arglist>
    </member>
    <member kind="function">
      <type>int</type>
      <name>open_or_create_hdf5_dataset</name>
      <anchorfile>namespacemolpro_1_1gci_1_1utils.html</anchorfile>
      <anchor>adfb84b16291cc485f9131f67c804dc36</anchor>
      <arglist>(const int &amp;location, const std::string &amp;dataset_name, const int &amp;dtype_id, const size_t &amp;length)</arglist>
    </member>
  </compound>
  <compound kind="file">
    <name>gciUtils.h</name>
    <path>/__w/gci/gci/src/molpro/gci/</path>
    <filename>gciUtils_8h.html</filename>
    <namespace>molpro</namespace>
    <namespace>molpro::gci</namespace>
    <namespace>molpro::gci::utils</namespace>
    <member kind="define">
      <type>#define</type>
      <name>hid_t</name>
      <anchorfile>gciUtils_8h.html</anchorfile>
      <anchor>a72876d2394751bd0ac29c69171515d62</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>bool</type>
      <name>file_exists</name>
      <anchorfile>namespacemolpro_1_1gci_1_1utils.html</anchorfile>
      <anchor>af40e41132a0026382ba114be8fbff4fa</anchor>
      <arglist>(const std::string &amp;fname, const std::string &amp;message=&quot;&quot;)</arglist>
    </member>
    <member kind="function">
      <type>int</type>
      <name>open_hdf5_file</name>
      <anchorfile>namespacemolpro_1_1gci_1_1utils.html</anchorfile>
      <anchor>a82309a03d6f6d74b61efa6c3a1bd37e1</anchor>
      <arglist>(const std::string &amp;fname, MPI_Comm communicator, bool create)</arglist>
    </member>
    <member kind="function">
      <type>bool</type>
      <name>hdf5_file_open</name>
      <anchorfile>namespacemolpro_1_1gci_1_1utils.html</anchorfile>
      <anchor>af70b57521b6923b2bb7c9716519bbae6</anchor>
      <arglist>(int file_id)</arglist>
    </member>
    <member kind="function">
      <type>bool</type>
      <name>hdf5_dataset_exists</name>
      <anchorfile>namespacemolpro_1_1gci_1_1utils.html</anchorfile>
      <anchor>ac2298febd5f20fb4daed9b79a5581039</anchor>
      <arglist>(int location, const std::string &amp;dataset_name)</arglist>
    </member>
    <member kind="function">
      <type>int</type>
      <name>open_or_create_hdf5_dataset</name>
      <anchorfile>namespacemolpro_1_1gci_1_1utils.html</anchorfile>
      <anchor>adfb84b16291cc485f9131f67c804dc36</anchor>
      <arglist>(const int &amp;location, const std::string &amp;dataset_name, const int &amp;dtype_id, const size_t &amp;length)</arglist>
    </member>
  </compound>
  <compound kind="file">
    <name>gciVibExcitation.h</name>
    <path>/__w/gci/gci/src/molpro/gci/</path>
    <filename>gciVibExcitation_8h.html</filename>
    <class kind="class">molpro::gci::VibExcitation</class>
    <namespace>molpro</namespace>
    <namespace>molpro::gci</namespace>
  </compound>
  <compound kind="file">
    <name>gciVibOperator.cpp</name>
    <path>/__w/gci/gci/src/molpro/gci/</path>
    <filename>gciVibOperator_8cpp.html</filename>
    <includes id="gciVibOperator_8h" name="gciVibOperator.h" local="yes" imported="no">gciVibOperator.h</includes>
    <namespace>molpro</namespace>
    <namespace>molpro::gci</namespace>
    <namespace>molpro::gci::ns_VibOperator</namespace>
    <member kind="function">
      <type>size_t</type>
      <name>hash</name>
      <anchorfile>namespacemolpro_1_1gci_1_1ns__VibOperator.html</anchorfile>
      <anchor>a3d66de902247b393b0b21e7cc0ab5028</anchor>
      <arglist>(const VibExcitation &amp;exc, int nMode, int nModal, parity_t hermiticity, parity_t exchange)</arglist>
    </member>
    <member kind="function">
      <type>size_t</type>
      <name>hash_mc1_sym</name>
      <anchorfile>namespacemolpro_1_1gci_1_1ns__VibOperator.html</anchorfile>
      <anchor>a6614730933ba1ea2fce486aaa6b1a04b</anchor>
      <arglist>(const VibExcitation &amp;exc, int nModal)</arglist>
    </member>
    <member kind="function">
      <type>size_t</type>
      <name>hash_mc1_nosym</name>
      <anchorfile>namespacemolpro_1_1gci_1_1ns__VibOperator.html</anchorfile>
      <anchor>abcf16d1a771c4506564f4e034312b194</anchor>
      <arglist>(const VibExcitation &amp;exc, int nModal)</arglist>
    </member>
    <member kind="function">
      <type>size_t</type>
      <name>hash_mc1_nosym_old</name>
      <anchorfile>namespacemolpro_1_1gci_1_1ns__VibOperator.html</anchorfile>
      <anchor>a1725c302094ef19c87f10627820a8d4e</anchor>
      <arglist>(const VibExcitation &amp;exc, int nModal)</arglist>
    </member>
  </compound>
  <compound kind="file">
    <name>gciVibOperator.h</name>
    <path>/__w/gci/gci/src/molpro/gci/</path>
    <filename>gciVibOperator_8h.html</filename>
    <includes id="Operator_8h" name="Operator.h" local="no" imported="no">molpro/symmetry_matrix/Operator.h</includes>
    <includes id="gciHProduct_8h" name="gciHProduct.h" local="yes" imported="no">molpro/gci/gciHProduct.h</includes>
    <includes id="gciVibExcitation_8h" name="gciVibExcitation.h" local="yes" imported="no">molpro/gci/gciVibExcitation.h</includes>
    <class kind="class">molpro::gci::VibTensEl</class>
    <class kind="class">molpro::gci::VibOperator</class>
    <namespace>molpro</namespace>
    <namespace>molpro::gci</namespace>
    <namespace>molpro::gci::ns_VibOperator</namespace>
    <member kind="enumeration">
      <type></type>
      <name>parity_t</name>
      <anchorfile>namespacemolpro_1_1gci_1_1ns__VibOperator.html</anchorfile>
      <anchor>aa6b0eccb81cf71f699d384838a9f8b53</anchor>
      <arglist></arglist>
      <enumvalue file="namespacemolpro_1_1gci_1_1ns__VibOperator.html" anchor="aa6b0eccb81cf71f699d384838a9f8b53a334c4a4c42fdb79d7ebc3e73b517e6f8">none</enumvalue>
      <enumvalue file="namespacemolpro_1_1gci_1_1ns__VibOperator.html" anchor="aa6b0eccb81cf71f699d384838a9f8b53acc935c5faf4c8f7a0468d7552a9b8138">even</enumvalue>
      <enumvalue file="namespacemolpro_1_1gci_1_1ns__VibOperator.html" anchor="aa6b0eccb81cf71f699d384838a9f8b53aa2b6f2a6066ed8700d83335fc50a2b8e">odd</enumvalue>
    </member>
    <member kind="function">
      <type>size_t</type>
      <name>hash</name>
      <anchorfile>namespacemolpro_1_1gci_1_1ns__VibOperator.html</anchorfile>
      <anchor>a3d66de902247b393b0b21e7cc0ab5028</anchor>
      <arglist>(const VibExcitation &amp;exc, int nMode, int nModal, parity_t hermiticity, parity_t exchange)</arglist>
    </member>
    <member kind="function">
      <type>size_t</type>
      <name>hash_mc1_sym</name>
      <anchorfile>namespacemolpro_1_1gci_1_1ns__VibOperator.html</anchorfile>
      <anchor>a6614730933ba1ea2fce486aaa6b1a04b</anchor>
      <arglist>(const VibExcitation &amp;exc, int nModal)</arglist>
    </member>
    <member kind="function">
      <type>size_t</type>
      <name>hash_mc1_nosym</name>
      <anchorfile>namespacemolpro_1_1gci_1_1ns__VibOperator.html</anchorfile>
      <anchor>abcf16d1a771c4506564f4e034312b194</anchor>
      <arglist>(const VibExcitation &amp;exc, int nModal)</arglist>
    </member>
    <member kind="function">
      <type>size_t</type>
      <name>hash_mc1_nosym_old</name>
      <anchorfile>namespacemolpro_1_1gci_1_1ns__VibOperator.html</anchorfile>
      <anchor>a1725c302094ef19c87f10627820a8d4e</anchor>
      <arglist>(const VibExcitation &amp;exc, int nModal)</arglist>
    </member>
  </compound>
  <compound kind="file">
    <name>gciVibSpace.cpp</name>
    <path>/__w/gci/gci/src/molpro/gci/</path>
    <filename>gciVibSpace_8cpp.html</filename>
    <includes id="gciVibSpace_8h" name="gciVibSpace.h" local="yes" imported="no">gciVibSpace.h</includes>
    <namespace>molpro</namespace>
    <namespace>molpro::gci</namespace>
  </compound>
  <compound kind="file">
    <name>gciVibSpace.h</name>
    <path>/__w/gci/gci/src/molpro/gci/</path>
    <filename>gciVibSpace_8h.html</filename>
    <class kind="struct">molpro::gci::VibSpace</class>
    <namespace>molpro</namespace>
    <namespace>molpro::gci</namespace>
  </compound>
  <compound kind="file">
    <name>gciWavefunction.cpp</name>
    <path>/__w/gci/gci/src/molpro/gci/</path>
    <filename>gciWavefunction_8cpp.html</filename>
    <includes id="gciWavefunction_8h" name="gciWavefunction.h" local="yes" imported="no">gciWavefunction.h</includes>
    <includes id="gci_8h" name="gci.h" local="yes" imported="no">gci.h</includes>
    <includes id="gciOrbitals_8h" name="gciOrbitals.h" local="yes" imported="no">gciOrbitals.h</includes>
    <includes id="gciRun_8h" name="gciRun.h" local="yes" imported="no">gciRun.h</includes>
    <includes id="gciStringSet_8h" name="gciStringSet.h" local="yes" imported="no">gciStringSet.h</includes>
    <includes id="gciTransitionDensity_8h" name="gciTransitionDensity.h" local="yes" imported="no">gciTransitionDensity.h</includes>
    <namespace>molpro</namespace>
    <namespace>molpro::gci</namespace>
    <member kind="typedef">
      <type>unsigned int</type>
      <name>uint</name>
      <anchorfile>namespacemolpro_1_1gci.html</anchorfile>
      <anchor>a2be15605b2c4fe82556bd5ac93701798</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>int</type>
      <name>_mpi_rank</name>
      <anchorfile>namespacemolpro_1_1gci.html</anchorfile>
      <anchor>ad164612271e547366674a008f2731d1c</anchor>
      <arglist>(MPI_Comm comm)</arglist>
    </member>
    <member kind="function">
      <type>int</type>
      <name>_mpi_size</name>
      <anchorfile>namespacemolpro_1_1gci.html</anchorfile>
      <anchor>a07e1c7b62b114bfbcc359bf6feb553a1</anchor>
      <arglist>(MPI_Comm comm)</arglist>
    </member>
    <member kind="function">
      <type>Wavefunction</type>
      <name>operator+</name>
      <anchorfile>namespacemolpro_1_1gci.html</anchorfile>
      <anchor>aba0738b624c3e61af44a30c22b3aab14</anchor>
      <arglist>(const Wavefunction &amp;w1, const Wavefunction &amp;w2)</arglist>
    </member>
    <member kind="function">
      <type>Wavefunction</type>
      <name>operator-</name>
      <anchorfile>namespacemolpro_1_1gci.html</anchorfile>
      <anchor>a05484faf6c56746f042757a6280bd6f9</anchor>
      <arglist>(const Wavefunction &amp;w1, const Wavefunction &amp;w2)</arglist>
    </member>
    <member kind="function">
      <type>Wavefunction</type>
      <name>operator/</name>
      <anchorfile>namespacemolpro_1_1gci.html</anchorfile>
      <anchor>a222c8dc451777cc1c2bfdc9ff93270e8</anchor>
      <arglist>(const Wavefunction &amp;w1, const Wavefunction &amp;w2)</arglist>
    </member>
    <member kind="function">
      <type>Wavefunction</type>
      <name>operator*</name>
      <anchorfile>namespacemolpro_1_1gci.html</anchorfile>
      <anchor>afe29acb0c67e08af6217e7329966ddee</anchor>
      <arglist>(const Wavefunction &amp;w1, const double &amp;value)</arglist>
    </member>
    <member kind="function">
      <type>Wavefunction</type>
      <name>operator*</name>
      <anchorfile>namespacemolpro_1_1gci.html</anchorfile>
      <anchor>a3a9f77ca823dfa72880c5413f52db8ab</anchor>
      <arglist>(const double &amp;value, const Wavefunction &amp;w1)</arglist>
    </member>
    <member kind="function">
      <type>double</type>
      <name>operator*</name>
      <anchorfile>namespacemolpro_1_1gci.html</anchorfile>
      <anchor>a50323d4a8da2af64d2046d73bdc79f39</anchor>
      <arglist>(const Wavefunction &amp;w1, const Wavefunction &amp;w2)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>MXM</name>
      <anchorfile>namespacemolpro_1_1gci.html</anchorfile>
      <anchor>ae83ac4a872001cdd083e7cabcd874f3e</anchor>
      <arglist>(double *Out, const double *A, const double *B, uint nRows, uint nLink, uint nCols, bool AddToDest, int nStrideLink=-1)</arglist>
    </member>
  </compound>
  <compound kind="file">
    <name>gciWavefunction.h</name>
    <path>/__w/gci/gci/src/molpro/gci/</path>
    <filename>gciWavefunction_8h.html</filename>
    <includes id="gci_8h" name="gci.h" local="yes" imported="no">molpro/gci/gci.h</includes>
    <includes id="gciDeterminant_8h" name="gciDeterminant.h" local="yes" imported="no">molpro/gci/gciDeterminant.h</includes>
    <includes id="gciFile_8h" name="gciFile.h" local="yes" imported="no">molpro/gci/gciFile.h</includes>
    <includes id="gciOrbitals_8h" name="gciOrbitals.h" local="yes" imported="no">molpro/gci/gciOrbitals.h</includes>
    <includes id="gciPrintable_8h" name="gciPrintable.h" local="yes" imported="no">molpro/gci/gciPrintable.h</includes>
    <includes id="gciState_8h" name="gciState.h" local="yes" imported="no">molpro/gci/gciState.h</includes>
    <includes id="gciStringSet_8h" name="gciStringSet.h" local="yes" imported="no">molpro/gci/gciStringSet.h</includes>
    <includes id="SMat_8h" name="SMat.h" local="no" imported="no">molpro/symmetry_matrix/SMat.h</includes>
    <class kind="class">molpro::gci::Wavefunction</class>
    <namespace>molpro</namespace>
    <namespace>molpro::gci</namespace>
    <member kind="function">
      <type>double</type>
      <name>operator*</name>
      <anchorfile>namespacemolpro_1_1gci.html</anchorfile>
      <anchor>a50323d4a8da2af64d2046d73bdc79f39</anchor>
      <arglist>(const Wavefunction &amp;w1, const Wavefunction &amp;w2)</arglist>
    </member>
    <member kind="function">
      <type>Wavefunction</type>
      <name>operator+</name>
      <anchorfile>namespacemolpro_1_1gci.html</anchorfile>
      <anchor>aba0738b624c3e61af44a30c22b3aab14</anchor>
      <arglist>(const Wavefunction &amp;w1, const Wavefunction &amp;w2)</arglist>
    </member>
    <member kind="function">
      <type>Wavefunction</type>
      <name>operator-</name>
      <anchorfile>namespacemolpro_1_1gci.html</anchorfile>
      <anchor>a05484faf6c56746f042757a6280bd6f9</anchor>
      <arglist>(const Wavefunction &amp;w1, const Wavefunction &amp;w2)</arglist>
    </member>
    <member kind="function">
      <type>Wavefunction</type>
      <name>operator/</name>
      <anchorfile>namespacemolpro_1_1gci.html</anchorfile>
      <anchor>a222c8dc451777cc1c2bfdc9ff93270e8</anchor>
      <arglist>(const Wavefunction &amp;w1, const Wavefunction &amp;w2)</arglist>
    </member>
    <member kind="function">
      <type>Wavefunction</type>
      <name>operator*</name>
      <anchorfile>namespacemolpro_1_1gci.html</anchorfile>
      <anchor>afe29acb0c67e08af6217e7329966ddee</anchor>
      <arglist>(const Wavefunction &amp;w1, const double &amp;value)</arglist>
    </member>
    <member kind="function">
      <type>Wavefunction</type>
      <name>operator*</name>
      <anchorfile>namespacemolpro_1_1gci.html</anchorfile>
      <anchor>a3a9f77ca823dfa72880c5413f52db8ab</anchor>
      <arglist>(const double &amp;value, const Wavefunction &amp;w1)</arglist>
    </member>
  </compound>
  <compound kind="file">
    <name>Problem.cpp</name>
    <path>/__w/gci/gci/src/molpro/gci/</path>
    <filename>Problem_8cpp.html</filename>
    <includes id="Problem_8h" name="Problem.h" local="yes" imported="no">Problem.h</includes>
  </compound>
  <compound kind="file">
    <name>Problem.h</name>
    <path>/__w/gci/gci/src/molpro/gci/</path>
    <filename>Problem_8h.html</filename>
    <includes id="gciWavefunction_8h" name="gciWavefunction.h" local="yes" imported="no">gciWavefunction.h</includes>
    <includes id="Operator_8h" name="Operator.h" local="no" imported="no">molpro/symmetry_matrix/Operator.h</includes>
    <class kind="class">molpro::gci::Problem</class>
    <namespace>molpro</namespace>
    <namespace>molpro::gci</namespace>
  </compound>
  <compound kind="file">
    <name>SharedCounter.h</name>
    <path>/__w/gci/gci/src/molpro/gci/schedule/</path>
    <filename>SharedCounter_8h.html</filename>
    <includes id="SharedCounterMPI3_8h" name="SharedCounterMPI3.h" local="yes" imported="no">molpro/gci/schedule/SharedCounterMPI3.h</includes>
    <namespace>molpro</namespace>
    <namespace>molpro::gci</namespace>
    <namespace>molpro::gci::schedule</namespace>
    <member kind="define">
      <type>#define</type>
      <name>GCI_SCHEDULE_SHAREDCOUNTER_TYPE</name>
      <anchorfile>SharedCounter_8h.html</anchorfile>
      <anchor>a2f9579fa97427a900c8f3785a721ca46</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>SharedCounterMPI3</type>
      <name>SharedCounter</name>
      <anchorfile>namespacemolpro_1_1gci_1_1schedule.html</anchorfile>
      <anchor>a69d55cb27e27909aeeb0446cf3e36c76</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="file">
    <name>SharedCounterBase.h</name>
    <path>/__w/gci/gci/src/molpro/gci/schedule/</path>
    <filename>SharedCounterBase_8h.html</filename>
    <class kind="class">molpro::gci::schedule::SharedCounterBase</class>
    <namespace>molpro</namespace>
    <namespace>molpro::gci</namespace>
    <namespace>molpro::gci::schedule</namespace>
  </compound>
  <compound kind="file">
    <name>SharedCounterMPI3.cpp</name>
    <path>/__w/gci/gci/src/molpro/gci/schedule/</path>
    <filename>SharedCounterMPI3_8cpp.html</filename>
    <includes id="SharedCounterMPI3_8h" name="SharedCounterMPI3.h" local="yes" imported="no">SharedCounterMPI3.h</includes>
    <namespace>molpro</namespace>
    <namespace>molpro::gci</namespace>
    <namespace>molpro::gci::schedule</namespace>
  </compound>
  <compound kind="file">
    <name>SharedCounterMPI3.h</name>
    <path>/__w/gci/gci/src/molpro/gci/schedule/</path>
    <filename>SharedCounterMPI3_8h.html</filename>
    <includes id="SharedCounterBase_8h" name="SharedCounterBase.h" local="yes" imported="no">molpro/gci/schedule/SharedCounterBase.h</includes>
    <class kind="class">molpro::gci::schedule::SharedCounterMPI3</class>
    <namespace>molpro</namespace>
    <namespace>molpro::gci</namespace>
    <namespace>molpro::gci::schedule</namespace>
  </compound>
  <compound kind="file">
    <name>WavefunctionHandler.h</name>
    <path>/__w/gci/gci/src/molpro/gci/wavefunction/</path>
    <filename>WavefunctionHandler_8h.html</filename>
    <class kind="class">molpro::gci::wavefunction::WavefunctionHandler</class>
    <class kind="class">molpro::gci::wavefunction::WavefunctionHandlerSparse</class>
    <namespace>molpro</namespace>
    <namespace>molpro::gci</namespace>
    <namespace>molpro::gci::wavefunction</namespace>
  </compound>
  <compound kind="file">
    <name>Operator-double.cpp</name>
    <path>/__w/gci/gci/src/molpro/symmetry_matrix/</path>
    <filename>Operator-double_8cpp.html</filename>
    <includes id="Operator-implementation_8h" name="Operator-implementation.h" local="yes" imported="no">Operator-implementation.h</includes>
    <class kind="class">Constants</class>
    <member kind="typedef">
      <type>double</type>
      <name>T</name>
      <anchorfile>Operator-double_8cpp.html</anchorfile>
      <anchor>a6b2d038ea9c8d2651eecffe0e28b7ebb</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="file">
    <name>Operator-implementation.h</name>
    <path>/__w/gci/gci/src/molpro/symmetry_matrix/</path>
    <filename>Operator-implementation_8h.html</filename>
    <includes id="Operator_8h" name="Operator.h" local="no" imported="no">molpro/symmetry_matrix/Operator.h</includes>
    <member kind="function">
      <type>parity_t</type>
      <name>parity</name>
      <anchorfile>Operator-implementation_8h.html</anchorfile>
      <anchor>a16b1d5bff65e7d8d50aca34740df0dd9</anchor>
      <arglist>(int hermiticity, parity_t odd=parityOddPacked)</arglist>
    </member>
  </compound>
  <compound kind="file">
    <name>Operator.h</name>
    <path>/__w/gci/gci/src/molpro/symmetry_matrix/</path>
    <filename>Operator_8h.html</filename>
    <includes id="SMat_8h" name="SMat.h" local="yes" imported="no">SMat.h</includes>
    <includes id="SMatMat_8h" name="SMatMat.h" local="yes" imported="no">SMatMat.h</includes>
    <class kind="class">molpro::Operator_</class>
    <namespace>molpro</namespace>
    <member kind="typedef">
      <type>typename molpro::Operator_&lt; double &gt;</type>
      <name>Operator</name>
      <anchorfile>namespacemolpro.html</anchorfile>
      <anchor>ac7045436261ae89fc1236ff3d70c9218</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>std::ostream &amp;</type>
      <name>operator&lt;&lt;</name>
      <anchorfile>namespacemolpro.html</anchorfile>
      <anchor>aeb1a854b5d484750e84957171556c573</anchor>
      <arglist>(std::ostream &amp;os, Operator_&lt; T &gt; const &amp;obj)</arglist>
    </member>
  </compound>
  <compound kind="file">
    <name>SMat-double.cpp</name>
    <path>/__w/gci/gci/src/molpro/symmetry_matrix/</path>
    <filename>SMat-double_8cpp.html</filename>
    <includes id="SMat-implementation_8h" name="SMat-implementation.h" local="yes" imported="no">SMat-implementation.h</includes>
    <namespace>molpro</namespace>
  </compound>
  <compound kind="file">
    <name>SMat-implementation.h</name>
    <path>/__w/gci/gci/src/molpro/symmetry_matrix/</path>
    <filename>SMat-implementation_8h.html</filename>
    <includes id="SMat_8h" name="SMat.h" local="yes" imported="no">SMat.h</includes>
    <namespace>molpro</namespace>
    <member kind="define">
      <type>#define</type>
      <name>ErrorExit</name>
      <anchorfile>SMat-implementation_8h.html</anchorfile>
      <anchor>a1ca07abd1e40fe4ebad03cfa51e1db70</anchor>
      <arglist>(Why)</arglist>
    </member>
    <member kind="typedef">
      <type>int32_t</type>
      <name>FORTINT</name>
      <anchorfile>SMat-implementation_8h.html</anchorfile>
      <anchor>a3a53032c42f894babd0ff2cf143ae1b5</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>double</type>
      <name>FORTDBL</name>
      <anchorfile>SMat-implementation_8h.html</anchorfile>
      <anchor>a45d856c41867ce68275cb1b1897cf857</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>FORTINT const  &amp;</type>
      <name>FINTARG</name>
      <anchorfile>SMat-implementation_8h.html</anchorfile>
      <anchor>aeee7f7a00d0cc7d3ff5275729cdf5abe</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>FORTDBL const  &amp;</type>
      <name>FDBLARG</name>
      <anchorfile>SMat-implementation_8h.html</anchorfile>
      <anchor>a5561f69ebdbf4fcd2c0d064bac98c41f</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="file">
    <name>SMat.cpp</name>
    <path>/__w/gci/gci/src/molpro/symmetry_matrix/</path>
    <filename>SMat_8cpp.html</filename>
    <includes id="SMat_8h" name="SMat.h" local="yes" imported="no">SMat.h</includes>
    <member kind="function">
      <type>void</type>
      <name>default_get_orbital_space</name>
      <anchorfile>SMat_8cpp.html</anchorfile>
      <anchor>aafc25ab605843659e2bb26a6804fded8</anchor>
      <arglist>(char c, size_t nt[])</arglist>
    </member>
  </compound>
  <compound kind="file">
    <name>SMat.h</name>
    <path>/__w/gci/gci/src/molpro/symmetry_matrix/</path>
    <filename>SMat_8h.html</filename>
    <class kind="class">molpro::SMat_</class>
    <class kind="class">molpro::SMat_::SVD</class>
    <namespace>molpro</namespace>
    <namespace>molpro::SymmetryMatrix</namespace>
    <member kind="typedef">
      <type>std::vector&lt; size_t &gt;</type>
      <name>dim_t</name>
      <anchorfile>namespacemolpro.html</anchorfile>
      <anchor>a67177c2ad49feab84008cc04c3bb1f7c</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>std::vector&lt; dim_t &gt;</type>
      <name>dims_t</name>
      <anchorfile>namespacemolpro.html</anchorfile>
      <anchor>a7a136b7a21c942e40967ed5bab20ff2e</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>typename molpro::SMat_&lt; double &gt;</type>
      <name>SMat</name>
      <anchorfile>namespacemolpro.html</anchorfile>
      <anchor>ad80f79742f183b105c60b295863d6718</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumeration">
      <type></type>
      <name>parity_t</name>
      <anchorfile>namespacemolpro.html</anchorfile>
      <anchor>a77b8d977180296c55c184036b65c5a6f</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>parityNone</name>
      <anchorfile>namespacemolpro.html</anchorfile>
      <anchor>a77b8d977180296c55c184036b65c5a6fab84d144528f1a54d906ec2d9922f3aec</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>parityEven</name>
      <anchorfile>namespacemolpro.html</anchorfile>
      <anchor>a77b8d977180296c55c184036b65c5a6fa09ceea7356628ff7d1cbc1d0149544e7</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>parityOdd</name>
      <anchorfile>namespacemolpro.html</anchorfile>
      <anchor>a77b8d977180296c55c184036b65c5a6fa5d5c6a3594b6f312d3d19b349ca8d25e</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>parityOddPacked</name>
      <anchorfile>namespacemolpro.html</anchorfile>
      <anchor>a77b8d977180296c55c184036b65c5a6fadf9df807b4f5e704d4dd447772943798</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>parityUnspecified</name>
      <anchorfile>namespacemolpro.html</anchorfile>
      <anchor>a77b8d977180296c55c184036b65c5a6fa36d4c7d8181c3d6fc1f1519c27b6e543</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>SMat_&lt; T &gt;</type>
      <name>operator*</name>
      <anchorfile>namespacemolpro.html</anchorfile>
      <anchor>a5be765a88a29ee1d6f4fd32ce4afec05</anchor>
      <arglist>(typename SMat_&lt; T &gt;::value_type a, SMat_&lt; T &gt; const &amp;b)</arglist>
    </member>
    <member kind="function">
      <type>SMat_&lt; T &gt;</type>
      <name>transpose</name>
      <anchorfile>namespacemolpro.html</anchorfile>
      <anchor>a85fc3fa2c992ee01ccea2509b9d76f37</anchor>
      <arglist>(const SMat_&lt; T &gt; &amp;mat)</arglist>
    </member>
    <member kind="function">
      <type>SMat_&lt; T &gt;</type>
      <name>eval</name>
      <anchorfile>namespacemolpro.html</anchorfile>
      <anchor>a796fa89776bd8cfb5cf59059f67cadda</anchor>
      <arglist>(const SMat_&lt; T &gt; &amp;mat)</arglist>
    </member>
    <member kind="function">
      <type>SMat_&lt; T &gt;</type>
      <name>trim</name>
      <anchorfile>namespacemolpro.html</anchorfile>
      <anchor>ac578bd58532fe11d0ef06da0ad0443e2</anchor>
      <arglist>(const SMat_&lt; T &gt; &amp;mat, typename SMat_&lt; T &gt;::scalar_type cut=0)</arglist>
    </member>
    <member kind="function">
      <type>std::ostream &amp;</type>
      <name>operator&lt;&lt;</name>
      <anchorfile>namespacemolpro.html</anchorfile>
      <anchor>a2913f10101dccd0a0d37d4f3196af078</anchor>
      <arglist>(std::ostream &amp;os, SMat_&lt; T &gt; const &amp;obj)</arglist>
    </member>
    <member kind="function">
      <type>dims_t</type>
      <name>spaces</name>
      <anchorfile>namespacemolpro_1_1SymmetryMatrix.html</anchorfile>
      <anchor>a0f57c0ef0c5cc587b17a063ef926d548</anchor>
      <arglist>(std::string space)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>register_get_orbital_space</name>
      <anchorfile>namespacemolpro_1_1SymmetryMatrix.html</anchorfile>
      <anchor>a2a57659578f3ba39e34a8c2d08256d09</anchor>
      <arglist>(void(*func)(char c, size_t nt[]))</arglist>
    </member>
  </compound>
  <compound kind="file">
    <name>SMatMat-double.cpp</name>
    <path>/__w/gci/gci/src/molpro/symmetry_matrix/</path>
    <filename>SMatMat-double_8cpp.html</filename>
    <includes id="SMatMat-implementation_8h" name="SMatMat-implementation.h" local="yes" imported="no">SMatMat-implementation.h</includes>
  </compound>
  <compound kind="file">
    <name>SMatMat-implementation.h</name>
    <path>/__w/gci/gci/src/molpro/symmetry_matrix/</path>
    <filename>SMatMat-implementation_8h.html</filename>
    <includes id="SMatMat_8h" name="SMatMat.h" local="yes" imported="no">SMatMat.h</includes>
  </compound>
  <compound kind="file">
    <name>SMatMat.h</name>
    <path>/__w/gci/gci/src/molpro/symmetry_matrix/</path>
    <filename>SMatMat_8h.html</filename>
    <includes id="SMat_8h" name="SMat.h" local="yes" imported="no">SMat.h</includes>
    <class kind="class">molpro::SMatMat_</class>
    <namespace>molpro</namespace>
    <member kind="typedef">
      <type>typename molpro::SMatMat_&lt; molpro::SMat_&lt; double &gt; &gt;</type>
      <name>SMatMat</name>
      <anchorfile>namespacemolpro.html</anchorfile>
      <anchor>a68eb83545d98691e82c07cb7b980adbe</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>std::ostream &amp;</type>
      <name>operator&lt;&lt;</name>
      <anchorfile>namespacemolpro.html</anchorfile>
      <anchor>a2edea01905081b3094c90bc9fc891282</anchor>
      <arglist>(std::ostream &amp;os, SMatMat_&lt; T &gt; const &amp;obj)</arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>Constants</name>
    <filename>classConstants.html</filename>
    <templarg></templarg>
    <member kind="variable">
      <type>const T</type>
      <name>s_zero</name>
      <anchorfile>classConstants.html</anchorfile>
      <anchor>afefbbb4e2463815c335cec7dcda61b3d</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>T</type>
      <name>return_value</name>
      <anchorfile>classConstants.html</anchorfile>
      <anchor>a6cde32c0dbd8644d379f0a060777bfa3</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>molpro::gci::ctor_allocator</name>
    <filename>classmolpro_1_1gci_1_1ctor__allocator.html</filename>
    <templarg></templarg>
    <templarg></templarg>
    <class kind="struct">molpro::gci::ctor_allocator::rebind</class>
    <member kind="function">
      <type>void</type>
      <name>construct</name>
      <anchorfile>classmolpro_1_1gci_1_1ctor__allocator.html</anchorfile>
      <anchor>a42ede2373f355974ed4140f408c1f3c3</anchor>
      <arglist>(U *ptr) noexcept(std::is_nothrow_default_constructible&lt; U &gt;::value)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>construct</name>
      <anchorfile>classmolpro_1_1gci_1_1ctor__allocator.html</anchorfile>
      <anchor>aa82a9da5dbad72f4147cc6b78f237ea1</anchor>
      <arglist>(U *ptr, Args &amp;&amp;... args)</arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>molpro::gci::run::Davidson</name>
    <filename>classmolpro_1_1gci_1_1run_1_1Davidson.html</filename>
    <templarg></templarg>
    <templarg></templarg>
    <member kind="typedef">
      <type>std::vector&lt; t_Wavefunction &gt;</type>
      <name>ParameterVectorSet</name>
      <anchorfile>classmolpro_1_1gci_1_1run_1_1Davidson.html</anchorfile>
      <anchor>a07dd1ba838e6064716978bb466cf1fb7</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>typename t_Wavefunction::value_type</type>
      <name>value_type</name>
      <anchorfile>classmolpro_1_1gci_1_1run_1_1Davidson.html</anchorfile>
      <anchor>a4ce068432b05daf302e071549ef6507e</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>Davidson</name>
      <anchorfile>classmolpro_1_1gci_1_1run_1_1Davidson.html</anchorfile>
      <anchor>ad83a312a474c48c70e3ec337b6ea41d1</anchor>
      <arglist>(const t_Wavefunction &amp;prototype, const t_Operator &amp;_ham, Options options)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>run</name>
      <anchorfile>classmolpro_1_1gci_1_1run_1_1Davidson.html</anchorfile>
      <anchor>a4eddd207a859edc2a12e78c5762d336b</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="variable">
      <type>t_Wavefunction</type>
      <name>prototype</name>
      <anchorfile>classmolpro_1_1gci_1_1run_1_1Davidson.html</anchorfile>
      <anchor>a0a9b7e69ff3697f98f48fcc51d53e311</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>const t_Operator &amp;</type>
      <name>ham</name>
      <anchorfile>classmolpro_1_1gci_1_1run_1_1Davidson.html</anchorfile>
      <anchor>a3c44ca5a5c0b5adb57a243182ae06418</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>Options</type>
      <name>options</name>
      <anchorfile>classmolpro_1_1gci_1_1run_1_1Davidson.html</anchorfile>
      <anchor>a5f7c10055f3f5410389c0cb7833263d1</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>std::shared_ptr&lt; t_Wavefunction &gt;</type>
      <name>diagonalH</name>
      <anchorfile>classmolpro_1_1gci_1_1run_1_1Davidson.html</anchorfile>
      <anchor>a00343d39bebadc104257a544f6cef438</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>ParameterVectorSet</type>
      <name>ww</name>
      <anchorfile>classmolpro_1_1gci_1_1run_1_1Davidson.html</anchorfile>
      <anchor>a14ceaab75002838a23bab0a21ba6c2e9</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>ParameterVectorSet</type>
      <name>gg</name>
      <anchorfile>classmolpro_1_1gci_1_1run_1_1Davidson.html</anchorfile>
      <anchor>a53f43e95cdc7f1c01bb0643debf433d4</anchor>
      <arglist></arglist>
    </member>
    <member kind="function" protection="protected">
      <type>void</type>
      <name>printMatrix</name>
      <anchorfile>classmolpro_1_1gci_1_1run_1_1Davidson.html</anchorfile>
      <anchor>a3a2bd52c8996235b4d6de9be69399eda</anchor>
      <arglist>(const std::string &amp;fname) const</arglist>
    </member>
    <member kind="function" protection="protected">
      <type>void</type>
      <name>message</name>
      <anchorfile>classmolpro_1_1gci_1_1run_1_1Davidson.html</anchorfile>
      <anchor>a478eced5d5077cab1a229b79a8a575a6</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function" protection="protected">
      <type>void</type>
      <name>initialize</name>
      <anchorfile>classmolpro_1_1gci_1_1run_1_1Davidson.html</anchorfile>
      <anchor>a2f487b9e36cda9131ddf4bf20d3ddac0</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function" protection="protected">
      <type>void</type>
      <name>prepareGuess</name>
      <anchorfile>classmolpro_1_1gci_1_1run_1_1Davidson.html</anchorfile>
      <anchor>a10424974d89c94a19e5a7b539396f1ab</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function" protection="protected">
      <type>void</type>
      <name>reference_electronic_states</name>
      <anchorfile>classmolpro_1_1gci_1_1run_1_1Davidson.html</anchorfile>
      <anchor>aeb36660f70b605b36e5a821a6162569e</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function" protection="protected">
      <type>void</type>
      <name>analysis</name>
      <anchorfile>classmolpro_1_1gci_1_1run_1_1Davidson.html</anchorfile>
      <anchor>abcb06eb1ef40399b54b9a0cee5d8b3d1</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function" protection="protected">
      <type>void</type>
      <name>energy_decomposition</name>
      <anchorfile>classmolpro_1_1gci_1_1run_1_1Davidson.html</anchorfile>
      <anchor>ac569aa2c52af8a10e4d8006efeafeeea</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function" protection="protected">
      <type>void</type>
      <name>action</name>
      <anchorfile>classmolpro_1_1gci_1_1run_1_1Davidson.html</anchorfile>
      <anchor>a3dc5e1a32cf0104f1ed242e8fe500dad</anchor>
      <arglist>(const std::vector&lt; int &gt; &amp;working_set)</arglist>
    </member>
    <member kind="function" protection="protected">
      <type>void</type>
      <name>update</name>
      <anchorfile>classmolpro_1_1gci_1_1run_1_1Davidson.html</anchorfile>
      <anchor>ae93af190a88e7c3c537dab417bd0ee3f</anchor>
      <arglist>(const std::vector&lt; int &gt; &amp;working_set)</arglist>
    </member>
    <member kind="function" protection="protected">
      <type>void</type>
      <name>backup</name>
      <anchorfile>classmolpro_1_1gci_1_1run_1_1Davidson.html</anchorfile>
      <anchor>ad6bda52df8cd9e94b6a7919c6afff609</anchor>
      <arglist>(std::vector&lt; t_Wavefunction &gt; &amp;ww)</arglist>
    </member>
    <member kind="function" protection="protected">
      <type>void</type>
      <name>reference_electronic_states</name>
      <anchorfile>classmolpro_1_1gci_1_1run_1_1Davidson.html</anchorfile>
      <anchor>a87941e6202baeb1b0099d6fe4e59a332</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function" protection="protected">
      <type>void</type>
      <name>prepareGuess</name>
      <anchorfile>classmolpro_1_1gci_1_1run_1_1Davidson.html</anchorfile>
      <anchor>a8a5d74a8eb28bd03860b72a7db134d2a</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function" protection="protected">
      <type>void</type>
      <name>energy_decomposition</name>
      <anchorfile>classmolpro_1_1gci_1_1run_1_1Davidson.html</anchorfile>
      <anchor>a2a45403d27e7f650f5a8b349c53c048a</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function" protection="protected">
      <type>void</type>
      <name>analysis</name>
      <anchorfile>classmolpro_1_1gci_1_1run_1_1Davidson.html</anchorfile>
      <anchor>a60fb6e1f2bed8283f3d737511424a098</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function" protection="protected">
      <type>void</type>
      <name>action</name>
      <anchorfile>classmolpro_1_1gci_1_1run_1_1Davidson.html</anchorfile>
      <anchor>aeb37f2e7948c048c73f676d3e8ae7419</anchor>
      <arglist>(const std::vector&lt; int &gt; &amp;working_set)</arglist>
    </member>
    <member kind="variable" protection="protected">
      <type>std::shared_ptr&lt; std::vector&lt; Wavefunction &gt; &gt;</type>
      <name>ref_elec_states</name>
      <anchorfile>classmolpro_1_1gci_1_1run_1_1Davidson.html</anchorfile>
      <anchor>ad3bc6dc5d4135a31e53ecb4783002b79</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" protection="protected">
      <type>std::unique_ptr&lt; linalg::itsolv::LinearEigensystem&lt; t_Wavefunction, t_Wavefunction, std::map&lt; size_t, typename t_Wavefunction::value_type &gt; &gt; &gt;</type>
      <name>solver</name>
      <anchorfile>classmolpro_1_1gci_1_1run_1_1Davidson.html</anchorfile>
      <anchor>a8e3a870052286e1750b33ee91774de5a</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" protection="protected">
      <type>double</type>
      <name>energyThreshold</name>
      <anchorfile>classmolpro_1_1gci_1_1run_1_1Davidson.html</anchorfile>
      <anchor>a3b00dc55d4d963e1b9946181e7316bfc</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" protection="protected">
      <type>unsigned int</type>
      <name>nState</name>
      <anchorfile>classmolpro_1_1gci_1_1run_1_1Davidson.html</anchorfile>
      <anchor>a7dab361fd20ca225c5e38eeb26d8ed48</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" protection="protected">
      <type>unsigned int</type>
      <name>maxIterations</name>
      <anchorfile>classmolpro_1_1gci_1_1run_1_1Davidson.html</anchorfile>
      <anchor>a6c55d4927a913c3fe556b03c940c1f86</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" protection="protected">
      <type>int</type>
      <name>solverVerbosity</name>
      <anchorfile>classmolpro_1_1gci_1_1run_1_1Davidson.html</anchorfile>
      <anchor>afb1830ca8b4bccee0a659b44b1dbe751</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" protection="protected">
      <type>int</type>
      <name>parallel_stringset</name>
      <anchorfile>classmolpro_1_1gci_1_1run_1_1Davidson.html</anchorfile>
      <anchor>a82074720b6afaa69fe26be5b94821681</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" protection="protected">
      <type>std::string</type>
      <name>restart_file</name>
      <anchorfile>classmolpro_1_1gci_1_1run_1_1Davidson.html</anchorfile>
      <anchor>a27531edeeb7ccdbe716f407b09d0fdd3</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" protection="protected">
      <type>std::string</type>
      <name>backup_file</name>
      <anchorfile>classmolpro_1_1gci_1_1run_1_1Davidson.html</anchorfile>
      <anchor>a09827b3b5a9d8f641710e82ef585ed7d</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" protection="protected">
      <type>std::vector&lt; size_t &gt;</type>
      <name>diag_minlocN</name>
      <anchorfile>classmolpro_1_1gci_1_1run_1_1Davidson.html</anchorfile>
      <anchor>a341d58fc78579e09ab043e4ca734b706</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" protection="protected">
      <type>std::vector&lt; double &gt;</type>
      <name>diag_val_at_minlocN</name>
      <anchorfile>classmolpro_1_1gci_1_1run_1_1Davidson.html</anchorfile>
      <anchor>a80becd7ea92e75fa921be0c7a2175a51</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>molpro::gci::Determinant</name>
    <filename>classmolpro_1_1gci_1_1Determinant.html</filename>
    <base>molpro::gci::State</base>
    <member kind="function">
      <type></type>
      <name>Determinant</name>
      <anchorfile>classmolpro_1_1gci_1_1Determinant.html</anchorfile>
      <anchor>a58c8046f01fcdee5359577f9c936ee7d</anchor>
      <arglist>(const State *State=nullptr, const String *alpha=nullptr, const String *beta=nullptr)</arglist>
    </member>
    <member kind="function">
      <type>int</type>
      <name>create</name>
      <anchorfile>classmolpro_1_1gci_1_1Determinant.html</anchorfile>
      <anchor>ad7a0bade7894bfecdd808ea15cbb4970</anchor>
      <arglist>(int orbital)</arglist>
    </member>
    <member kind="function">
      <type>int</type>
      <name>destroy</name>
      <anchorfile>classmolpro_1_1gci_1_1Determinant.html</anchorfile>
      <anchor>af75df1314ebb12c7a52e29e12edb3ce6</anchor>
      <arglist>(int orbital)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>first</name>
      <anchorfile>classmolpro_1_1gci_1_1Determinant.html</anchorfile>
      <anchor>a0e8e1b5e5f559691fbf16d5699e0fc5f</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>bool</type>
      <name>next</name>
      <anchorfile>classmolpro_1_1gci_1_1Determinant.html</anchorfile>
      <anchor>a20a47f745db2f4cf968d9bd3749d5f30</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>std::string</type>
      <name>str</name>
      <anchorfile>classmolpro_1_1gci_1_1Determinant.html</anchorfile>
      <anchor>a9d1ef911e8e743b26b36cde80d1347f2</anchor>
      <arglist>(int verbosity=0, unsigned int columns=UINT_MAX) const override</arglist>
    </member>
    <member kind="variable">
      <type>String</type>
      <name>stringAlpha</name>
      <anchorfile>classmolpro_1_1gci_1_1Determinant.html</anchorfile>
      <anchor>a7aebfc5daf1d17d4af361e074737771f</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>String</type>
      <name>stringBeta</name>
      <anchorfile>classmolpro_1_1gci_1_1Determinant.html</anchorfile>
      <anchor>a3ced82a3fa30660314f78c3e73754c6c</anchor>
      <arglist></arglist>
    </member>
    <member kind="friend" protection="private">
      <type>friend class</type>
      <name>Operator</name>
      <anchorfile>classmolpro_1_1gci_1_1Determinant.html</anchorfile>
      <anchor>a33ff3f826991522d2e77c1c523f33e19</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>molpro::gci::Excitation</name>
    <filename>classmolpro_1_1gci_1_1Excitation.html</filename>
    <member kind="function">
      <type></type>
      <name>Excitation</name>
      <anchorfile>classmolpro_1_1gci_1_1Excitation.html</anchorfile>
      <anchor>a63f8d0d6fcfa7268dd8307a37e353f4e</anchor>
      <arglist>()=delete</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>Excitation</name>
      <anchorfile>classmolpro_1_1gci_1_1Excitation.html</anchorfile>
      <anchor>ae09408133af1a45b313433ed9a82efda</anchor>
      <arglist>(size_t StringIndex, int Phase, size_t OrbitalAddress)</arglist>
    </member>
    <member kind="variable">
      <type>size_t</type>
      <name>stringIndex</name>
      <anchorfile>classmolpro_1_1gci_1_1Excitation.html</anchorfile>
      <anchor>abc0342993373c93a7eafecf129bd2ae9</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>int</type>
      <name>phase</name>
      <anchorfile>classmolpro_1_1gci_1_1Excitation.html</anchorfile>
      <anchor>a341072ee307c64267d939262b4e56218</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>size_t</type>
      <name>orbitalAddress</name>
      <anchorfile>classmolpro_1_1gci_1_1Excitation.html</anchorfile>
      <anchor>ad24ec6e7bd802a99430d91e30c5d8728</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>molpro::gci::ExcitationSet</name>
    <filename>classmolpro_1_1gci_1_1ExcitationSet.html</filename>
    <member kind="typedef">
      <type>ExcitationSetContainer::const_iterator</type>
      <name>const_iterator</name>
      <anchorfile>classmolpro_1_1gci_1_1ExcitationSet.html</anchorfile>
      <anchor>ac3c14512e0e418723da7f869c57c2c4f</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>ExcitationSet</name>
      <anchorfile>classmolpro_1_1gci_1_1ExcitationSet.html</anchorfile>
      <anchor>ae38adeed2bccff75bfe29811c22ac7b3</anchor>
      <arglist>()=delete</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>ExcitationSet</name>
      <anchorfile>classmolpro_1_1gci_1_1ExcitationSet.html</anchorfile>
      <anchor>ab53658ae7eb5472e6e42fa4e8f825688</anchor>
      <arglist>(const String &amp;from, const StringSet &amp;to, int annihilations, int creations, molpro::parity_t parity=molpro::parityNone)</arglist>
    </member>
    <member kind="function">
      <type>std::string</type>
      <name>str</name>
      <anchorfile>classmolpro_1_1gci_1_1ExcitationSet.html</anchorfile>
      <anchor>a26a3bdce8a4c01af5ba22d5888a33613</anchor>
      <arglist>(int verbosity=0) const</arglist>
    </member>
    <member kind="function">
      <type>size_t</type>
      <name>size</name>
      <anchorfile>classmolpro_1_1gci_1_1ExcitationSet.html</anchorfile>
      <anchor>a900a3a7eae6f9554b33f8239c95fc7be</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>ExcitationSetContainer::const_iterator</type>
      <name>begin</name>
      <anchorfile>classmolpro_1_1gci_1_1ExcitationSet.html</anchorfile>
      <anchor>aef06d2345b142651388414ce81a86bf6</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>ExcitationSetContainer::const_iterator</type>
      <name>end</name>
      <anchorfile>classmolpro_1_1gci_1_1ExcitationSet.html</anchorfile>
      <anchor>aff4693327e216d1a44b21d490614200f</anchor>
      <arglist>() const</arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>molpro::gci::File</name>
    <filename>classmolpro_1_1gci_1_1File.html</filename>
    <member kind="function">
      <type></type>
      <name>File</name>
      <anchorfile>classmolpro_1_1gci_1_1File.html</anchorfile>
      <anchor>a8ebf0be2c954d353f87192aaa913ff73</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>write</name>
      <anchorfile>classmolpro_1_1gci_1_1File.html</anchorfile>
      <anchor>a8bfe54e954f35d6063f9ebe0410b8cee</anchor>
      <arglist>(std::vector&lt; double &gt; &amp;buf, size_t address=0)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>write</name>
      <anchorfile>classmolpro_1_1gci_1_1File.html</anchorfile>
      <anchor>ac03d75878058ec612ce1bff812f6293c</anchor>
      <arglist>(double *buf, size_t length, size_t address=0)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>read</name>
      <anchorfile>classmolpro_1_1gci_1_1File.html</anchorfile>
      <anchor>a958fc92bc37e4ee76e98f081134096c2</anchor>
      <arglist>(std::vector&lt; double &gt; &amp;buf, size_t address=0)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>read</name>
      <anchorfile>classmolpro_1_1gci_1_1File.html</anchorfile>
      <anchor>a256d742f95ec698e7ea1229aa2c8a633</anchor>
      <arglist>(double *buf, size_t length, size_t address=0)</arglist>
    </member>
    <member kind="variable">
      <type>std::string</type>
      <name>name</name>
      <anchorfile>classmolpro_1_1gci_1_1File.html</anchorfile>
      <anchor>addf4ff57bf8fc098c120afdf25dbf43b</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>molpro::gci::HProduct</name>
    <filename>classmolpro_1_1gci_1_1HProduct.html</filename>
    <member kind="typedef">
      <type>std::array&lt; int, 2 &gt;</type>
      <name>modal_t</name>
      <anchorfile>classmolpro_1_1gci_1_1HProduct.html</anchorfile>
      <anchor>a8fee1fc8998529a19daa6d4f8874b30b</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>std::vector&lt; modal_t &gt;</type>
      <name>product_t</name>
      <anchorfile>classmolpro_1_1gci_1_1HProduct.html</anchorfile>
      <anchor>a5786cb2ac4aa7299dad5a57510784c49</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>HProduct</name>
      <anchorfile>classmolpro_1_1gci_1_1HProduct.html</anchorfile>
      <anchor>a5165450000bc2eec8839760e9acbef7e</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>HProduct</name>
      <anchorfile>classmolpro_1_1gci_1_1HProduct.html</anchorfile>
      <anchor>a17af3af6f62386697fc4a04216592b1b</anchor>
      <arglist>(product_t phi)</arglist>
    </member>
    <member kind="function">
      <type>product_t::iterator</type>
      <name>begin</name>
      <anchorfile>classmolpro_1_1gci_1_1HProduct.html</anchorfile>
      <anchor>a05eb3aab5d1064130a4a40f7351eb229</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>product_t::iterator</type>
      <name>end</name>
      <anchorfile>classmolpro_1_1gci_1_1HProduct.html</anchorfile>
      <anchor>ac23a3482deda777f6f6998fb94fda389</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>product_t::const_iterator</type>
      <name>begin</name>
      <anchorfile>classmolpro_1_1gci_1_1HProduct.html</anchorfile>
      <anchor>ae44d72194f42ff0eda923c0f2fe010a9</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>product_t::const_iterator</type>
      <name>end</name>
      <anchorfile>classmolpro_1_1gci_1_1HProduct.html</anchorfile>
      <anchor>a939562f413e32a27b8c43347bfa76d22</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>product_t::const_iterator</type>
      <name>cbegin</name>
      <anchorfile>classmolpro_1_1gci_1_1HProduct.html</anchorfile>
      <anchor>a9217cd98825dde002154c2f2b11514e8</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>product_t::const_iterator</type>
      <name>cend</name>
      <anchorfile>classmolpro_1_1gci_1_1HProduct.html</anchorfile>
      <anchor>af9c5fc1031e585fd720a74d7291de3ee</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>bool</type>
      <name>operator==</name>
      <anchorfile>classmolpro_1_1gci_1_1HProduct.html</anchorfile>
      <anchor>a8ac1ee94d9b2d13be6f79610673126b1</anchor>
      <arglist>(const HProduct &amp;other) const</arglist>
    </member>
    <member kind="function">
      <type>bool</type>
      <name>operator!=</name>
      <anchorfile>classmolpro_1_1gci_1_1HProduct.html</anchorfile>
      <anchor>a6e00f0a44e2286289ff56cb667cb667d</anchor>
      <arglist>(const HProduct &amp;other) const</arglist>
    </member>
    <member kind="function">
      <type>bool</type>
      <name>empty</name>
      <anchorfile>classmolpro_1_1gci_1_1HProduct.html</anchorfile>
      <anchor>ad21200704d45107a6763b153a178a5b7</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>auto</type>
      <name>excLvl</name>
      <anchorfile>classmolpro_1_1gci_1_1HProduct.html</anchorfile>
      <anchor>aca3abd79340131835158af63ed281dd1</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>int</type>
      <name>excLvl</name>
      <anchorfile>classmolpro_1_1gci_1_1HProduct.html</anchorfile>
      <anchor>a94819aead8fd14beb26b8752a339c304</anchor>
      <arglist>(int iMode) const</arglist>
    </member>
    <member kind="function">
      <type>const auto &amp;</type>
      <name>operator[]</name>
      <anchorfile>classmolpro_1_1gci_1_1HProduct.html</anchorfile>
      <anchor>a2c7496db646ab1c0050b2e30e77ce79f</anchor>
      <arglist>(unsigned long i) const</arglist>
    </member>
    <member kind="function">
      <type>HProduct</type>
      <name>excite</name>
      <anchorfile>classmolpro_1_1gci_1_1HProduct.html</anchorfile>
      <anchor>a6b843d75aaffc71d409160634b39b1a3</anchor>
      <arglist>(const VibExcitation &amp;exc) const</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>raise</name>
      <anchorfile>classmolpro_1_1gci_1_1HProduct.html</anchorfile>
      <anchor>a61f3297e6d82ff8bb59fa5bfeda508fc</anchor>
      <arglist>(int iMode)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>lower</name>
      <anchorfile>classmolpro_1_1gci_1_1HProduct.html</anchorfile>
      <anchor>a7c27060412affa63e9a8a7115ad8223c</anchor>
      <arglist>(int iMode)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>changeModal</name>
      <anchorfile>classmolpro_1_1gci_1_1HProduct.html</anchorfile>
      <anchor>a02ff4e97f621cd83a45374a1b0504265</anchor>
      <arglist>(int iMode, int diff)</arglist>
    </member>
    <member kind="function">
      <type>bool</type>
      <name>withinSpace</name>
      <anchorfile>classmolpro_1_1gci_1_1HProduct.html</anchorfile>
      <anchor>a139cf6a6adce2339fb2896eedb433ef7</anchor>
      <arglist>(const VibSpace &amp;vibSpace) const</arglist>
    </member>
    <member kind="function">
      <type>std::vector&lt; int &gt;</type>
      <name>excitedModes</name>
      <anchorfile>classmolpro_1_1gci_1_1HProduct.html</anchorfile>
      <anchor>adae6a719928445acd52aef256f990a4d</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function" protection="protected">
      <type>void</type>
      <name>order</name>
      <anchorfile>classmolpro_1_1gci_1_1HProduct.html</anchorfile>
      <anchor>a87637b39bc5f5036065da3bae6ff4d0e</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function" protection="protected">
      <type>void</type>
      <name>check</name>
      <anchorfile>classmolpro_1_1gci_1_1HProduct.html</anchorfile>
      <anchor>adfcd3e3259cbb2f5c9b07613d28a2655</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="variable" protection="protected">
      <type>product_t</type>
      <name>m_prod</name>
      <anchorfile>classmolpro_1_1gci_1_1HProduct.html</anchorfile>
      <anchor>a4089b7e38ce12a809932ae79d3333f89</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>molpro::gci::HProductSet</name>
    <filename>classmolpro_1_1gci_1_1HProductSet.html</filename>
    <member kind="typedef">
      <type>std::vector&lt; HProduct &gt;::const_iterator</type>
      <name>const_iterator</name>
      <anchorfile>classmolpro_1_1gci_1_1HProductSet.html</anchorfile>
      <anchor>add2311f6411434f1fc104409e755cea9</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>HProduct</type>
      <name>value_type</name>
      <anchorfile>classmolpro_1_1gci_1_1HProductSet.html</anchorfile>
      <anchor>a55fc4ed31ba6fa0b1e4ca2af377a94da</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>HProductSet</name>
      <anchorfile>classmolpro_1_1gci_1_1HProductSet.html</anchorfile>
      <anchor>a08917b25ccf1f847edc0381c963f6d85</anchor>
      <arglist>(const VibSpace &amp;vibSpace)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>HProductSet</name>
      <anchorfile>classmolpro_1_1gci_1_1HProductSet.html</anchorfile>
      <anchor>a383e3ba9a1477305f822631c01588f52</anchor>
      <arglist>(const HProduct &amp;bra, const VibSpace &amp;vibSpace, const VibOp &amp;vibOp)</arglist>
    </member>
    <member kind="function">
      <type>const_iterator</type>
      <name>begin</name>
      <anchorfile>classmolpro_1_1gci_1_1HProductSet.html</anchorfile>
      <anchor>ad10015ceacd59a78f299a708865adbf1</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>const_iterator</type>
      <name>end</name>
      <anchorfile>classmolpro_1_1gci_1_1HProductSet.html</anchorfile>
      <anchor>a4d0f061d018a7c19480f856429b38823</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>const auto &amp;</type>
      <name>operator[]</name>
      <anchorfile>classmolpro_1_1gci_1_1HProductSet.html</anchorfile>
      <anchor>a38ed287b611bbd678c32e5633be6525e</anchor>
      <arglist>(unsigned long i) const</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>generateFullSpace</name>
      <anchorfile>classmolpro_1_1gci_1_1HProductSet.html</anchorfile>
      <anchor>a4002081a6eadb1441c9800a7d00ce913</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>size_t</type>
      <name>index</name>
      <anchorfile>classmolpro_1_1gci_1_1HProductSet.html</anchorfile>
      <anchor>a8ccd007ee93d9c4501c6286cf596c941</anchor>
      <arglist>(const HProduct &amp;phi) const</arglist>
    </member>
    <member kind="function">
      <type>auto</type>
      <name>vibDim</name>
      <anchorfile>classmolpro_1_1gci_1_1HProductSet.html</anchorfile>
      <anchor>a6c9788d8b5c0bddaa3ca12a1935f5af7</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>auto</type>
      <name>size</name>
      <anchorfile>classmolpro_1_1gci_1_1HProductSet.html</anchorfile>
      <anchor>a87f78bc21825545521545d53e21cd3cb</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>auto</type>
      <name>excLvlDim</name>
      <anchorfile>classmolpro_1_1gci_1_1HProductSet.html</anchorfile>
      <anchor>a14c7425316072d262ec4ac60a035411a</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>VibSpace</type>
      <name>vibSpace</name>
      <anchorfile>classmolpro_1_1gci_1_1HProductSet.html</anchorfile>
      <anchor>af1e5969550a5cea6227a52b3ba4955a8</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>bool</type>
      <name>connectedSet</name>
      <anchorfile>classmolpro_1_1gci_1_1HProductSet.html</anchorfile>
      <anchor>a7ce6ae0f7f8310a98c0e91d4ce4cd34b</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function" protection="protected">
      <type>void</type>
      <name>setVibDim</name>
      <anchorfile>classmolpro_1_1gci_1_1HProductSet.html</anchorfile>
      <anchor>a36caac509e899193f7bcd97087208f90</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function" protection="protected">
      <type>void</type>
      <name>generateQcoupledSpace</name>
      <anchorfile>classmolpro_1_1gci_1_1HProductSet.html</anchorfile>
      <anchor>a980c784e15d7f7b336812179146c4286</anchor>
      <arglist>(const HProduct &amp;bra, const VibOp &amp;vibOp)</arglist>
    </member>
    <member kind="function" protection="protected">
      <type>void</type>
      <name>generateQsqCoupledSpace</name>
      <anchorfile>classmolpro_1_1gci_1_1HProductSet.html</anchorfile>
      <anchor>ad9d594a56a6e7a754731beef78355b2e</anchor>
      <arglist>(const HProduct &amp;bra, const VibOp &amp;vibOp)</arglist>
    </member>
    <member kind="variable" protection="protected">
      <type>VibSpace</type>
      <name>m_vibSpace</name>
      <anchorfile>classmolpro_1_1gci_1_1HProductSet.html</anchorfile>
      <anchor>a53044f9932f87bec5419d8285f63737e</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" protection="protected">
      <type>std::vector&lt; HProduct &gt;</type>
      <name>m_basis</name>
      <anchorfile>classmolpro_1_1gci_1_1HProductSet.html</anchorfile>
      <anchor>ad3c8736a4fd7e2dbee86788c6310a5e2</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" protection="protected">
      <type>size_t</type>
      <name>m_vibDim</name>
      <anchorfile>classmolpro_1_1gci_1_1HProductSet.html</anchorfile>
      <anchor>a9fd4bdaba83c2434b04e6b52b5a7efa1</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" protection="protected">
      <type>std::vector&lt; size_t &gt;</type>
      <name>m_excLvlDim</name>
      <anchorfile>classmolpro_1_1gci_1_1HProductSet.html</anchorfile>
      <anchor>a4550fd8fe8bb2930b77a594db77134a0</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" protection="protected">
      <type>bool</type>
      <name>m_connectedSet</name>
      <anchorfile>classmolpro_1_1gci_1_1HProductSet.html</anchorfile>
      <anchor>aa89b22117d82eae2289e9e1d2127f715</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="struct">
    <name>molpro::gci::meanfield_residual</name>
    <filename>structmolpro_1_1gci_1_1meanfield__residual.html</filename>
    <base>molpro::gci::residual</base>
    <member kind="function">
      <type></type>
      <name>meanfield_residual</name>
      <anchorfile>structmolpro_1_1gci_1_1meanfield__residual.html</anchorfile>
      <anchor>a696313098428af8e9b78731444d914f5</anchor>
      <arglist>(const molpro::Operator &amp;hamiltonian, bool subtract_Energy, molpro::Operator *Q=nullptr)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>operator()</name>
      <anchorfile>structmolpro_1_1gci_1_1meanfield__residual.html</anchorfile>
      <anchor>adc2ca6f0a4785d21d00d32b8dfb1b055</anchor>
      <arglist>(const ParameterVectorSet &amp;psx, ParameterVectorSet &amp;outputs, const std::vector&lt; double &gt; &amp;shift=std::vector&lt; double &gt;(), bool append=false) const</arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>molpro::gci::MixedOperator</name>
    <filename>classmolpro_1_1gci_1_1MixedOperator.html</filename>
    <member kind="function">
      <type></type>
      <name>MixedOperator</name>
      <anchorfile>classmolpro_1_1gci_1_1MixedOperator.html</anchorfile>
      <anchor>a4481ef2c405925fedc0623d20bb0000f</anchor>
      <arglist>(const molpro::FCIdump &amp;fcidump)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>MixedOperator</name>
      <anchorfile>classmolpro_1_1gci_1_1MixedOperator.html</anchorfile>
      <anchor>a6752276a93ca914ae3e55e616681efc5</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>~MixedOperator</name>
      <anchorfile>classmolpro_1_1gci_1_1MixedOperator.html</anchorfile>
      <anchor>a3171607488b230ac0cf36233e6f8d648</anchor>
      <arglist>()=default</arglist>
    </member>
    <member kind="function">
      <type>double</type>
      <name>expectVal</name>
      <anchorfile>classmolpro_1_1gci_1_1MixedOperator.html</anchorfile>
      <anchor>a8dd25128839076ebff086d1f166cb788</anchor>
      <arglist>(const HProduct &amp;bra, const HProduct &amp;ket, const VibOp &amp;vibOp) const</arglist>
    </member>
    <member kind="function">
      <type>auto</type>
      <name>begin</name>
      <anchorfile>classmolpro_1_1gci_1_1MixedOperator.html</anchorfile>
      <anchor>aff3f8d6488806724da40b3e69c212660</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>auto</type>
      <name>end</name>
      <anchorfile>classmolpro_1_1gci_1_1MixedOperator.html</anchorfile>
      <anchor>aa62da4f605de158f230450330490de6f</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>auto</type>
      <name>cbegin</name>
      <anchorfile>classmolpro_1_1gci_1_1MixedOperator.html</anchorfile>
      <anchor>a16843190a9a9e0b859f633cce4d1efe5</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>auto</type>
      <name>cend</name>
      <anchorfile>classmolpro_1_1gci_1_1MixedOperator.html</anchorfile>
      <anchor>a90b9184ef86d2c9621803671be60437d</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>bool</type>
      <name>inc_d1</name>
      <anchorfile>classmolpro_1_1gci_1_1MixedOperator.html</anchorfile>
      <anchor>af851d57a1b8ee18e2b850a3aa883d580</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>bool</type>
      <name>inc_d2</name>
      <anchorfile>classmolpro_1_1gci_1_1MixedOperator.html</anchorfile>
      <anchor>a2dc33dd32141366f21a16b82c985969c</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>bool</type>
      <name>inc_T1</name>
      <anchorfile>classmolpro_1_1gci_1_1MixedOperator.html</anchorfile>
      <anchor>a2c36da669fb1288dd3ebdac336e9f1a5</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>bool</type>
      <name>inc_T2</name>
      <anchorfile>classmolpro_1_1gci_1_1MixedOperator.html</anchorfile>
      <anchor>abbcc63b3fabd1a56c0cfa6254b94894a</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="variable">
      <type>unsigned int</type>
      <name>nMode</name>
      <anchorfile>classmolpro_1_1gci_1_1MixedOperator.html</anchorfile>
      <anchor>afdb807d41a6724db44b3dd89d1f05a32</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>std::vector&lt; double &gt;</type>
      <name>freq</name>
      <anchorfile>classmolpro_1_1gci_1_1MixedOperator.html</anchorfile>
      <anchor>a7b75e8bbeefef822b817d72ca1c1fb6e</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>double</type>
      <name>zpe</name>
      <anchorfile>classmolpro_1_1gci_1_1MixedOperator.html</anchorfile>
      <anchor>aa22fb4d04d67319741fc3d2274f67269</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>molpro::Operator</type>
      <name>Hel</name>
      <anchorfile>classmolpro_1_1gci_1_1MixedOperator.html</anchorfile>
      <anchor>a07b23ddae88da34ea34d9a8326415e37</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>std::map&lt; VibOpType, std::vector&lt; MixedOpTerm &gt; &gt;</type>
      <name>Hmix</name>
      <anchorfile>classmolpro_1_1gci_1_1MixedOperator.html</anchorfile>
      <anchor>a6d8df0c49897532e3dd59ed3b3a1ef9b</anchor>
      <arglist></arglist>
    </member>
    <member kind="function" protection="protected">
      <type>double</type>
      <name>O_Hvib</name>
      <anchorfile>classmolpro_1_1gci_1_1MixedOperator.html</anchorfile>
      <anchor>a3528ee457906fe9bcb54c57968541e77</anchor>
      <arglist>(const HProduct &amp;bra, const HProduct &amp;ket) const</arglist>
    </member>
    <member kind="function" protection="protected">
      <type>double</type>
      <name>O_Q</name>
      <anchorfile>classmolpro_1_1gci_1_1MixedOperator.html</anchorfile>
      <anchor>a31285fd1650941389cf5729b7771953b</anchor>
      <arglist>(const HProduct &amp;bra, const HProduct &amp;ket, const VibOp &amp;vibOp) const</arglist>
    </member>
    <member kind="function" protection="protected">
      <type>double</type>
      <name>O_dQ</name>
      <anchorfile>classmolpro_1_1gci_1_1MixedOperator.html</anchorfile>
      <anchor>a7cb9fafe285cd0029e9d1c9d09ff0b0a</anchor>
      <arglist>(const HProduct &amp;bra, const HProduct &amp;ket, const VibOp &amp;vibOp) const</arglist>
    </member>
    <member kind="function" protection="protected">
      <type>double</type>
      <name>O_Qsq</name>
      <anchorfile>classmolpro_1_1gci_1_1MixedOperator.html</anchorfile>
      <anchor>a5403e16c52afa0776ddd5f7752b1fdca</anchor>
      <arglist>(const HProduct &amp;bra, const HProduct &amp;ket, const VibOp &amp;vibOp) const</arglist>
    </member>
    <member kind="function" protection="protected">
      <type>double</type>
      <name>QtypeOperator</name>
      <anchorfile>classmolpro_1_1gci_1_1MixedOperator.html</anchorfile>
      <anchor>abdce3ad50409753b06a882712f70b3de</anchor>
      <arglist>(const HProduct &amp;bra, const HProduct &amp;ket, const std::function&lt; double(double, int, int)&gt; &amp;func, unsigned int targetMode) const</arglist>
    </member>
    <member kind="variable" protection="protected">
      <type>bool</type>
      <name>m_inc_d1</name>
      <anchorfile>classmolpro_1_1gci_1_1MixedOperator.html</anchorfile>
      <anchor>aa4e1ba83729dab757c49c2e908fa626c</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" protection="protected">
      <type>bool</type>
      <name>m_inc_d2</name>
      <anchorfile>classmolpro_1_1gci_1_1MixedOperator.html</anchorfile>
      <anchor>a827a19b7af5c2eb2dfbe2def804ed9ab</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" protection="protected">
      <type>bool</type>
      <name>m_inc_T1</name>
      <anchorfile>classmolpro_1_1gci_1_1MixedOperator.html</anchorfile>
      <anchor>ada1a1850f89eae515868eaf3e46978b3</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" protection="protected">
      <type>bool</type>
      <name>m_inc_T2</name>
      <anchorfile>classmolpro_1_1gci_1_1MixedOperator.html</anchorfile>
      <anchor>ac9f5ae5e47dbca1b5d33653662a8eed9</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>molpro::gci::MixedOperatorSecondQuant</name>
    <filename>classmolpro_1_1gci_1_1MixedOperatorSecondQuant.html</filename>
    <member kind="typedef">
      <type>PersistentOperator</type>
      <name>hel_t</name>
      <anchorfile>classmolpro_1_1gci_1_1MixedOperatorSecondQuant.html</anchorfile>
      <anchor>a8cb399813e0081a572ca554a19110d9f</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>MixedOperatorSecondQuant</name>
      <anchorfile>classmolpro_1_1gci_1_1MixedOperatorSecondQuant.html</anchorfile>
      <anchor>a594e918224001fa36f203416c72faa37</anchor>
      <arglist>(const Options &amp;options)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>MixedOperatorSecondQuant</name>
      <anchorfile>classmolpro_1_1gci_1_1MixedOperatorSecondQuant.html</anchorfile>
      <anchor>a68c20d2b79747759d479f4b53ffc40fb</anchor>
      <arglist>(const MixedOperatorSecondQuant &amp;other, const std::string &amp;include_ham)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>~MixedOperatorSecondQuant</name>
      <anchorfile>classmolpro_1_1gci_1_1MixedOperatorSecondQuant.html</anchorfile>
      <anchor>a7860f767ff71b412cd79d4a884a3ce31</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>bool</type>
      <name>connected</name>
      <anchorfile>classmolpro_1_1gci_1_1MixedOperatorSecondQuant.html</anchorfile>
      <anchor>ad0247223ca2170b5901db8b835297c6d</anchor>
      <arglist>(const HProduct &amp;bra, const HProduct &amp;ket) const</arglist>
    </member>
    <member kind="function">
      <type>std::string</type>
      <name>description</name>
      <anchorfile>classmolpro_1_1gci_1_1MixedOperatorSecondQuant.html</anchorfile>
      <anchor>a0d2a0c51ea28f190f040109e3f196a1a</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>initializeHel</name>
      <anchorfile>classmolpro_1_1gci_1_1MixedOperatorSecondQuant.html</anchorfile>
      <anchor>a370e1e21ce0a2f32fe8d5a531090b0df</anchor>
      <arglist>(const molpro::FCIdump &amp;fcidump, bool h0_only=false)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>initializeLambda</name>
      <anchorfile>classmolpro_1_1gci_1_1MixedOperatorSecondQuant.html</anchorfile>
      <anchor>aa4b6defe4960b688d15b2b32fbb9cadd</anchor>
      <arglist>(const molpro::FCIdump &amp;fcidump)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>initializeK</name>
      <anchorfile>classmolpro_1_1gci_1_1MixedOperatorSecondQuant.html</anchorfile>
      <anchor>a778958fd4b9f8aac85a64eff895114fb</anchor>
      <arglist>(const molpro::FCIdump &amp;fcidump)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>initializeD</name>
      <anchorfile>classmolpro_1_1gci_1_1MixedOperatorSecondQuant.html</anchorfile>
      <anchor>a58db43a3d0d417565b9ac4e505d22955</anchor>
      <arglist>(const molpro::FCIdump &amp;fcidump)</arglist>
    </member>
    <member kind="function" static="yes">
      <type>static molpro::Operator</type>
      <name>constructOperatorAntisymm1el</name>
      <anchorfile>classmolpro_1_1gci_1_1MixedOperatorSecondQuant.html</anchorfile>
      <anchor>aee50d19589f31052a172e21cdf0f5dd4</anchor>
      <arglist>(const molpro::FCIdump &amp;dump, bool collective=true)</arglist>
    </member>
    <member kind="function" static="yes">
      <type>static molpro::Operator</type>
      <name>constructK</name>
      <anchorfile>classmolpro_1_1gci_1_1MixedOperatorSecondQuant.html</anchorfile>
      <anchor>a19df7506970fc166fc17861d3fe48c26</anchor>
      <arglist>(const molpro::FCIdump &amp;dump, bool collective=true)</arglist>
    </member>
    <member kind="function" static="yes">
      <type>static molpro::Operator</type>
      <name>constructD</name>
      <anchorfile>classmolpro_1_1gci_1_1MixedOperatorSecondQuant.html</anchorfile>
      <anchor>aba26e673e90f72d830248ccd27a38877</anchor>
      <arglist>(const molpro::FCIdump &amp;dump, bool collective=true)</arglist>
    </member>
    <member kind="variable">
      <type>const int</type>
      <name>nMode</name>
      <anchorfile>classmolpro_1_1gci_1_1MixedOperatorSecondQuant.html</anchorfile>
      <anchor>a387ac71d39b61037cc405b1214dbb77e</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>const int</type>
      <name>nModal</name>
      <anchorfile>classmolpro_1_1gci_1_1MixedOperatorSecondQuant.html</anchorfile>
      <anchor>a85997e30b9d98f993b21a2da23a2179b</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>VibOperator&lt; double &gt;</type>
      <name>Hvib</name>
      <anchorfile>classmolpro_1_1gci_1_1MixedOperatorSecondQuant.html</anchorfile>
      <anchor>afdeb52a825bd77b5646a12a7131026b3</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>std::map&lt; std::string, hel_t &gt;</type>
      <name>elHam</name>
      <anchorfile>classmolpro_1_1gci_1_1MixedOperatorSecondQuant.html</anchorfile>
      <anchor>ae102916e8248a8c80e58543eb6ceba59</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>std::map&lt; std::string, hel_t &gt;</type>
      <name>elHam2</name>
      <anchorfile>classmolpro_1_1gci_1_1MixedOperatorSecondQuant.html</anchorfile>
      <anchor>a23682e8016a151ecb4734d3c7182fc85</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>std::map&lt; std::string, VibOperator&lt; hel_t &gt; &gt;</type>
      <name>mixedHam</name>
      <anchorfile>classmolpro_1_1gci_1_1MixedOperatorSecondQuant.html</anchorfile>
      <anchor>a5384756d0cfe14546cd906d625b15d41</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" protection="protected">
      <type>std::string</type>
      <name>m_fcidump_f</name>
      <anchorfile>classmolpro_1_1gci_1_1MixedOperatorSecondQuant.html</anchorfile>
      <anchor>aacda0c5f5040e6f206e75b64f08681f9</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" protection="protected">
      <type>std::string</type>
      <name>hdf5_fname</name>
      <anchorfile>classmolpro_1_1gci_1_1MixedOperatorSecondQuant.html</anchorfile>
      <anchor>a528aaeafd4282e83614e31473e5fcef8</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" protection="protected">
      <type>bool</type>
      <name>restart</name>
      <anchorfile>classmolpro_1_1gci_1_1MixedOperatorSecondQuant.html</anchorfile>
      <anchor>a751ec141ee56d5cdaa4a4c15a7400b25</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" protection="protected">
      <type>int</type>
      <name>hid_file</name>
      <anchorfile>classmolpro_1_1gci_1_1MixedOperatorSecondQuant.html</anchorfile>
      <anchor>a22adf48108e73a6c7ce0472733a69c1e</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" protection="protected">
      <type>bool</type>
      <name>hdf5_file_owner</name>
      <anchorfile>classmolpro_1_1gci_1_1MixedOperatorSecondQuant.html</anchorfile>
      <anchor>a48ed379afdc6848b6fe0e1391513383e</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" protection="protected">
      <type>std::string</type>
      <name>m_description</name>
      <anchorfile>classmolpro_1_1gci_1_1MixedOperatorSecondQuant.html</anchorfile>
      <anchor>ad98169ee9c3d318db21090bba9b81e9a</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="struct">
    <name>molpro::gci::MixedOpTerm</name>
    <filename>structmolpro_1_1gci_1_1MixedOpTerm.html</filename>
    <member kind="function">
      <type></type>
      <name>MixedOpTerm</name>
      <anchorfile>structmolpro_1_1gci_1_1MixedOpTerm.html</anchorfile>
      <anchor>a4b97ef337da95a3ae8d7b3822fee355a</anchor>
      <arglist>(VibOp vibOp, const molpro::FCIdump &amp;fcidump)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>MixedOpTerm</name>
      <anchorfile>structmolpro_1_1gci_1_1MixedOpTerm.html</anchorfile>
      <anchor>a2f90ce767c3e0f079252b8b35890614e</anchor>
      <arglist>(VibOp vibOp, const molpro::Operator &amp;op)</arglist>
    </member>
    <member kind="variable">
      <type>VibOp</type>
      <name>vibOp</name>
      <anchorfile>structmolpro_1_1gci_1_1MixedOpTerm.html</anchorfile>
      <anchor>aa0d79e8f8f30d83072ceaedaafce56c1</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>molpro::Operator</type>
      <name>Hel</name>
      <anchorfile>structmolpro_1_1gci_1_1MixedOpTerm.html</anchorfile>
      <anchor>aaf92701cacba09e07b64993f438791af</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>molpro::gci::MixedWavefunction</name>
    <filename>classmolpro_1_1gci_1_1MixedWavefunction.html</filename>
    <base virtualness="virtual">molpro::gci::Printable</base>
    <member kind="typedef">
      <type>double</type>
      <name>value_type</name>
      <anchorfile>classmolpro_1_1gci_1_1MixedWavefunction.html</anchorfile>
      <anchor>a4028e16fe155db072567429f5657f94c</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>double</type>
      <name>mapped_type</name>
      <anchorfile>classmolpro_1_1gci_1_1MixedWavefunction.html</anchorfile>
      <anchor>a36ecc0300caa4c988c80fa14ce313c3a</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>MixedWavefunction</name>
      <anchorfile>classmolpro_1_1gci_1_1MixedWavefunction.html</anchorfile>
      <anchor>aee1f0bd119e8f87f1f97fe4e419d20cd</anchor>
      <arglist>(const Options &amp;options, const State &amp;prototype, MPI_Comm head_commun=mpi_comm_compute)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>MixedWavefunction</name>
      <anchorfile>classmolpro_1_1gci_1_1MixedWavefunction.html</anchorfile>
      <anchor>af6f0f590ff5ea5d76126d2497f91b874</anchor>
      <arglist>(const MixedWavefunction &amp;source)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>MixedWavefunction</name>
      <anchorfile>classmolpro_1_1gci_1_1MixedWavefunction.html</anchorfile>
      <anchor>a836ef3c7b9812b22782e333ac7710988</anchor>
      <arglist>(const MixedWavefunction &amp;source, int option)</arglist>
    </member>
    <member kind="function">
      <type>MixedWavefunction &amp;</type>
      <name>operator=</name>
      <anchorfile>classmolpro_1_1gci_1_1MixedWavefunction.html</anchorfile>
      <anchor>a52c9633c5069b06876fc14f789e95437</anchor>
      <arglist>(const MixedWavefunction &amp;source)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>MixedWavefunction</name>
      <anchorfile>classmolpro_1_1gci_1_1MixedWavefunction.html</anchorfile>
      <anchor>a187625489f001a6c8f57cbb7ece60d02</anchor>
      <arglist>(const std::map&lt; size_t, double &gt; &amp;source)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>~MixedWavefunction</name>
      <anchorfile>classmolpro_1_1gci_1_1MixedWavefunction.html</anchorfile>
      <anchor>a5ffa0175663511ef6b3771a4e97b51bc</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>MixedWavefunction &amp;</type>
      <name>operator=</name>
      <anchorfile>classmolpro_1_1gci_1_1MixedWavefunction.html</anchorfile>
      <anchor>abbeee10bb466c76889821d13546f7a7e</anchor>
      <arglist>(const std::map&lt; size_t, double &gt; &amp;source)</arglist>
    </member>
    <member kind="function">
      <type>Wavefunction</type>
      <name>wavefunctionAt</name>
      <anchorfile>classmolpro_1_1gci_1_1MixedWavefunction.html</anchorfile>
      <anchor>acf783c092f0e7b6f6433e720e489adcd</anchor>
      <arglist>(size_t iVib, MPI_Comm commun) const</arglist>
    </member>
    <member kind="function">
      <type>VibSpace</type>
      <name>vibSpace</name>
      <anchorfile>classmolpro_1_1gci_1_1MixedWavefunction.html</anchorfile>
      <anchor>a85b547a5e567007375ecbcd48d5ebd7a</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>size_t</type>
      <name>elDim</name>
      <anchorfile>classmolpro_1_1gci_1_1MixedWavefunction.html</anchorfile>
      <anchor>a22e8c796be6390039598680b8c6a11bf</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>size_t</type>
      <name>vibDim</name>
      <anchorfile>classmolpro_1_1gci_1_1MixedWavefunction.html</anchorfile>
      <anchor>a3881c8306863c39c44b12b84a901041d</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>replicate</name>
      <anchorfile>classmolpro_1_1gci_1_1MixedWavefunction.html</anchorfile>
      <anchor>a415a62734497f43fdc25c460bffa814b</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>put</name>
      <anchorfile>classmolpro_1_1gci_1_1MixedWavefunction.html</anchorfile>
      <anchor>ab18eac7011ff6e82413f0a2e4222aa25</anchor>
      <arglist>(int iVib, Wavefunction &amp;wfn)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>accumulate</name>
      <anchorfile>classmolpro_1_1gci_1_1MixedWavefunction.html</anchorfile>
      <anchor>a71d39be12c8ee923c9b1d2efe73aaf4b</anchor>
      <arglist>(int iVib, Wavefunction &amp;wfn)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>operatorOnWavefunction</name>
      <anchorfile>classmolpro_1_1gci_1_1MixedWavefunction.html</anchorfile>
      <anchor>a11212d0cb6fcc8839c595af9def003cd</anchor>
      <arglist>(const MixedOperatorSecondQuant &amp;ham, const MixedWavefunction &amp;w, bool parallel_stringset=false, bool with_sync=true)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>diagonalOperator</name>
      <anchorfile>classmolpro_1_1gci_1_1MixedWavefunction.html</anchorfile>
      <anchor>a1d07c23003e244a2ea275f992829dbc5</anchor>
      <arglist>(const MixedOperatorSecondQuant &amp;ham, bool parallel_stringset=false)</arglist>
    </member>
    <member kind="function">
      <type>std::vector&lt; double &gt;</type>
      <name>vibDensity</name>
      <anchorfile>classmolpro_1_1gci_1_1MixedWavefunction.html</anchorfile>
      <anchor>a0eb43ff2c6a7a95dfbd8ce886f1a3fc0</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>bool</type>
      <name>compatible</name>
      <anchorfile>classmolpro_1_1gci_1_1MixedWavefunction.html</anchorfile>
      <anchor>ae0d2c264e85604906e9c3c2d58f14fff</anchor>
      <arglist>(const MixedWavefunction &amp;other) const</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>settilesize</name>
      <anchorfile>classmolpro_1_1gci_1_1MixedWavefunction.html</anchorfile>
      <anchor>a06fa4a682575c8f4e9993d70c8316583</anchor>
      <arglist>(int a, int b, int c)</arglist>
    </member>
    <member kind="function">
      <type>std::string</type>
      <name>str</name>
      <anchorfile>classmolpro_1_1gci_1_1MixedWavefunction.html</anchorfile>
      <anchor>a14fe2b97e356829337a31f309daa1b49</anchor>
      <arglist>(int v=0, unsigned int c=0) const override</arglist>
    </member>
    <member kind="function">
      <type>double</type>
      <name>dot</name>
      <anchorfile>classmolpro_1_1gci_1_1MixedWavefunction.html</anchorfile>
      <anchor>aa496d1b43d299e3d9bb68ebd384d71cb</anchor>
      <arglist>(const MixedWavefunction &amp;w) const</arglist>
    </member>
    <member kind="function">
      <type>double</type>
      <name>dot</name>
      <anchorfile>classmolpro_1_1gci_1_1MixedWavefunction.html</anchorfile>
      <anchor>a0d5d7a42a42468fb35209f157714262c</anchor>
      <arglist>(const std::map&lt; size_t, double &gt; &amp;w) const</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>axpy</name>
      <anchorfile>classmolpro_1_1gci_1_1MixedWavefunction.html</anchorfile>
      <anchor>a6616b9e75eca387dd55f62824b303762</anchor>
      <arglist>(double a, const std::map&lt; size_t, double &gt; &amp;w)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>axpy</name>
      <anchorfile>classmolpro_1_1gci_1_1MixedWavefunction.html</anchorfile>
      <anchor>a9b2ae40a50f97072e0ae7829a21ac057</anchor>
      <arglist>(double a, const MixedWavefunction &amp;w)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>allocate_buffer</name>
      <anchorfile>classmolpro_1_1gci_1_1MixedWavefunction.html</anchorfile>
      <anchor>aec6b4c4e2f4cd94cd770823be879ea06</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>sync</name>
      <anchorfile>classmolpro_1_1gci_1_1MixedWavefunction.html</anchorfile>
      <anchor>a5f0f09320e06464a1e558ecb52199867</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>zero</name>
      <anchorfile>classmolpro_1_1gci_1_1MixedWavefunction.html</anchorfile>
      <anchor>aee9b5ac38173e7c6c1f9eba661f3e9be</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>size_t</type>
      <name>size</name>
      <anchorfile>classmolpro_1_1gci_1_1MixedWavefunction.html</anchorfile>
      <anchor>a45a6032505ac6abdb8d5a863b832ee28</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>double</type>
      <name>at</name>
      <anchorfile>classmolpro_1_1gci_1_1MixedWavefunction.html</anchorfile>
      <anchor>a4c2327889871880024edd28aa9d80763</anchor>
      <arglist>(size_t i) const</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>set</name>
      <anchorfile>classmolpro_1_1gci_1_1MixedWavefunction.html</anchorfile>
      <anchor>a94754bf6219465514f4a3cfe6b732278</anchor>
      <arglist>(size_t i, double v)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>scal</name>
      <anchorfile>classmolpro_1_1gci_1_1MixedWavefunction.html</anchorfile>
      <anchor>a44e2042ba8e678df9932913f33e62be2</anchor>
      <arglist>(double a)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>fill</name>
      <anchorfile>classmolpro_1_1gci_1_1MixedWavefunction.html</anchorfile>
      <anchor>a9c0cc075179edad6ffd146826b1ab13e</anchor>
      <arglist>(double a)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>divide</name>
      <anchorfile>classmolpro_1_1gci_1_1MixedWavefunction.html</anchorfile>
      <anchor>a48e5f37693336c03596483ddb398919d</anchor>
      <arglist>(const MixedWavefunction *y, const MixedWavefunction *z, double shift=0, bool append=false, bool negative=false)</arglist>
    </member>
    <member kind="function">
      <type>std::vector&lt; size_t &gt;</type>
      <name>minlocN</name>
      <anchorfile>classmolpro_1_1gci_1_1MixedWavefunction.html</anchorfile>
      <anchor>a437f949c9700e944a63c566c89e6f50d</anchor>
      <arglist>(int n) const</arglist>
    </member>
    <member kind="function" static="yes">
      <type>static void</type>
      <name>ga_wfn_block_bound</name>
      <anchorfile>classmolpro_1_1gci_1_1MixedWavefunction.html</anchorfile>
      <anchor>a7ada113853c91e69c59080548f5b6b51</anchor>
      <arglist>(int iVib, int *lo, int *hi, int dimension)</arglist>
    </member>
    <member kind="function" static="yes">
      <type>static void</type>
      <name>copy_to_local</name>
      <anchorfile>classmolpro_1_1gci_1_1MixedWavefunction.html</anchorfile>
      <anchor>ace0d199e8d628a7730890f1deee2d5db</anchor>
      <arglist>(const MixedWavefunction &amp;w, int iVib, Wavefunction &amp;wfn)</arglist>
    </member>
    <member kind="variable">
      <type>MPI_Comm</type>
      <name>m_child_communicator</name>
      <anchorfile>classmolpro_1_1gci_1_1MixedWavefunction.html</anchorfile>
      <anchor>ad5aec185968ca71c755071bf500686b0</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>std::shared_ptr&lt; molpro::linalg::array::DistrArrayMPI3 &gt;</type>
      <name>distr_buffer</name>
      <anchorfile>classmolpro_1_1gci_1_1MixedWavefunction.html</anchorfile>
      <anchor>a5b2c89e7a143073f19c57238c440fee6</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" protection="protected">
      <type>VibSpace</type>
      <name>m_vibSpace</name>
      <anchorfile>classmolpro_1_1gci_1_1MixedWavefunction.html</anchorfile>
      <anchor>a1a6d9440cddb71074a844a24038382f9</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" protection="protected">
      <type>HProductSet</type>
      <name>m_vibBasis</name>
      <anchorfile>classmolpro_1_1gci_1_1MixedWavefunction.html</anchorfile>
      <anchor>ab066fdc05f81d4dc6fda51bd4007c798</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" protection="protected">
      <type>size_t</type>
      <name>m_elDim</name>
      <anchorfile>classmolpro_1_1gci_1_1MixedWavefunction.html</anchorfile>
      <anchor>ab4b2a7b9b3fea34da43fd31a4b59630b</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" protection="protected">
      <type>Wavefunction</type>
      <name>m_prototype</name>
      <anchorfile>classmolpro_1_1gci_1_1MixedWavefunction.html</anchorfile>
      <anchor>aeec22e6d427f7760f0b154877587a271</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>molpro::Operator_</name>
    <filename>classmolpro_1_1Operator__.html</filename>
    <templarg></templarg>
    <member kind="typedef">
      <type>typename molpro::SMat_&lt; T &gt;</type>
      <name>SMat</name>
      <anchorfile>classmolpro_1_1Operator__.html</anchorfile>
      <anchor>ae1ef34578d969007b734457c6bc1d2f9</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>typename molpro::SMatMat_&lt; SMat_&lt; T &gt; &gt;</type>
      <name>SMatMat</name>
      <anchorfile>classmolpro_1_1Operator__.html</anchorfile>
      <anchor>a37715a8f038a9b1b30c7313162b0b13b</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>T</type>
      <name>value_type</name>
      <anchorfile>classmolpro_1_1Operator__.html</anchorfile>
      <anchor>afab25fe0985b9fa0d805ed025f8675a1</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>typename SMat::scalar_type</type>
      <name>scalar_type</name>
      <anchorfile>classmolpro_1_1Operator__.html</anchorfile>
      <anchor>a9b4d3db6de1dab48cb24df9e103d721f</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>typename SMat::M</type>
      <name>M</name>
      <anchorfile>classmolpro_1_1Operator__.html</anchorfile>
      <anchor>a241cf0330d2821aa482e9e444c77e869</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>typename SMat::Mconst</type>
      <name>Mconst</name>
      <anchorfile>classmolpro_1_1Operator__.html</anchorfile>
      <anchor>a74261107fa015ddb34132335d86d0af4</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>typename SMat::V</type>
      <name>V</name>
      <anchorfile>classmolpro_1_1Operator__.html</anchorfile>
      <anchor>ab00213c3de4be018d16422be4e3615ba</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>Operator_</name>
      <anchorfile>classmolpro_1_1Operator__.html</anchorfile>
      <anchor>ad7405980136ba27e76d96d4ef9046a88</anchor>
      <arglist>(std::array&lt; dims_t, 2 &gt; dimensions, int rank=2, bool uhf=false, std::vector&lt; int &gt; hermiticity={1, 1}, std::vector&lt; int &gt; exchange={-1, -1}, unsigned int symmetry=0, bool covariant=true, bool diagonal=false, std::string description=&quot;&quot;)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>Operator_</name>
      <anchorfile>classmolpro_1_1Operator__.html</anchorfile>
      <anchor>a0bd136b96a55fa0944b0e0ba5943f5be</anchor>
      <arglist>(dims_t dimensions, int rank=2, bool uhf=false, std::vector&lt; int &gt; hermiticity={1, 1}, std::vector&lt; int &gt; exchange={-1, -1}, unsigned int symmetry=0, bool covariant=true, bool diagonal=false, std::string description=&quot;&quot;)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>Operator_</name>
      <anchorfile>classmolpro_1_1Operator__.html</anchorfile>
      <anchor>adf0acdfeffdfd837a0b421b6d7924f5c</anchor>
      <arglist>(dim_t dimension, int rank=2, bool uhf=false, unsigned int symmetry=0, bool covariant=true, bool diagonal=false, std::string description=&quot;&quot;)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>Operator_</name>
      <anchorfile>classmolpro_1_1Operator__.html</anchorfile>
      <anchor>a7f77ca6066c3a89cde14ea50d4a2c424</anchor>
      <arglist>(const Operator_&lt; T &gt; &amp;source)</arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual</type>
      <name>~Operator_</name>
      <anchorfile>classmolpro_1_1Operator__.html</anchorfile>
      <anchor>a01c7e471da062f7ad08aa4c8e90e7288</anchor>
      <arglist>()=default</arglist>
    </member>
    <member kind="function">
      <type>Operator_&lt; T &gt; &amp;</type>
      <name>operator=</name>
      <anchorfile>classmolpro_1_1Operator__.html</anchorfile>
      <anchor>ab9db718a668d87b5a3383f0399e2989b</anchor>
      <arglist>(const Operator_&lt; T &gt; &amp;source)</arglist>
    </member>
    <member kind="function">
      <type>class Operator_</type>
      <name>slice</name>
      <anchorfile>classmolpro_1_1Operator__.html</anchorfile>
      <anchor>a006ae4dc28e42f8f120647c6f97ce4c1</anchor>
      <arglist>(std::array&lt; dims_t, 2 &gt; dimensions, std::array&lt; dims_t, 2 &gt; offset={}, std::string description=&quot;&quot;) const</arglist>
    </member>
    <member kind="function">
      <type>class Operator_</type>
      <name>slice</name>
      <anchorfile>classmolpro_1_1Operator__.html</anchorfile>
      <anchor>a765537c08e97be8a994fb8382a61f604</anchor>
      <arglist>(dims_t dimensions, dims_t offset={{0, 0, 0, 0, 0, 0, 0, 0}, {0, 0, 0, 0, 0, 0, 0, 0}, {0, 0, 0, 0, 0, 0, 0, 0}, {0, 0, 0, 0, 0, 0, 0, 0}}, std::string description=&quot;&quot;) const</arglist>
    </member>
    <member kind="function">
      <type>const SMat &amp;</type>
      <name>O1</name>
      <anchorfile>classmolpro_1_1Operator__.html</anchorfile>
      <anchor>aec38276794abf3d4582e8865ee7e49aa</anchor>
      <arglist>(bool spinUp=true) const</arglist>
    </member>
    <member kind="function">
      <type>SMat &amp;</type>
      <name>O1</name>
      <anchorfile>classmolpro_1_1Operator__.html</anchorfile>
      <anchor>aa4551acbf71b32165d1eddf6bcdcee69</anchor>
      <arglist>(bool spinUp=true)</arglist>
    </member>
    <member kind="function">
      <type>const SMatMat &amp;</type>
      <name>O2</name>
      <anchorfile>classmolpro_1_1Operator__.html</anchorfile>
      <anchor>a6dca1a22715063777629a87ded042396</anchor>
      <arglist>(bool spinUp1=true, bool spinUp2=true, bool mulliken=true, bool ensure=true) const</arglist>
    </member>
    <member kind="function">
      <type>SMatMat &amp;</type>
      <name>O2</name>
      <anchorfile>classmolpro_1_1Operator__.html</anchorfile>
      <anchor>a0cfc712beccff1681e55161dda503746</anchor>
      <arglist>(bool spinUp1=true, bool spinUp2=true)</arglist>
    </member>
    <member kind="function">
      <type>const value_type &amp;</type>
      <name>element</name>
      <anchorfile>classmolpro_1_1Operator__.html</anchorfile>
      <anchor>a70901845f6938d7330cba6ddf2263a44</anchor>
      <arglist>(int i, int isym, int j, int jsym, int k, int ksym, int l, int lsym, bool spinUp1=true, bool spinUp2=true, bool mulliken=true) const</arglist>
    </member>
    <member kind="function">
      <type>value_type &amp;</type>
      <name>element</name>
      <anchorfile>classmolpro_1_1Operator__.html</anchorfile>
      <anchor>a5f79ce00954d821a90f47653c876199e</anchor>
      <arglist>(int i, int isym, int j, int jsym, int k, int ksym, int l, int lsym, bool spinUp1=true, bool spinUp2=true)</arglist>
    </member>
    <member kind="function">
      <type>const value_type &amp;</type>
      <name>element</name>
      <anchorfile>classmolpro_1_1Operator__.html</anchorfile>
      <anchor>abe5cbe7c2113d4073d1dd944d5205b02</anchor>
      <arglist>(int i, int isym, int j, int jsym, bool spinUp1=true) const</arglist>
    </member>
    <member kind="function">
      <type>value_type &amp;</type>
      <name>element</name>
      <anchorfile>classmolpro_1_1Operator__.html</anchorfile>
      <anchor>ae2edad167011e906cb8b510bee0525e7</anchor>
      <arglist>(int i, int isym, int j, int jsym, bool spinUp1=true)</arglist>
    </member>
    <member kind="function">
      <type>std::string</type>
      <name>str</name>
      <anchorfile>classmolpro_1_1Operator__.html</anchorfile>
      <anchor>ad34403a5cf7a4cd77944d1f5e54bda13</anchor>
      <arglist>(std::string title=&quot;&quot;, int level=1) const</arglist>
    </member>
    <member kind="function">
      <type>size_t</type>
      <name>dimension</name>
      <anchorfile>classmolpro_1_1Operator__.html</anchorfile>
      <anchor>a15c240d847db968d49232583f481fc5c</anchor>
      <arglist>(unsigned int symmetry=0, unsigned int axis=0, bool spinUp=true) const</arglist>
    </member>
    <member kind="function">
      <type>class molpro::bytestream</type>
      <name>bytestream</name>
      <anchorfile>classmolpro_1_1Operator__.html</anchorfile>
      <anchor>a1d2d5660ff702b36c528629ab5aaee76</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>class Operator_</type>
      <name>fock</name>
      <anchorfile>classmolpro_1_1Operator__.html</anchorfile>
      <anchor>a669299f878e03d1e06e65ddf09e3d3d9</anchor>
      <arglist>(const class Operator_ &amp;density, bool oneElectron=true, std::string description=&quot;&quot;) const</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>zero</name>
      <anchorfile>classmolpro_1_1Operator__.html</anchorfile>
      <anchor>a1b8666aedb49899b0176cef3fe5d94ec</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>class Operator_ &amp;</type>
      <name>operator+=</name>
      <anchorfile>classmolpro_1_1Operator__.html</anchorfile>
      <anchor>a6179fc8618d97b316f340239f8cee816</anchor>
      <arglist>(const class Operator_ &amp;other)</arglist>
    </member>
    <member kind="function">
      <type>class Operator_ &amp;</type>
      <name>operator-=</name>
      <anchorfile>classmolpro_1_1Operator__.html</anchorfile>
      <anchor>a92a18303329a4a9a8f1aedc1c20435dc</anchor>
      <arglist>(const class Operator_ &amp;other)</arglist>
    </member>
    <member kind="function">
      <type>class Operator_ &amp;</type>
      <name>operator*=</name>
      <anchorfile>classmolpro_1_1Operator__.html</anchorfile>
      <anchor>ab93c4112118146afd29556550d07467f</anchor>
      <arglist>(value_type other)</arglist>
    </member>
    <member kind="function">
      <type>scalar_type</type>
      <name>operator&amp;</name>
      <anchorfile>classmolpro_1_1Operator__.html</anchorfile>
      <anchor>a87ab2b8812f1233c41f57fcd5ffc4265</anchor>
      <arglist>(const class Operator_ &amp;other) const</arglist>
    </member>
    <member kind="function">
      <type>const class Operator_</type>
      <name>operator+</name>
      <anchorfile>classmolpro_1_1Operator__.html</anchorfile>
      <anchor>ad9bf663a64c1a07579f743d1a6cf7e30</anchor>
      <arglist>(const class Operator_ &amp;other)</arglist>
    </member>
    <member kind="function">
      <type>const class Operator_</type>
      <name>operator-</name>
      <anchorfile>classmolpro_1_1Operator__.html</anchorfile>
      <anchor>a4b02834725b1fcd3bcafc08bea5e2024</anchor>
      <arglist>(const class Operator_ &amp;other)</arglist>
    </member>
    <member kind="function">
      <type>const class Operator_</type>
      <name>operator*</name>
      <anchorfile>classmolpro_1_1Operator__.html</anchorfile>
      <anchor>a749b8fa3f30d5e9b1e53844e63ef026c</anchor>
      <arglist>(value_type other)</arglist>
    </member>
    <member kind="function">
      <type>bool</type>
      <name>compatible</name>
      <anchorfile>classmolpro_1_1Operator__.html</anchorfile>
      <anchor>a6bfacd8c7fe9568a705a3cc80b157e3c</anchor>
      <arglist>(const class Operator_ &amp;other) const</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>checkCompatible</name>
      <anchorfile>classmolpro_1_1Operator__.html</anchorfile>
      <anchor>a20000a4a42912922560beade06407dc5</anchor>
      <arglist>(const class Operator_ &amp;other) const</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>mulliken_from_dirac</name>
      <anchorfile>classmolpro_1_1Operator__.html</anchorfile>
      <anchor>a9227a41e2d01d3e9c2322878ed2431e0</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>SMat</type>
      <name>metric</name>
      <anchorfile>classmolpro_1_1Operator__.html</anchorfile>
      <anchor>ab701242e04c76327c6d0a88aaf4b3859</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>ensure_dirac</name>
      <anchorfile>classmolpro_1_1Operator__.html</anchorfile>
      <anchor>a04873a23f31ee4da6e98e632f538b0b8</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>set_dirty</name>
      <anchorfile>classmolpro_1_1Operator__.html</anchorfile>
      <anchor>a2c884131888790d27bcf65f6001afda5</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function" static="yes">
      <type>static class Operator_</type>
      <name>construct</name>
      <anchorfile>classmolpro_1_1Operator__.html</anchorfile>
      <anchor>a420f17fcb448c0596d357cb6b5e850bb</anchor>
      <arglist>(const char *dump)</arglist>
    </member>
    <member kind="function" static="yes">
      <type>static class Operator_</type>
      <name>construct</name>
      <anchorfile>classmolpro_1_1Operator__.html</anchorfile>
      <anchor>aab5169519cb3db69c09654308fcf2c60</anchor>
      <arglist>(class molpro::bytestream &amp;bs)</arglist>
    </member>
    <member kind="variable">
      <type>const int</type>
      <name>m_rank</name>
      <anchorfile>classmolpro_1_1Operator__.html</anchorfile>
      <anchor>ad2b850d157e7af62771a089e415d20a6</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>const bool</type>
      <name>m_uhf</name>
      <anchorfile>classmolpro_1_1Operator__.html</anchorfile>
      <anchor>addb215888a5251d81aba6db8f9926b3f</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>const std::vector&lt; int &gt;</type>
      <name>m_hermiticity</name>
      <anchorfile>classmolpro_1_1Operator__.html</anchorfile>
      <anchor>a56ee0078a62b241588913b717ca60178</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>const std::vector&lt; int &gt;</type>
      <name>m_exchange</name>
      <anchorfile>classmolpro_1_1Operator__.html</anchorfile>
      <anchor>ab1be924f24f25900aad356f0309d9f1a</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>const unsigned int</type>
      <name>m_symmetry</name>
      <anchorfile>classmolpro_1_1Operator__.html</anchorfile>
      <anchor>ab79af3384f9ddd70a9f08f82267b6f65</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>std::string</type>
      <name>m_description</name>
      <anchorfile>classmolpro_1_1Operator__.html</anchorfile>
      <anchor>a0ce4e4cf159d614704523aecf94e70d4</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>value_type</type>
      <name>m_O0</name>
      <anchorfile>classmolpro_1_1Operator__.html</anchorfile>
      <anchor>a16bf7f125cb7fbf5e26d5102d3311483</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>const bool</type>
      <name>m_covariant</name>
      <anchorfile>classmolpro_1_1Operator__.html</anchorfile>
      <anchor>a3463c856ca134df3e1237fe28d129446</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>const bool</type>
      <name>m_diagonal</name>
      <anchorfile>classmolpro_1_1Operator__.html</anchorfile>
      <anchor>a27ae8bd941dc27e01dc7942ee1944610</anchor>
      <arglist></arglist>
    </member>
    <member kind="function" protection="protected">
      <type>size_t</type>
      <name>offset</name>
      <anchorfile>classmolpro_1_1Operator__.html</anchorfile>
      <anchor>a99dbdfd1d3efd5931d7135bbdca43531</anchor>
      <arglist>(int isym, int jsym, int ksym, int lsym, int i, int j, int k, int l, bool mulliken=true, bool spinUp1=true, bool spinUp2=true)</arglist>
    </member>
    <member kind="variable" protection="protected">
      <type>std::shared_ptr&lt; SMat &gt;</type>
      <name>m_O1a</name>
      <anchorfile>classmolpro_1_1Operator__.html</anchorfile>
      <anchor>a468d6e8eb978198531c2c90776f9ebaa</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" protection="protected">
      <type>std::shared_ptr&lt; SMat &gt;</type>
      <name>m_O1b</name>
      <anchorfile>classmolpro_1_1Operator__.html</anchorfile>
      <anchor>aa19f592a7a1eb89168d50f8e92b85160</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" protection="protected">
      <type>std::shared_ptr&lt; SMatMat &gt;</type>
      <name>m_O2aa_mulliken</name>
      <anchorfile>classmolpro_1_1Operator__.html</anchorfile>
      <anchor>ada91d58116a902824c0db68affb93c53</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" protection="protected">
      <type>std::shared_ptr&lt; SMatMat &gt;</type>
      <name>m_O2ab_mulliken</name>
      <anchorfile>classmolpro_1_1Operator__.html</anchorfile>
      <anchor>ac507cb97c4b761359154c2cafc71038f</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" protection="protected">
      <type>std::shared_ptr&lt; SMatMat &gt;</type>
      <name>m_O2ba_mulliken</name>
      <anchorfile>classmolpro_1_1Operator__.html</anchorfile>
      <anchor>ab273295fddb11078d804f227af7a512d</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" protection="protected">
      <type>std::shared_ptr&lt; SMatMat &gt;</type>
      <name>m_O2bb_mulliken</name>
      <anchorfile>classmolpro_1_1Operator__.html</anchorfile>
      <anchor>a036e2e9bc406cf44c59af8a6580898b7</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" protection="protected">
      <type>std::shared_ptr&lt; SMatMat &gt;</type>
      <name>m_O2aa_dirac</name>
      <anchorfile>classmolpro_1_1Operator__.html</anchorfile>
      <anchor>a4a1560a5764ad1454f9557ff369372b5</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" protection="protected">
      <type>std::shared_ptr&lt; SMatMat &gt;</type>
      <name>m_O2ab_dirac</name>
      <anchorfile>classmolpro_1_1Operator__.html</anchorfile>
      <anchor>aac42e52c476f29ff1179fd9be789111f</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" protection="protected">
      <type>std::shared_ptr&lt; SMatMat &gt;</type>
      <name>m_O2ba_dirac</name>
      <anchorfile>classmolpro_1_1Operator__.html</anchorfile>
      <anchor>abfedd4ed0bb060f4f6ae467efb928dac</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" protection="protected">
      <type>std::shared_ptr&lt; SMatMat &gt;</type>
      <name>m_O2bb_dirac</name>
      <anchorfile>classmolpro_1_1Operator__.html</anchorfile>
      <anchor>aa1233fe514f2df7e486ff86afc8ac0a7</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" protection="protected">
      <type>bool</type>
      <name>m_dirac_out_of_date</name>
      <anchorfile>classmolpro_1_1Operator__.html</anchorfile>
      <anchor>aaccc9d30faf9c4983019259137448f42</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>Operator_&lt; double &gt;</name>
    <filename>classmolpro_1_1Operator__.html</filename>
    <member kind="typedef">
      <type>typename molpro::SMat_&lt; double &gt;</type>
      <name>SMat</name>
      <anchorfile>classmolpro_1_1Operator__.html</anchorfile>
      <anchor>ae1ef34578d969007b734457c6bc1d2f9</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>typename molpro::SMatMat_&lt; SMat_&lt; double &gt; &gt;</type>
      <name>SMatMat</name>
      <anchorfile>classmolpro_1_1Operator__.html</anchorfile>
      <anchor>a37715a8f038a9b1b30c7313162b0b13b</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>double</type>
      <name>value_type</name>
      <anchorfile>classmolpro_1_1Operator__.html</anchorfile>
      <anchor>afab25fe0985b9fa0d805ed025f8675a1</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>typename SMat::scalar_type</type>
      <name>scalar_type</name>
      <anchorfile>classmolpro_1_1Operator__.html</anchorfile>
      <anchor>a9b4d3db6de1dab48cb24df9e103d721f</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>typename SMat::M</type>
      <name>M</name>
      <anchorfile>classmolpro_1_1Operator__.html</anchorfile>
      <anchor>a241cf0330d2821aa482e9e444c77e869</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>typename SMat::Mconst</type>
      <name>Mconst</name>
      <anchorfile>classmolpro_1_1Operator__.html</anchorfile>
      <anchor>a74261107fa015ddb34132335d86d0af4</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>typename SMat::V</type>
      <name>V</name>
      <anchorfile>classmolpro_1_1Operator__.html</anchorfile>
      <anchor>ab00213c3de4be018d16422be4e3615ba</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>Operator_</name>
      <anchorfile>classmolpro_1_1Operator__.html</anchorfile>
      <anchor>ad7405980136ba27e76d96d4ef9046a88</anchor>
      <arglist>(std::array&lt; dims_t, 2 &gt; dimensions, int rank=2, bool uhf=false, std::vector&lt; int &gt; hermiticity={1, 1}, std::vector&lt; int &gt; exchange={-1, -1}, unsigned int symmetry=0, bool covariant=true, bool diagonal=false, std::string description=&quot;&quot;)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>Operator_</name>
      <anchorfile>classmolpro_1_1Operator__.html</anchorfile>
      <anchor>a0bd136b96a55fa0944b0e0ba5943f5be</anchor>
      <arglist>(dims_t dimensions, int rank=2, bool uhf=false, std::vector&lt; int &gt; hermiticity={1, 1}, std::vector&lt; int &gt; exchange={-1, -1}, unsigned int symmetry=0, bool covariant=true, bool diagonal=false, std::string description=&quot;&quot;)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>Operator_</name>
      <anchorfile>classmolpro_1_1Operator__.html</anchorfile>
      <anchor>adf0acdfeffdfd837a0b421b6d7924f5c</anchor>
      <arglist>(dim_t dimension, int rank=2, bool uhf=false, unsigned int symmetry=0, bool covariant=true, bool diagonal=false, std::string description=&quot;&quot;)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>Operator_</name>
      <anchorfile>classmolpro_1_1Operator__.html</anchorfile>
      <anchor>a7f77ca6066c3a89cde14ea50d4a2c424</anchor>
      <arglist>(const Operator_&lt; double &gt; &amp;source)</arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual</type>
      <name>~Operator_</name>
      <anchorfile>classmolpro_1_1Operator__.html</anchorfile>
      <anchor>a01c7e471da062f7ad08aa4c8e90e7288</anchor>
      <arglist>()=default</arglist>
    </member>
    <member kind="function">
      <type>Operator_&lt; double &gt; &amp;</type>
      <name>operator=</name>
      <anchorfile>classmolpro_1_1Operator__.html</anchorfile>
      <anchor>ab9db718a668d87b5a3383f0399e2989b</anchor>
      <arglist>(const Operator_&lt; double &gt; &amp;source)</arglist>
    </member>
    <member kind="function">
      <type>class Operator_</type>
      <name>slice</name>
      <anchorfile>classmolpro_1_1Operator__.html</anchorfile>
      <anchor>a006ae4dc28e42f8f120647c6f97ce4c1</anchor>
      <arglist>(std::array&lt; dims_t, 2 &gt; dimensions, std::array&lt; dims_t, 2 &gt; offset={}, std::string description=&quot;&quot;) const</arglist>
    </member>
    <member kind="function">
      <type>class Operator_</type>
      <name>slice</name>
      <anchorfile>classmolpro_1_1Operator__.html</anchorfile>
      <anchor>a765537c08e97be8a994fb8382a61f604</anchor>
      <arglist>(dims_t dimensions, dims_t offset={{0, 0, 0, 0, 0, 0, 0, 0}, {0, 0, 0, 0, 0, 0, 0, 0}, {0, 0, 0, 0, 0, 0, 0, 0}, {0, 0, 0, 0, 0, 0, 0, 0}}, std::string description=&quot;&quot;) const</arglist>
    </member>
    <member kind="function">
      <type>const SMat &amp;</type>
      <name>O1</name>
      <anchorfile>classmolpro_1_1Operator__.html</anchorfile>
      <anchor>aec38276794abf3d4582e8865ee7e49aa</anchor>
      <arglist>(bool spinUp=true) const</arglist>
    </member>
    <member kind="function">
      <type>SMat &amp;</type>
      <name>O1</name>
      <anchorfile>classmolpro_1_1Operator__.html</anchorfile>
      <anchor>aa4551acbf71b32165d1eddf6bcdcee69</anchor>
      <arglist>(bool spinUp=true)</arglist>
    </member>
    <member kind="function">
      <type>const SMatMat &amp;</type>
      <name>O2</name>
      <anchorfile>classmolpro_1_1Operator__.html</anchorfile>
      <anchor>a6dca1a22715063777629a87ded042396</anchor>
      <arglist>(bool spinUp1=true, bool spinUp2=true, bool mulliken=true, bool ensure=true) const</arglist>
    </member>
    <member kind="function">
      <type>SMatMat &amp;</type>
      <name>O2</name>
      <anchorfile>classmolpro_1_1Operator__.html</anchorfile>
      <anchor>a0cfc712beccff1681e55161dda503746</anchor>
      <arglist>(bool spinUp1=true, bool spinUp2=true)</arglist>
    </member>
    <member kind="function">
      <type>const value_type &amp;</type>
      <name>element</name>
      <anchorfile>classmolpro_1_1Operator__.html</anchorfile>
      <anchor>a70901845f6938d7330cba6ddf2263a44</anchor>
      <arglist>(int i, int isym, int j, int jsym, int k, int ksym, int l, int lsym, bool spinUp1=true, bool spinUp2=true, bool mulliken=true) const</arglist>
    </member>
    <member kind="function">
      <type>value_type &amp;</type>
      <name>element</name>
      <anchorfile>classmolpro_1_1Operator__.html</anchorfile>
      <anchor>a5f79ce00954d821a90f47653c876199e</anchor>
      <arglist>(int i, int isym, int j, int jsym, int k, int ksym, int l, int lsym, bool spinUp1=true, bool spinUp2=true)</arglist>
    </member>
    <member kind="function">
      <type>const value_type &amp;</type>
      <name>element</name>
      <anchorfile>classmolpro_1_1Operator__.html</anchorfile>
      <anchor>abe5cbe7c2113d4073d1dd944d5205b02</anchor>
      <arglist>(int i, int isym, int j, int jsym, bool spinUp1=true) const</arglist>
    </member>
    <member kind="function">
      <type>value_type &amp;</type>
      <name>element</name>
      <anchorfile>classmolpro_1_1Operator__.html</anchorfile>
      <anchor>ae2edad167011e906cb8b510bee0525e7</anchor>
      <arglist>(int i, int isym, int j, int jsym, bool spinUp1=true)</arglist>
    </member>
    <member kind="function">
      <type>std::string</type>
      <name>str</name>
      <anchorfile>classmolpro_1_1Operator__.html</anchorfile>
      <anchor>ad34403a5cf7a4cd77944d1f5e54bda13</anchor>
      <arglist>(std::string title=&quot;&quot;, int level=1) const</arglist>
    </member>
    <member kind="function">
      <type>size_t</type>
      <name>dimension</name>
      <anchorfile>classmolpro_1_1Operator__.html</anchorfile>
      <anchor>a15c240d847db968d49232583f481fc5c</anchor>
      <arglist>(unsigned int symmetry=0, unsigned int axis=0, bool spinUp=true) const</arglist>
    </member>
    <member kind="function">
      <type>class molpro::bytestream</type>
      <name>bytestream</name>
      <anchorfile>classmolpro_1_1Operator__.html</anchorfile>
      <anchor>a1d2d5660ff702b36c528629ab5aaee76</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>class Operator_</type>
      <name>fock</name>
      <anchorfile>classmolpro_1_1Operator__.html</anchorfile>
      <anchor>a669299f878e03d1e06e65ddf09e3d3d9</anchor>
      <arglist>(const class Operator_ &amp;density, bool oneElectron=true, std::string description=&quot;&quot;) const</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>zero</name>
      <anchorfile>classmolpro_1_1Operator__.html</anchorfile>
      <anchor>a1b8666aedb49899b0176cef3fe5d94ec</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>class Operator_ &amp;</type>
      <name>operator+=</name>
      <anchorfile>classmolpro_1_1Operator__.html</anchorfile>
      <anchor>a6179fc8618d97b316f340239f8cee816</anchor>
      <arglist>(const class Operator_ &amp;other)</arglist>
    </member>
    <member kind="function">
      <type>class Operator_ &amp;</type>
      <name>operator-=</name>
      <anchorfile>classmolpro_1_1Operator__.html</anchorfile>
      <anchor>a92a18303329a4a9a8f1aedc1c20435dc</anchor>
      <arglist>(const class Operator_ &amp;other)</arglist>
    </member>
    <member kind="function">
      <type>class Operator_ &amp;</type>
      <name>operator*=</name>
      <anchorfile>classmolpro_1_1Operator__.html</anchorfile>
      <anchor>ab93c4112118146afd29556550d07467f</anchor>
      <arglist>(value_type other)</arglist>
    </member>
    <member kind="function">
      <type>scalar_type</type>
      <name>operator&amp;</name>
      <anchorfile>classmolpro_1_1Operator__.html</anchorfile>
      <anchor>a87ab2b8812f1233c41f57fcd5ffc4265</anchor>
      <arglist>(const class Operator_ &amp;other) const</arglist>
    </member>
    <member kind="function">
      <type>const class Operator_</type>
      <name>operator+</name>
      <anchorfile>classmolpro_1_1Operator__.html</anchorfile>
      <anchor>ad9bf663a64c1a07579f743d1a6cf7e30</anchor>
      <arglist>(const class Operator_ &amp;other)</arglist>
    </member>
    <member kind="function">
      <type>const class Operator_</type>
      <name>operator-</name>
      <anchorfile>classmolpro_1_1Operator__.html</anchorfile>
      <anchor>a4b02834725b1fcd3bcafc08bea5e2024</anchor>
      <arglist>(const class Operator_ &amp;other)</arglist>
    </member>
    <member kind="function">
      <type>const class Operator_</type>
      <name>operator*</name>
      <anchorfile>classmolpro_1_1Operator__.html</anchorfile>
      <anchor>a749b8fa3f30d5e9b1e53844e63ef026c</anchor>
      <arglist>(value_type other)</arglist>
    </member>
    <member kind="function">
      <type>bool</type>
      <name>compatible</name>
      <anchorfile>classmolpro_1_1Operator__.html</anchorfile>
      <anchor>a6bfacd8c7fe9568a705a3cc80b157e3c</anchor>
      <arglist>(const class Operator_ &amp;other) const</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>checkCompatible</name>
      <anchorfile>classmolpro_1_1Operator__.html</anchorfile>
      <anchor>a20000a4a42912922560beade06407dc5</anchor>
      <arglist>(const class Operator_ &amp;other) const</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>mulliken_from_dirac</name>
      <anchorfile>classmolpro_1_1Operator__.html</anchorfile>
      <anchor>a9227a41e2d01d3e9c2322878ed2431e0</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>SMat</type>
      <name>metric</name>
      <anchorfile>classmolpro_1_1Operator__.html</anchorfile>
      <anchor>ab701242e04c76327c6d0a88aaf4b3859</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>ensure_dirac</name>
      <anchorfile>classmolpro_1_1Operator__.html</anchorfile>
      <anchor>a04873a23f31ee4da6e98e632f538b0b8</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>set_dirty</name>
      <anchorfile>classmolpro_1_1Operator__.html</anchorfile>
      <anchor>a2c884131888790d27bcf65f6001afda5</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function" static="yes">
      <type>static class Operator_</type>
      <name>construct</name>
      <anchorfile>classmolpro_1_1Operator__.html</anchorfile>
      <anchor>a420f17fcb448c0596d357cb6b5e850bb</anchor>
      <arglist>(const char *dump)</arglist>
    </member>
    <member kind="function" static="yes">
      <type>static class Operator_</type>
      <name>construct</name>
      <anchorfile>classmolpro_1_1Operator__.html</anchorfile>
      <anchor>aab5169519cb3db69c09654308fcf2c60</anchor>
      <arglist>(class molpro::bytestream &amp;bs)</arglist>
    </member>
    <member kind="variable">
      <type>const int</type>
      <name>m_rank</name>
      <anchorfile>classmolpro_1_1Operator__.html</anchorfile>
      <anchor>ad2b850d157e7af62771a089e415d20a6</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>const bool</type>
      <name>m_uhf</name>
      <anchorfile>classmolpro_1_1Operator__.html</anchorfile>
      <anchor>addb215888a5251d81aba6db8f9926b3f</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>const std::vector&lt; int &gt;</type>
      <name>m_hermiticity</name>
      <anchorfile>classmolpro_1_1Operator__.html</anchorfile>
      <anchor>a56ee0078a62b241588913b717ca60178</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>const std::vector&lt; int &gt;</type>
      <name>m_exchange</name>
      <anchorfile>classmolpro_1_1Operator__.html</anchorfile>
      <anchor>ab1be924f24f25900aad356f0309d9f1a</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>const unsigned int</type>
      <name>m_symmetry</name>
      <anchorfile>classmolpro_1_1Operator__.html</anchorfile>
      <anchor>ab79af3384f9ddd70a9f08f82267b6f65</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>std::string</type>
      <name>m_description</name>
      <anchorfile>classmolpro_1_1Operator__.html</anchorfile>
      <anchor>a0ce4e4cf159d614704523aecf94e70d4</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>value_type</type>
      <name>m_O0</name>
      <anchorfile>classmolpro_1_1Operator__.html</anchorfile>
      <anchor>a16bf7f125cb7fbf5e26d5102d3311483</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>const bool</type>
      <name>m_covariant</name>
      <anchorfile>classmolpro_1_1Operator__.html</anchorfile>
      <anchor>a3463c856ca134df3e1237fe28d129446</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>const bool</type>
      <name>m_diagonal</name>
      <anchorfile>classmolpro_1_1Operator__.html</anchorfile>
      <anchor>a27ae8bd941dc27e01dc7942ee1944610</anchor>
      <arglist></arglist>
    </member>
    <member kind="function" protection="protected">
      <type>size_t</type>
      <name>offset</name>
      <anchorfile>classmolpro_1_1Operator__.html</anchorfile>
      <anchor>a99dbdfd1d3efd5931d7135bbdca43531</anchor>
      <arglist>(int isym, int jsym, int ksym, int lsym, int i, int j, int k, int l, bool mulliken=true, bool spinUp1=true, bool spinUp2=true)</arglist>
    </member>
    <member kind="variable" protection="protected">
      <type>std::shared_ptr&lt; SMat &gt;</type>
      <name>m_O1a</name>
      <anchorfile>classmolpro_1_1Operator__.html</anchorfile>
      <anchor>a468d6e8eb978198531c2c90776f9ebaa</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" protection="protected">
      <type>std::shared_ptr&lt; SMat &gt;</type>
      <name>m_O1b</name>
      <anchorfile>classmolpro_1_1Operator__.html</anchorfile>
      <anchor>aa19f592a7a1eb89168d50f8e92b85160</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" protection="protected">
      <type>std::shared_ptr&lt; SMatMat &gt;</type>
      <name>m_O2aa_mulliken</name>
      <anchorfile>classmolpro_1_1Operator__.html</anchorfile>
      <anchor>ada91d58116a902824c0db68affb93c53</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" protection="protected">
      <type>std::shared_ptr&lt; SMatMat &gt;</type>
      <name>m_O2ab_mulliken</name>
      <anchorfile>classmolpro_1_1Operator__.html</anchorfile>
      <anchor>ac507cb97c4b761359154c2cafc71038f</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" protection="protected">
      <type>std::shared_ptr&lt; SMatMat &gt;</type>
      <name>m_O2ba_mulliken</name>
      <anchorfile>classmolpro_1_1Operator__.html</anchorfile>
      <anchor>ab273295fddb11078d804f227af7a512d</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" protection="protected">
      <type>std::shared_ptr&lt; SMatMat &gt;</type>
      <name>m_O2bb_mulliken</name>
      <anchorfile>classmolpro_1_1Operator__.html</anchorfile>
      <anchor>a036e2e9bc406cf44c59af8a6580898b7</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" protection="protected">
      <type>std::shared_ptr&lt; SMatMat &gt;</type>
      <name>m_O2aa_dirac</name>
      <anchorfile>classmolpro_1_1Operator__.html</anchorfile>
      <anchor>a4a1560a5764ad1454f9557ff369372b5</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" protection="protected">
      <type>std::shared_ptr&lt; SMatMat &gt;</type>
      <name>m_O2ab_dirac</name>
      <anchorfile>classmolpro_1_1Operator__.html</anchorfile>
      <anchor>aac42e52c476f29ff1179fd9be789111f</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" protection="protected">
      <type>std::shared_ptr&lt; SMatMat &gt;</type>
      <name>m_O2ba_dirac</name>
      <anchorfile>classmolpro_1_1Operator__.html</anchorfile>
      <anchor>abfedd4ed0bb060f4f6ae467efb928dac</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" protection="protected">
      <type>std::shared_ptr&lt; SMatMat &gt;</type>
      <name>m_O2bb_dirac</name>
      <anchorfile>classmolpro_1_1Operator__.html</anchorfile>
      <anchor>aa1233fe514f2df7e486ff86afc8ac0a7</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" protection="protected">
      <type>bool</type>
      <name>m_dirac_out_of_date</name>
      <anchorfile>classmolpro_1_1Operator__.html</anchorfile>
      <anchor>aaccc9d30faf9c4983019259137448f42</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>molpro::gci::Options</name>
    <filename>classmolpro_1_1gci_1_1Options.html</filename>
    <member kind="function">
      <type></type>
      <name>Options</name>
      <anchorfile>classmolpro_1_1gci_1_1Options.html</anchorfile>
      <anchor>ad0f23d723d019f769e422ae21e5d8e66</anchor>
      <arglist>(std::string input=&quot;&quot;)</arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>molpro::gci::Orbitals</name>
    <filename>classmolpro_1_1gci_1_1Orbitals.html</filename>
    <base>molpro::gci::Printable</base>
    <member kind="function">
      <type></type>
      <name>Orbitals</name>
      <anchorfile>classmolpro_1_1gci_1_1Orbitals.html</anchorfile>
      <anchor>af37327450331577b9528af2fabeae5ed</anchor>
      <arglist>(const OrbitalSpace &amp;orbitalSpace)</arglist>
    </member>
    <member kind="function">
      <type>std::string</type>
      <name>str</name>
      <anchorfile>classmolpro_1_1gci_1_1Orbitals.html</anchorfile>
      <anchor>a9718448120c422f280360aacec7d9447</anchor>
      <arglist>(int verbosity=0, unsigned int columns=UINT_MAX) const</arglist>
    </member>
    <member kind="variable">
      <type>molpro::SMat</type>
      <name>m_orbitals</name>
      <anchorfile>classmolpro_1_1gci_1_1Orbitals.html</anchorfile>
      <anchor>aa7e0dc41dd460c419c6c24840b0a781b</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>molpro::SMat</type>
      <name>m_energies</name>
      <anchorfile>classmolpro_1_1gci_1_1Orbitals.html</anchorfile>
      <anchor>ae101a7b56b7fdb93dd05d9aedf29ad76</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>molpro::SMat</type>
      <name>m_occupations</name>
      <anchorfile>classmolpro_1_1gci_1_1Orbitals.html</anchorfile>
      <anchor>a3c3f9b74a742e87bd0713befbfb83816</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>molpro::gci::OrbitalSpace</name>
    <filename>classmolpro_1_1gci_1_1OrbitalSpace.html</filename>
    <base>molpro::gci::SymmetrySpace</base>
    <member kind="function">
      <type></type>
      <name>OrbitalSpace</name>
      <anchorfile>classmolpro_1_1gci_1_1OrbitalSpace.html</anchorfile>
      <anchor>aae1fe6b2b88edf218929767b54b54417</anchor>
      <arglist>(const Options &amp;dump, int verbosity=0)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>OrbitalSpace</name>
      <anchorfile>classmolpro_1_1gci_1_1OrbitalSpace.html</anchorfile>
      <anchor>aeb85f9bb7c1796e41369c3ad58bb1a1e</anchor>
      <arglist>(const std::vector&lt; int &gt; syms, bool uhf=false, int verbosity=0)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>OrbitalSpace</name>
      <anchorfile>classmolpro_1_1gci_1_1OrbitalSpace.html</anchorfile>
      <anchor>a726b1428b385bb8caf8c018395a9b5d5</anchor>
      <arglist>(const molpro::Operator &amp;o, int verbosity=0)</arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual</type>
      <name>~OrbitalSpace</name>
      <anchorfile>classmolpro_1_1gci_1_1OrbitalSpace.html</anchorfile>
      <anchor>a4e57d9e10a49791dbe2f9d2a600ab062</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>load</name>
      <anchorfile>classmolpro_1_1gci_1_1OrbitalSpace.html</anchorfile>
      <anchor>a2e9d029cb0b1986ca9d4aac1d50a5ce1</anchor>
      <arglist>(const Options &amp;options, int verbosity=0)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>load</name>
      <anchorfile>classmolpro_1_1gci_1_1OrbitalSpace.html</anchorfile>
      <anchor>ae010335d8e0bb05d015c6890c6f1192e</anchor>
      <arglist>(const std::vector&lt; int &gt; syms, bool uhf=false, int verbosity=0)</arglist>
    </member>
    <member kind="function">
      <type>std::string</type>
      <name>str</name>
      <anchorfile>classmolpro_1_1gci_1_1OrbitalSpace.html</anchorfile>
      <anchor>a0fffcf6e5bc5ccd42208c787fc70419d</anchor>
      <arglist>(int verbosity=0, unsigned int columns=UINT_MAX) const</arglist>
    </member>
    <member kind="function">
      <type>unsigned int</type>
      <name>orbitalIndex</name>
      <anchorfile>classmolpro_1_1gci_1_1OrbitalSpace.html</anchorfile>
      <anchor>a1bc065f0d452532cdcf26a9937ffe19e</anchor>
      <arglist>(unsigned int i) const</arglist>
    </member>
    <member kind="function">
      <type>size_t</type>
      <name>pairIndex</name>
      <anchorfile>classmolpro_1_1gci_1_1OrbitalSpace.html</anchorfile>
      <anchor>a235aa2bb39fb194ff0127e9939c22799</anchor>
      <arglist>(unsigned int i, unsigned int j, int parity=0) const</arglist>
    </member>
    <member kind="function">
      <type>size_t</type>
      <name>quadIndex</name>
      <anchorfile>classmolpro_1_1gci_1_1OrbitalSpace.html</anchorfile>
      <anchor>a8086b07f7e77893c952bd0c09c32993e</anchor>
      <arglist>(unsigned int i, unsigned int j, unsigned int k, unsigned int l, int parity=0, int parity2=0) const</arglist>
    </member>
    <member kind="variable">
      <type>bool</type>
      <name>spinUnrestricted</name>
      <anchorfile>classmolpro_1_1gci_1_1OrbitalSpace.html</anchorfile>
      <anchor>ad9ac04765b32dfebdf2bc5be790e5d1c</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>std::vector&lt; unsigned int &gt;</type>
      <name>orbital_symmetries</name>
      <anchorfile>classmolpro_1_1gci_1_1OrbitalSpace.html</anchorfile>
      <anchor>ae922fb307b7d88dda78bee04e00dc55b</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>std::map&lt; int, SymmetrySpace &gt;</type>
      <name>pairSpace</name>
      <anchorfile>classmolpro_1_1gci_1_1OrbitalSpace.html</anchorfile>
      <anchor>ada0ec75b525bddad375d268474e9d3af</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>molpro::gci::PersistentOperator</name>
    <filename>classmolpro_1_1gci_1_1PersistentOperator.html</filename>
    <member kind="function">
      <type></type>
      <name>PersistentOperator</name>
      <anchorfile>classmolpro_1_1gci_1_1PersistentOperator.html</anchorfile>
      <anchor>a1b68c197dbc7c7ba039b7d543f60aca0</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>PersistentOperator</name>
      <anchorfile>classmolpro_1_1gci_1_1PersistentOperator.html</anchorfile>
      <anchor>a3edb4339ccee27a58c51cb0c04ed4106</anchor>
      <arglist>(const std::shared_ptr&lt; molpro::Operator &gt; &amp;op, std::string _description, int root, int id, bool in_memory=false)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>PersistentOperator</name>
      <anchorfile>classmolpro_1_1gci_1_1PersistentOperator.html</anchorfile>
      <anchor>a844a7e1f7a3c9d89a5a6870f099bf131</anchor>
      <arglist>(int id, std::string _description)</arglist>
    </member>
    <member kind="function">
      <type>std::shared_ptr&lt; molpro::Operator &gt;</type>
      <name>get</name>
      <anchorfile>classmolpro_1_1gci_1_1PersistentOperator.html</anchorfile>
      <anchor>a7a46de8a1a43b58748cf1900fab4fd69</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>std::string</type>
      <name>description</name>
      <anchorfile>classmolpro_1_1gci_1_1PersistentOperator.html</anchorfile>
      <anchor>ae5173eb89d88bee55272d75415f0e6d7</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function" protection="protected">
      <type>void</type>
      <name>store_bytestream</name>
      <anchorfile>classmolpro_1_1gci_1_1PersistentOperator.html</anchorfile>
      <anchor>ae78539091b49486e7d6ecb9092bacaf9</anchor>
      <arglist>(const std::shared_ptr&lt; molpro::Operator &gt; &amp;op, int root)</arglist>
    </member>
    <member kind="variable" protection="protected">
      <type>std::shared_ptr&lt; molpro::Operator &gt;</type>
      <name>m_op</name>
      <anchorfile>classmolpro_1_1gci_1_1PersistentOperator.html</anchorfile>
      <anchor>a3d2bc6747ecaa154bc8caf3b067343ef</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" protection="protected">
      <type>int</type>
      <name>m_file_id</name>
      <anchorfile>classmolpro_1_1gci_1_1PersistentOperator.html</anchorfile>
      <anchor>af077f8f8e896c84b6cd123d4c3783e57</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" protection="protected">
      <type>std::string</type>
      <name>m_description</name>
      <anchorfile>classmolpro_1_1gci_1_1PersistentOperator.html</anchorfile>
      <anchor>a8df530ee34af9c21e0d3067ab8b2ffa6</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" protection="protected">
      <type>bool</type>
      <name>m_on_disk</name>
      <anchorfile>classmolpro_1_1gci_1_1PersistentOperator.html</anchorfile>
      <anchor>a5c7f0b9144fc3c5c17fcc1a3d6bbf725</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="struct">
    <name>molpro::gci::Presidual</name>
    <filename>structmolpro_1_1gci_1_1Presidual.html</filename>
    <member kind="function">
      <type></type>
      <name>Presidual</name>
      <anchorfile>structmolpro_1_1gci_1_1Presidual.html</anchorfile>
      <anchor>a5dd53db18c7483697a7f4edf8081a8c0</anchor>
      <arglist>(const molpro::Operator &amp;hamiltonian, const std::vector&lt; Pvector &gt; &amp;P)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>operator()</name>
      <anchorfile>structmolpro_1_1gci_1_1Presidual.html</anchorfile>
      <anchor>a4a709f24ae35aa65af8d2f9a0de2a875</anchor>
      <arglist>(const std::vector&lt; std::vector&lt; double &gt;&gt; &amp;Pcoeff, ParameterVectorSet &amp;outputs) const</arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>molpro::gci::Printable</name>
    <filename>classmolpro_1_1gci_1_1Printable.html</filename>
    <member kind="function">
      <type></type>
      <name>Printable</name>
      <anchorfile>classmolpro_1_1gci_1_1Printable.html</anchorfile>
      <anchor>a62439ef0e74a10b88e9806cd2d96a795</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function" virtualness="pure">
      <type>virtual std::string</type>
      <name>str</name>
      <anchorfile>classmolpro_1_1gci_1_1Printable.html</anchorfile>
      <anchor>a9bfc8ebaca0a30ce4993581adbe3dcb8</anchor>
      <arglist>(int verbosity=0, unsigned int columns=UINT_MAX) const =0</arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>molpro::gci::Problem</name>
    <filename>classmolpro_1_1gci_1_1Problem.html</filename>
    <member kind="typedef">
      <type>std::map&lt; size_t, container_t::value_type &gt;</type>
      <name>P</name>
      <anchorfile>classmolpro_1_1gci_1_1Problem.html</anchorfile>
      <anchor>a563074b9d15de6e321a5566bbc6e138e</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>Problem</name>
      <anchorfile>classmolpro_1_1gci_1_1Problem.html</anchorfile>
      <anchor>a2df0862655cbc72c21ffa8e1324a57bd</anchor>
      <arglist>(const Operator &amp;hamiltonian, const State &amp;prototype)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>Problem</name>
      <anchorfile>classmolpro_1_1gci_1_1Problem.html</anchorfile>
      <anchor>aad463f5d8228246a34bdc0d321e38d97</anchor>
      <arglist>()=delete</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>action</name>
      <anchorfile>classmolpro_1_1gci_1_1Problem.html</anchorfile>
      <anchor>aa6e6ca5421bb343576585e34bfb22e71</anchor>
      <arglist>(const CVecRef&lt; container_t &gt; &amp;parameters, const VecRef&lt; container_t &gt; &amp;actions) const override</arglist>
    </member>
    <member kind="function">
      <type>bool</type>
      <name>diagonals</name>
      <anchorfile>classmolpro_1_1gci_1_1Problem.html</anchorfile>
      <anchor>ab0ff938f48f993a08bbec2aefb4bcf1c</anchor>
      <arglist>(container_t &amp;d) const override</arglist>
    </member>
    <member kind="function">
      <type>std::vector&lt; double &gt;</type>
      <name>pp_action_matrix</name>
      <anchorfile>classmolpro_1_1gci_1_1Problem.html</anchorfile>
      <anchor>a0f68c3afa55bb7104c4fb9445bae7d2f</anchor>
      <arglist>(const std::vector&lt; P &gt; &amp;pparams) const override</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>p_action</name>
      <anchorfile>classmolpro_1_1gci_1_1Problem.html</anchorfile>
      <anchor>a38ff5f21b93baffaefd305e52328fc0a</anchor>
      <arglist>(const std::vector&lt; std::vector&lt; value_t &gt;&gt; &amp;p_coefficients, const CVecRef&lt; P &gt; &amp;pparams, const VecRef&lt; container_t &gt; &amp;actions) const override</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>precondition</name>
      <anchorfile>classmolpro_1_1gci_1_1Problem.html</anchorfile>
      <anchor>af96b79290dde3a4b13678f893c5b0b02</anchor>
      <arglist>(const VecRef&lt; container_t &gt; &amp;action, const std::vector&lt; double &gt; &amp;shift, const container_t &amp;diagonals) const override</arglist>
    </member>
  </compound>
  <compound kind="struct">
    <name>molpro::gci::ctor_allocator::rebind</name>
    <filename>structmolpro_1_1gci_1_1ctor__allocator_1_1rebind.html</filename>
    <templarg></templarg>
    <member kind="typedef">
      <type>ctor_allocator&lt; U, typename a_t::template rebind_alloc&lt; U &gt; &gt;</type>
      <name>other</name>
      <anchorfile>structmolpro_1_1gci_1_1ctor__allocator_1_1rebind.html</anchorfile>
      <anchor>a472da340eee8dc5ad35f0c78572a03bf</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="struct">
    <name>molpro::gci::residual</name>
    <filename>structmolpro_1_1gci_1_1residual.html</filename>
    <member kind="function">
      <type></type>
      <name>residual</name>
      <anchorfile>structmolpro_1_1gci_1_1residual.html</anchorfile>
      <anchor>a5d855a815ac8c506ae2052243427e10a</anchor>
      <arglist>(const molpro::Operator &amp;hamiltonian, bool subtract_Energy, molpro::Operator *Q=nullptr)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>operator()</name>
      <anchorfile>structmolpro_1_1gci_1_1residual.html</anchorfile>
      <anchor>af7356c4bbb43a0d832f07067681a8012</anchor>
      <arglist>(const ParameterVectorSet &amp;psx, ParameterVectorSet &amp;outputs, size_t nwork, bool append=false) const</arglist>
    </member>
    <member kind="variable" protection="protected">
      <type>const molpro::Operator &amp;</type>
      <name>m_hamiltonian</name>
      <anchorfile>structmolpro_1_1gci_1_1residual.html</anchorfile>
      <anchor>a4b01079d4528ebb5d47c2c77464db3a9</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" protection="protected">
      <type>const bool</type>
      <name>m_subtract_Energy</name>
      <anchorfile>structmolpro_1_1gci_1_1residual.html</anchorfile>
      <anchor>a5897853e68b4c5e1af949c08516e70a9</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" protection="protected">
      <type>const molpro::Operator *</type>
      <name>m_Q</name>
      <anchorfile>structmolpro_1_1gci_1_1residual.html</anchorfile>
      <anchor>ae5686dd98d0b0fec13214f8ba61af773</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>molpro::gci::Run</name>
    <filename>classmolpro_1_1gci_1_1Run.html</filename>
    <member kind="function">
      <type></type>
      <name>Run</name>
      <anchorfile>classmolpro_1_1gci_1_1Run.html</anchorfile>
      <anchor>a12fbf0032d261287c8553498c2456075</anchor>
      <arglist>(std::string fcidump)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>~Run</name>
      <anchorfile>classmolpro_1_1gci_1_1Run.html</anchorfile>
      <anchor>ac33bf8e7020145bb56df800cbce11012</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>std::vector&lt; double &gt;</type>
      <name>run</name>
      <anchorfile>classmolpro_1_1gci_1_1Run.html</anchorfile>
      <anchor>a0b9548d2e294b3392b9e9d64ad880e2c</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="variable">
      <type>std::vector&lt; molpro::Operator &gt;</type>
      <name>m_densityMatrices</name>
      <anchorfile>classmolpro_1_1gci_1_1Run.html</anchorfile>
      <anchor>ac788f908b82c6c4cc80c416cfe95337d</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>std::vector&lt; std::shared_ptr&lt; Wavefunction &gt; &gt;</type>
      <name>m_wavefunctions</name>
      <anchorfile>classmolpro_1_1gci_1_1Run.html</anchorfile>
      <anchor>add32766e7312d6cc7f7184316be95130</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>Options</type>
      <name>options</name>
      <anchorfile>classmolpro_1_1gci_1_1Run.html</anchorfile>
      <anchor>a863b33f89ba6abcafdc1abf908cc4c97</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>molpro::gci::schedule::SharedCounterBase</name>
    <filename>classmolpro_1_1gci_1_1schedule_1_1SharedCounterBase.html</filename>
    <member kind="function">
      <type></type>
      <name>SharedCounterBase</name>
      <anchorfile>classmolpro_1_1gci_1_1schedule_1_1SharedCounterBase.html</anchorfile>
      <anchor>accea48aefa7cb295a96908e2b1df90d4</anchor>
      <arglist>()=default</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SharedCounterBase</name>
      <anchorfile>classmolpro_1_1gci_1_1schedule_1_1SharedCounterBase.html</anchorfile>
      <anchor>a4b0bce7c39bc09478e5b44bfac0bef81</anchor>
      <arglist>(const SharedCounterBase &amp;)=delete</arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual</type>
      <name>~SharedCounterBase</name>
      <anchorfile>classmolpro_1_1gci_1_1schedule_1_1SharedCounterBase.html</anchorfile>
      <anchor>a76ed4e861e78c40f3fced200f417b290</anchor>
      <arglist>()=default</arglist>
    </member>
    <member kind="function" virtualness="pure">
      <type>virtual unsigned long int</type>
      <name>increment</name>
      <anchorfile>classmolpro_1_1gci_1_1schedule_1_1SharedCounterBase.html</anchorfile>
      <anchor>aecb6ca7c29abd9c0e0e2fffef028926c</anchor>
      <arglist>(int amount=1)=0</arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual unsigned long int</type>
      <name>current_value</name>
      <anchorfile>classmolpro_1_1gci_1_1schedule_1_1SharedCounterBase.html</anchorfile>
      <anchor>af80c6755a1b36162687d0b4594f521a1</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function" virtualness="pure">
      <type>virtual void</type>
      <name>reset</name>
      <anchorfile>classmolpro_1_1gci_1_1schedule_1_1SharedCounterBase.html</anchorfile>
      <anchor>ae98ff2f4297d858857a2bf3d9cc56317</anchor>
      <arglist>()=0</arglist>
    </member>
    <member kind="variable" protection="protected">
      <type>unsigned long int</type>
      <name>m_curr_val</name>
      <anchorfile>classmolpro_1_1gci_1_1schedule_1_1SharedCounterBase.html</anchorfile>
      <anchor>a1b5cd84bffbffedb19d17f135e5d7568</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>molpro::gci::schedule::SharedCounterMPI3</name>
    <filename>classmolpro_1_1gci_1_1schedule_1_1SharedCounterMPI3.html</filename>
    <base>molpro::gci::schedule::SharedCounterBase</base>
    <member kind="function">
      <type></type>
      <name>SharedCounterMPI3</name>
      <anchorfile>classmolpro_1_1gci_1_1schedule_1_1SharedCounterMPI3.html</anchorfile>
      <anchor>a3aaf5364f8ad15c0dc3558bbbaf8a68e</anchor>
      <arglist>(const MPI_Comm &amp;communicator, int target_rank=0)</arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual</type>
      <name>~SharedCounterMPI3</name>
      <anchorfile>classmolpro_1_1gci_1_1schedule_1_1SharedCounterMPI3.html</anchorfile>
      <anchor>ab93f452dd9b310249c29f338234382aa</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual unsigned long int</type>
      <name>increment</name>
      <anchorfile>classmolpro_1_1gci_1_1schedule_1_1SharedCounterMPI3.html</anchorfile>
      <anchor>a2b38540790be9085238569d060c10e61</anchor>
      <arglist>(int amount=1)</arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual void</type>
      <name>reset</name>
      <anchorfile>classmolpro_1_1gci_1_1schedule_1_1SharedCounterMPI3.html</anchorfile>
      <anchor>aee0508076518af1add342db457587c4a</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="variable" protection="protected">
      <type>MPI_Comm</type>
      <name>m_communicator</name>
      <anchorfile>classmolpro_1_1gci_1_1schedule_1_1SharedCounterMPI3.html</anchorfile>
      <anchor>a4e077c7707a7d8f900d564a86d815e01</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" protection="protected">
      <type>int</type>
      <name>m_rank</name>
      <anchorfile>classmolpro_1_1gci_1_1schedule_1_1SharedCounterMPI3.html</anchorfile>
      <anchor>a9f4cfa0740b644f8a9819cacf131909e</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" protection="protected">
      <type>int</type>
      <name>m_target_rank</name>
      <anchorfile>classmolpro_1_1gci_1_1schedule_1_1SharedCounterMPI3.html</anchorfile>
      <anchor>a3ff78875cbb2f5da13a14bf2487e8396</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" protection="protected">
      <type>MPI_Win</type>
      <name>m_win</name>
      <anchorfile>classmolpro_1_1gci_1_1schedule_1_1SharedCounterMPI3.html</anchorfile>
      <anchor>aac5a70b231a67d4264d1f19973231898</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" protection="protected">
      <type>size_t *</type>
      <name>m_win_buffer</name>
      <anchorfile>classmolpro_1_1gci_1_1schedule_1_1SharedCounterMPI3.html</anchorfile>
      <anchor>a3d76d2442ff30308105726fa0e869f6e</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>molpro::SMat_</name>
    <filename>classmolpro_1_1SMat__.html</filename>
    <templarg></templarg>
    <class kind="class">molpro::SMat_::SVD</class>
    <member kind="typedef">
      <type>Eigen::Map&lt; Eigen::Matrix&lt; T, Eigen::Dynamic, Eigen::Dynamic &gt;, Eigen::Unaligned, Eigen::Stride&lt; Eigen::Dynamic, Eigen::Dynamic &gt; &gt;</type>
      <name>M</name>
      <anchorfile>classmolpro_1_1SMat__.html</anchorfile>
      <anchor>a0327b4b21be7f823b70447284ececf11</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>Eigen::Map&lt; const Eigen::Matrix&lt; T, Eigen::Dynamic, Eigen::Dynamic &gt;, Eigen::Unaligned, Eigen::Stride&lt; Eigen::Dynamic, Eigen::Dynamic &gt; &gt;</type>
      <name>Mconst</name>
      <anchorfile>classmolpro_1_1SMat__.html</anchorfile>
      <anchor>ace72697d7f93c836aa30a2adcdac5f81</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>Eigen::Map&lt; Eigen::Matrix&lt; T, Eigen::Dynamic, 1 &gt; &gt;</type>
      <name>V</name>
      <anchorfile>classmolpro_1_1SMat__.html</anchorfile>
      <anchor>abbe220caa385afb70fd47bcbe2be0487</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>T</type>
      <name>value_type</name>
      <anchorfile>classmolpro_1_1SMat__.html</anchorfile>
      <anchor>a0b0793833395ba3be28166f1d3921341</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>T</type>
      <name>scalar_type</name>
      <anchorfile>classmolpro_1_1SMat__.html</anchorfile>
      <anchor>a8b8c1114d47d84f7d7ed2924fe11ed23</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SMat_</name>
      <anchorfile>classmolpro_1_1SMat__.html</anchorfile>
      <anchor>af808f2a29da585e8ebc8dae3ca31c3b0</anchor>
      <arglist>(dims_t dimensions, parity_t parity=parityNone, int symmetry=0, bool diagonal=false, std::string description=&quot;&quot;)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SMat_</name>
      <anchorfile>classmolpro_1_1SMat__.html</anchorfile>
      <anchor>a14857bfc39552244d6778a125f5ecdcd</anchor>
      <arglist>(dims_t dimensions, molpro::array&lt; value_type &gt; &amp;buffer, parity_t parity=parityNone, int symmetry=0, bool diagonal=false, std::string description=&quot;&quot;)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SMat_</name>
      <anchorfile>classmolpro_1_1SMat__.html</anchorfile>
      <anchor>adcc071139db4f4cb5d9aff40cc816e4f</anchor>
      <arglist>(dims_t dimensions, value_type *buffer, parity_t parity=parityNone, int symmetry=0, bool diagonal=false, std::string description=&quot;&quot;)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SMat_</name>
      <anchorfile>classmolpro_1_1SMat__.html</anchorfile>
      <anchor>ad75df24c8852f5384bf3e61fcbc0c1f6</anchor>
      <arglist>(std::string space, parity_t parity=parityNone, int symmetry=0, bool diagonal=false, std::string description=&quot;&quot;)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SMat_</name>
      <anchorfile>classmolpro_1_1SMat__.html</anchorfile>
      <anchor>a64bd7f74bbc04f1c3ab4f4f900fe86cd</anchor>
      <arglist>(std::string space, molpro::array&lt; value_type &gt; &amp;buffer, parity_t parity=parityNone, int symmetry=0, bool diagonal=false, std::string description=&quot;&quot;)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SMat_</name>
      <anchorfile>classmolpro_1_1SMat__.html</anchorfile>
      <anchor>a39e4d9da3065b19a3c0d8b9ae98ed3c3</anchor>
      <arglist>(std::string space, value_type *buffer, parity_t parity=parityNone, int symmetry=0, bool diagonal=false, std::string description=&quot;&quot;)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SMat_</name>
      <anchorfile>classmolpro_1_1SMat__.html</anchorfile>
      <anchor>af2cc7af6ba16f310f745724129d5c932</anchor>
      <arglist>(SMat_ const *source, parity_t parity=parityUnspecified, int symmetry=9, unsigned int rank=0, bool diagonal=false, std::string description=&quot;&quot;)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SMat_</name>
      <anchorfile>classmolpro_1_1SMat__.html</anchorfile>
      <anchor>aa1ee4ed1ddc82c615d84b96af006f99c</anchor>
      <arglist>(SMat_ const *source, molpro::array&lt; value_type &gt; &amp;buffer, parity_t parity=parityUnspecified, int symmetry=9, unsigned int rank=0, bool diagonal=false, std::string description=&quot;&quot;)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SMat_</name>
      <anchorfile>classmolpro_1_1SMat__.html</anchorfile>
      <anchor>a82319192daa2d0194d4c8e6f56155632</anchor>
      <arglist>(SMat_ const *source, value_type *buffer, parity_t parity, int symmetry=9, unsigned int rank=0, bool diagonal=false, std::string description=&quot;&quot;)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SMat_</name>
      <anchorfile>classmolpro_1_1SMat__.html</anchorfile>
      <anchor>ab99b3114ed6ddaeea1d471048aaf39ca</anchor>
      <arglist>(SMat_ const &amp;source, int option=0)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SMat_</name>
      <anchorfile>classmolpro_1_1SMat__.html</anchorfile>
      <anchor>a6a4f9846a6de8a97218b002256490d5d</anchor>
      <arglist>(const char *dump, value_type *buffer=nullptr)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SMat_</name>
      <anchorfile>classmolpro_1_1SMat__.html</anchorfile>
      <anchor>a7ca0b0ca854905e53878e6be96c994dc</anchor>
      <arglist>(const molpro::bytestream &amp;bs, value_type *buffer=nullptr)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>~SMat_</name>
      <anchorfile>classmolpro_1_1SMat__.html</anchorfile>
      <anchor>a5df30e81a0c10dd11c3f3c1d525459fa</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>SMat_ &amp;</type>
      <name>operator=</name>
      <anchorfile>classmolpro_1_1SMat__.html</anchorfile>
      <anchor>a101b66c8de2e0ebf4525078e77c02102</anchor>
      <arglist>(SMat_ const &amp;source)</arglist>
    </member>
    <member kind="function">
      <type>SMat_ &amp;</type>
      <name>copy</name>
      <anchorfile>classmolpro_1_1SMat__.html</anchorfile>
      <anchor>a8772e70926c11c6018ea80b84a2ba410</anchor>
      <arglist>(SMat_ const &amp;source, dims_t sourceOffset={{0, 0, 0, 0, 0, 0, 0, 0}, {0, 0, 0, 0, 0, 0, 0, 0}})</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>splice</name>
      <anchorfile>classmolpro_1_1SMat__.html</anchorfile>
      <anchor>a5d0e1b4ebd809e20903c469937e6037a</anchor>
      <arglist>(SMat_ const &amp;source, dims_t sourceOffset={{0, 0, 0, 0, 0, 0, 0, 0}, {0, 0, 0, 0, 0, 0, 0, 0}}, dims_t offset={{0, 0, 0, 0, 0, 0, 0, 0}, {0, 0, 0, 0, 0, 0, 0, 0}})</arglist>
    </member>
    <member kind="function">
      <type>SMat_</type>
      <name>slice</name>
      <anchorfile>classmolpro_1_1SMat__.html</anchorfile>
      <anchor>aa430910cb57918a059992d8e1345e5f2</anchor>
      <arglist>(dims_t dimensions, dims_t offset={{0, 0, 0, 0, 0, 0, 0, 0}, {0, 0, 0, 0, 0, 0, 0, 0}}, std::string description=&quot;&quot;)</arglist>
    </member>
    <member kind="function">
      <type>SMat_ &amp;</type>
      <name>operator*=</name>
      <anchorfile>classmolpro_1_1SMat__.html</anchorfile>
      <anchor>a212e6a6d64b026ba600d5ea713c78604</anchor>
      <arglist>(value_type a)</arglist>
    </member>
    <member kind="function">
      <type>const SMat_</type>
      <name>operator*</name>
      <anchorfile>classmolpro_1_1SMat__.html</anchorfile>
      <anchor>a209f34cc5b42189ac62b3b37d4f38ecf</anchor>
      <arglist>(value_type a) const</arglist>
    </member>
    <member kind="function">
      <type>SMat_ &amp;</type>
      <name>operator+=</name>
      <anchorfile>classmolpro_1_1SMat__.html</anchorfile>
      <anchor>a41ad7a4c85c10e0964c02b18d1a93ec7</anchor>
      <arglist>(SMat_ const &amp;other)</arglist>
    </member>
    <member kind="function">
      <type>SMat_ &amp;</type>
      <name>operator-=</name>
      <anchorfile>classmolpro_1_1SMat__.html</anchorfile>
      <anchor>a085817f06053ef9175e2b6d065fec4c5</anchor>
      <arglist>(SMat_ const &amp;other)</arglist>
    </member>
    <member kind="function">
      <type>const SMat_</type>
      <name>operator+</name>
      <anchorfile>classmolpro_1_1SMat__.html</anchorfile>
      <anchor>aa584ea3281c6576f0c07bb5de13430f0</anchor>
      <arglist>(SMat_ const &amp;other) const</arglist>
    </member>
    <member kind="function">
      <type>const SMat_</type>
      <name>operator-</name>
      <anchorfile>classmolpro_1_1SMat__.html</anchorfile>
      <anchor>a0db33e2542b6c7dd946fc3078b7fe337</anchor>
      <arglist>(SMat_ const &amp;other) const</arglist>
    </member>
    <member kind="function">
      <type>const SMat_</type>
      <name>operator*</name>
      <anchorfile>classmolpro_1_1SMat__.html</anchorfile>
      <anchor>a5accc02756a9ed0c1f49a98a8d88704b</anchor>
      <arglist>(SMat_ const &amp;other) const</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>multiply</name>
      <anchorfile>classmolpro_1_1SMat__.html</anchorfile>
      <anchor>a45ef1bf1087620d03f86ee3c8f111671</anchor>
      <arglist>(SMat_ const &amp;a, SMat_ const &amp;b, value_type alpha=1.0, value_type beta=0.0)</arglist>
    </member>
    <member kind="function">
      <type>scalar_type</type>
      <name>operator&amp;</name>
      <anchorfile>classmolpro_1_1SMat__.html</anchorfile>
      <anchor>acb9f39683496e90b66f1a5a2f30a6347</anchor>
      <arglist>(SMat_ const &amp;other) const</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>transpose</name>
      <anchorfile>classmolpro_1_1SMat__.html</anchorfile>
      <anchor>aa878713a29c0844e2cd3872156a3bc30</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>eval</name>
      <anchorfile>classmolpro_1_1SMat__.html</anchorfile>
      <anchor>a02746993eafa2f8bc9c473a7bf7faba1</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>trim</name>
      <anchorfile>classmolpro_1_1SMat__.html</anchorfile>
      <anchor>a2942690c1327698fa56541091033d9b4</anchor>
      <arglist>(scalar_type cut=0)</arglist>
    </member>
    <member kind="function">
      <type>bool</type>
      <name>operator==</name>
      <anchorfile>classmolpro_1_1SMat__.html</anchorfile>
      <anchor>a96a34d65a3c485318a1d38a7b185b326</anchor>
      <arglist>(SMat_ const &amp;other) const</arglist>
    </member>
    <member kind="function">
      <type>bool</type>
      <name>operator!=</name>
      <anchorfile>classmolpro_1_1SMat__.html</anchorfile>
      <anchor>a8cb7ca96f47fff37ac68d4fa86ef9118</anchor>
      <arglist>(SMat_ const &amp;other) const</arglist>
    </member>
    <member kind="function">
      <type>molpro::array&lt; value_type &gt; *</type>
      <name>data</name>
      <anchorfile>classmolpro_1_1SMat__.html</anchorfile>
      <anchor>a54ad673f1ae269ec9777255219d74d20</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SMat_</name>
      <anchorfile>classmolpro_1_1SMat__.html</anchorfile>
      <anchor>a250d4fcd59dd037c272d272fa0a0ca07</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SMat_</name>
      <anchorfile>classmolpro_1_1SMat__.html</anchorfile>
      <anchor>a1598222c5621f038a6f8260f149f1e68</anchor>
      <arglist>(const std::map&lt; size_t, T &gt; &amp;source)</arglist>
    </member>
    <member kind="function">
      <type>std::map&lt; size_t, T &gt;</type>
      <name>select_max_dot</name>
      <anchorfile>classmolpro_1_1SMat__.html</anchorfile>
      <anchor>a0f0818703e5fd58522ef17775f5b5d0a</anchor>
      <arglist>(size_t n, const SMat_&lt; T &gt; &amp;y) const</arglist>
    </member>
    <member kind="function">
      <type>std::map&lt; size_t, T &gt;</type>
      <name>select_max_dot</name>
      <anchorfile>classmolpro_1_1SMat__.html</anchorfile>
      <anchor>aa4bf47ca6cca88fa5459d23462d93e1e</anchor>
      <arglist>(size_t n, const std::map&lt; size_t, T &gt; &amp;y) const</arglist>
    </member>
    <member kind="function">
      <type>SMat_&lt; T &gt; &amp;</type>
      <name>operator=</name>
      <anchorfile>classmolpro_1_1SMat__.html</anchorfile>
      <anchor>af98b315200c9f4b18ae4dd4737636371</anchor>
      <arglist>(const std::map&lt; size_t, T &gt; &amp;source)</arglist>
    </member>
    <member kind="function">
      <type>size_t</type>
      <name>size</name>
      <anchorfile>classmolpro_1_1SMat__.html</anchorfile>
      <anchor>a991324ba20fa8d9dfedd0e39570e7d5e</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>int</type>
      <name>max_symmetry</name>
      <anchorfile>classmolpro_1_1SMat__.html</anchorfile>
      <anchor>a8539a7cb4cbe5a826ab5702b692565f2</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>int</type>
      <name>symmetry</name>
      <anchorfile>classmolpro_1_1SMat__.html</anchorfile>
      <anchor>a547b277343b47bd508c8a1a9b8265917</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>parity_t</type>
      <name>parity</name>
      <anchorfile>classmolpro_1_1SMat__.html</anchorfile>
      <anchor>a98d3aa28735f6b9767860241b411467d</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>bool</type>
      <name>transposed</name>
      <anchorfile>classmolpro_1_1SMat__.html</anchorfile>
      <anchor>a6b326d37c967bd710614bfbfe5d9b039</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>bool</type>
      <name>Diagonal</name>
      <anchorfile>classmolpro_1_1SMat__.html</anchorfile>
      <anchor>a202742845c62542a214f49fd56768b4b</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>size_t</type>
      <name>dimension</name>
      <anchorfile>classmolpro_1_1SMat__.html</anchorfile>
      <anchor>a341a13f8db182f9827f4bda1160a287f</anchor>
      <arglist>(unsigned int block_symmetry=0, unsigned int axis=0) const</arglist>
    </member>
    <member kind="function">
      <type>unsigned int</type>
      <name>rank</name>
      <anchorfile>classmolpro_1_1SMat__.html</anchorfile>
      <anchor>a1afadd176dc7464b07ba2e3b7910f0d7</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>size_t</type>
      <name>block_size</name>
      <anchorfile>classmolpro_1_1SMat__.html</anchorfile>
      <anchor>a50567b48730e40fbc63a98c503412acc</anchor>
      <arglist>(unsigned int block_symmetry) const</arglist>
    </member>
    <member kind="function">
      <type>molpro::array&lt; value_type &gt;</type>
      <name>block</name>
      <anchorfile>classmolpro_1_1SMat__.html</anchorfile>
      <anchor>ac645aaea1fb648500512ab87e7a727a6</anchor>
      <arglist>(unsigned int block_symmetry) const</arglist>
    </member>
    <member kind="function">
      <type>std::vector&lt; size_t &gt;</type>
      <name>block_dimensions</name>
      <anchorfile>classmolpro_1_1SMat__.html</anchorfile>
      <anchor>ab93b3f5593b33760619295753b5d59d5</anchor>
      <arglist>(unsigned int block_symmetry) const</arglist>
    </member>
    <member kind="function">
      <type>dims_t</type>
      <name>dimensions</name>
      <anchorfile>classmolpro_1_1SMat__.html</anchorfile>
      <anchor>ad6d93288414fcf17fe589aec43663ea6</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>bool</type>
      <name>block_transposed</name>
      <anchorfile>classmolpro_1_1SMat__.html</anchorfile>
      <anchor>ab2bff361bef7e21e8d5559c84f1149e5</anchor>
      <arglist>(unsigned int block_symmetry) const</arglist>
    </member>
    <member kind="function">
      <type>value_type</type>
      <name>trace</name>
      <anchorfile>classmolpro_1_1SMat__.html</anchorfile>
      <anchor>a5f9e9a4b80130050227a951867384dd3</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>scalar_type</type>
      <name>norm</name>
      <anchorfile>classmolpro_1_1SMat__.html</anchorfile>
      <anchor>a87da40b6dc99e6121a56a268e5cb7d89</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>assign</name>
      <anchorfile>classmolpro_1_1SMat__.html</anchorfile>
      <anchor>a79992ebc8adb0f55ccbfcae9298cf496</anchor>
      <arglist>(value_type value)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>setIdentity</name>
      <anchorfile>classmolpro_1_1SMat__.html</anchorfile>
      <anchor>a3b183f6027e4dd11375d990fb8d7f008</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>std::string</type>
      <name>str</name>
      <anchorfile>classmolpro_1_1SMat__.html</anchorfile>
      <anchor>a2a2f0729c8d277b56aac40f0fc9801d8</anchor>
      <arglist>(std::string title, int level=0, int precision=Eigen::StreamPrecision) const</arglist>
    </member>
    <member kind="function">
      <type>std::string</type>
      <name>str</name>
      <anchorfile>classmolpro_1_1SMat__.html</anchorfile>
      <anchor>af00df9fde8fd27b222612b604cec0aaf</anchor>
      <arglist>(int verbosity=0, unsigned int columns=UINT_MAX) const</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>scal</name>
      <anchorfile>classmolpro_1_1SMat__.html</anchorfile>
      <anchor>aa0403579ec286fa82bba55b4dc50249c</anchor>
      <arglist>(value_type a, bool scaleDiagonal=true)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>fill</name>
      <anchorfile>classmolpro_1_1SMat__.html</anchorfile>
      <anchor>a847253cb6a578d49a64612400309bd67</anchor>
      <arglist>(value_type a)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>axpy</name>
      <anchorfile>classmolpro_1_1SMat__.html</anchorfile>
      <anchor>ac795c5a262fae4bee4edaa94a71cf55e</anchor>
      <arglist>(value_type a, const SMat_ &amp;x)</arglist>
    </member>
    <member kind="function">
      <type>SMat_</type>
      <name>transform</name>
      <anchorfile>classmolpro_1_1SMat__.html</anchorfile>
      <anchor>a572642adea5faac95ffde6488280dc3c</anchor>
      <arglist>(const SMat_ &amp;q, bool orthogonal=true) const</arglist>
    </member>
    <member kind="function">
      <type>SMat_</type>
      <name>diagonal</name>
      <anchorfile>classmolpro_1_1SMat__.html</anchorfile>
      <anchor>a37d11915f8ea6ad10c476ec3370d1d33</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>int</type>
      <name>ev</name>
      <anchorfile>classmolpro_1_1SMat__.html</anchorfile>
      <anchor>a2cdd0f1342f2969068b4ea38188a8906</anchor>
      <arglist>(SMat_ &amp;val, SMat_ *vec=nullptr, SMat_ *vali=nullptr, SMat_ *vecl=nullptr, std::string algorithm=&quot;lapack&quot;, std::string sort=&quot;ascending&quot;) const</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>orthogonalize</name>
      <anchorfile>classmolpro_1_1SMat__.html</anchorfile>
      <anchor>a02a41573d916efcca2e28475ce243b01</anchor>
      <arglist>(const SMat_ *metric=nullptr, std::string algorithm=&quot;Gram-Schmidt&quot;)</arglist>
    </member>
    <member kind="function">
      <type>SMat_</type>
      <name>exp</name>
      <anchorfile>classmolpro_1_1SMat__.html</anchorfile>
      <anchor>a6b3a87a915e32f5ed1adf37c5ad117dd</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>SMat_</type>
      <name>log</name>
      <anchorfile>classmolpro_1_1SMat__.html</anchorfile>
      <anchor>a503cdf456709343ea17fc813454caddf</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>SMat_</type>
      <name>sqrt</name>
      <anchorfile>classmolpro_1_1SMat__.html</anchorfile>
      <anchor>a0f86776d92d5cf9667606b39525f9d40</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>SMat_</type>
      <name>pow</name>
      <anchorfile>classmolpro_1_1SMat__.html</anchorfile>
      <anchor>ac352224d7a7d8b5643b51c497cef187b</anchor>
      <arglist>(value_type p) const</arglist>
    </member>
    <member kind="function">
      <type>SMat_</type>
      <name>inverse</name>
      <anchorfile>classmolpro_1_1SMat__.html</anchorfile>
      <anchor>a4e7dfbc96ba45996acb36ba60efdda5e</anchor>
      <arglist>(scalar_type SVThresh=0.0) const</arglist>
    </member>
    <member kind="function">
      <type>SMat_</type>
      <name>solve</name>
      <anchorfile>classmolpro_1_1SMat__.html</anchorfile>
      <anchor>aaeced17693b785a25d29c67350865961</anchor>
      <arglist>(const SMat_ &amp;rhs, std::string algorithm=&quot;ColPivHouseholderQR&quot;) const</arglist>
    </member>
    <member kind="function">
      <type>SMat_</type>
      <name>desymmetrise</name>
      <anchorfile>classmolpro_1_1SMat__.html</anchorfile>
      <anchor>a634e0ddc74bc09838dde93545085661f</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>class molpro::bytestream</type>
      <name>bytestream</name>
      <anchorfile>classmolpro_1_1SMat__.html</anchorfile>
      <anchor>a957ab00af39f9506b9115df9cfacc561</anchor>
      <arglist>(bool data=true)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>axpy</name>
      <anchorfile>classmolpro_1_1SMat__.html</anchorfile>
      <anchor>ae9ce68b6801a554e81f4408409bd737f</anchor>
      <arglist>(value_type a, const std::map&lt; size_t, value_type &gt; &amp;other)</arglist>
    </member>
    <member kind="function">
      <type>scalar_type</type>
      <name>dot</name>
      <anchorfile>classmolpro_1_1SMat__.html</anchorfile>
      <anchor>a5ba0ca2bd576b95d256041c67aecfb74</anchor>
      <arglist>(const SMat_ &amp;other) const</arglist>
    </member>
    <member kind="function">
      <type>scalar_type</type>
      <name>dot</name>
      <anchorfile>classmolpro_1_1SMat__.html</anchorfile>
      <anchor>a672d4f2699a86d74f2298ffaaa1ad28c</anchor>
      <arglist>(const std::map&lt; size_t, value_type &gt; &amp;other) const</arglist>
    </member>
    <member kind="function">
      <type>std::tuple&lt; std::vector&lt; size_t &gt;, std::vector&lt; value_type &gt; &gt;</type>
      <name>select</name>
      <anchorfile>classmolpro_1_1SMat__.html</anchorfile>
      <anchor>acf2c94dde6a37469cfd6787c9921ab89</anchor>
      <arglist>(const molpro::array&lt; value_type &gt; &amp;measure, const size_t maximumNumber=1000, const scalar_type threshold=0) const</arglist>
    </member>
    <member kind="function">
      <type>int</type>
      <name>ev</name>
      <anchorfile>classmolpro_1_1SMat__.html</anchorfile>
      <anchor>a6beb9b03aa3126b8d2ebe6c4a0a8bee1</anchor>
      <arglist>(SMat_&lt; double &gt; &amp;val, SMat_&lt; double &gt; *vec, SMat_&lt; double &gt; *vali, SMat_&lt; double &gt; *vecl, std::string algorithm, std::string sort) const</arglist>
    </member>
    <member kind="function">
      <type>molpro::bytestream</type>
      <name>bytestream</name>
      <anchorfile>classmolpro_1_1SMat__.html</anchorfile>
      <anchor>aac569d073f21357ef567ef5117a0277f</anchor>
      <arglist>(bool data)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SMat_</name>
      <anchorfile>classmolpro_1_1SMat__.html</anchorfile>
      <anchor>a31e6c8494b6db22c4e2ed74b4dc376c2</anchor>
      <arglist>(const char *dump, double *buffer)</arglist>
    </member>
    <member kind="variable">
      <type>std::string</type>
      <name>m_description</name>
      <anchorfile>classmolpro_1_1SMat__.html</anchorfile>
      <anchor>a40c0103547dd73b67fe34b59e58c6bc8</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>SMat_&lt; double &gt;</name>
    <filename>classmolpro_1_1SMat__.html</filename>
    <member kind="typedef">
      <type>Eigen::Map&lt; Eigen::Matrix&lt; double, Eigen::Dynamic, Eigen::Dynamic &gt;, Eigen::Unaligned, Eigen::Stride&lt; Eigen::Dynamic, Eigen::Dynamic &gt; &gt;</type>
      <name>M</name>
      <anchorfile>classmolpro_1_1SMat__.html</anchorfile>
      <anchor>a0327b4b21be7f823b70447284ececf11</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>Eigen::Map&lt; const Eigen::Matrix&lt; double, Eigen::Dynamic, Eigen::Dynamic &gt;, Eigen::Unaligned, Eigen::Stride&lt; Eigen::Dynamic, Eigen::Dynamic &gt; &gt;</type>
      <name>Mconst</name>
      <anchorfile>classmolpro_1_1SMat__.html</anchorfile>
      <anchor>ace72697d7f93c836aa30a2adcdac5f81</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>Eigen::Map&lt; Eigen::Matrix&lt; double, Eigen::Dynamic, 1 &gt; &gt;</type>
      <name>V</name>
      <anchorfile>classmolpro_1_1SMat__.html</anchorfile>
      <anchor>abbe220caa385afb70fd47bcbe2be0487</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>double</type>
      <name>value_type</name>
      <anchorfile>classmolpro_1_1SMat__.html</anchorfile>
      <anchor>a0b0793833395ba3be28166f1d3921341</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>double</type>
      <name>scalar_type</name>
      <anchorfile>classmolpro_1_1SMat__.html</anchorfile>
      <anchor>a8b8c1114d47d84f7d7ed2924fe11ed23</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SMat_</name>
      <anchorfile>classmolpro_1_1SMat__.html</anchorfile>
      <anchor>af808f2a29da585e8ebc8dae3ca31c3b0</anchor>
      <arglist>(dims_t dimensions, parity_t parity=parityNone, int symmetry=0, bool diagonal=false, std::string description=&quot;&quot;)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SMat_</name>
      <anchorfile>classmolpro_1_1SMat__.html</anchorfile>
      <anchor>a14857bfc39552244d6778a125f5ecdcd</anchor>
      <arglist>(dims_t dimensions, molpro::array&lt; value_type &gt; &amp;buffer, parity_t parity=parityNone, int symmetry=0, bool diagonal=false, std::string description=&quot;&quot;)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SMat_</name>
      <anchorfile>classmolpro_1_1SMat__.html</anchorfile>
      <anchor>adcc071139db4f4cb5d9aff40cc816e4f</anchor>
      <arglist>(dims_t dimensions, value_type *buffer, parity_t parity=parityNone, int symmetry=0, bool diagonal=false, std::string description=&quot;&quot;)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SMat_</name>
      <anchorfile>classmolpro_1_1SMat__.html</anchorfile>
      <anchor>ad75df24c8852f5384bf3e61fcbc0c1f6</anchor>
      <arglist>(std::string space, parity_t parity=parityNone, int symmetry=0, bool diagonal=false, std::string description=&quot;&quot;)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SMat_</name>
      <anchorfile>classmolpro_1_1SMat__.html</anchorfile>
      <anchor>a64bd7f74bbc04f1c3ab4f4f900fe86cd</anchor>
      <arglist>(std::string space, molpro::array&lt; value_type &gt; &amp;buffer, parity_t parity=parityNone, int symmetry=0, bool diagonal=false, std::string description=&quot;&quot;)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SMat_</name>
      <anchorfile>classmolpro_1_1SMat__.html</anchorfile>
      <anchor>a39e4d9da3065b19a3c0d8b9ae98ed3c3</anchor>
      <arglist>(std::string space, value_type *buffer, parity_t parity=parityNone, int symmetry=0, bool diagonal=false, std::string description=&quot;&quot;)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SMat_</name>
      <anchorfile>classmolpro_1_1SMat__.html</anchorfile>
      <anchor>af2cc7af6ba16f310f745724129d5c932</anchor>
      <arglist>(SMat_ const *source, parity_t parity=parityUnspecified, int symmetry=9, unsigned int rank=0, bool diagonal=false, std::string description=&quot;&quot;)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SMat_</name>
      <anchorfile>classmolpro_1_1SMat__.html</anchorfile>
      <anchor>aa1ee4ed1ddc82c615d84b96af006f99c</anchor>
      <arglist>(SMat_ const *source, molpro::array&lt; value_type &gt; &amp;buffer, parity_t parity=parityUnspecified, int symmetry=9, unsigned int rank=0, bool diagonal=false, std::string description=&quot;&quot;)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SMat_</name>
      <anchorfile>classmolpro_1_1SMat__.html</anchorfile>
      <anchor>a82319192daa2d0194d4c8e6f56155632</anchor>
      <arglist>(SMat_ const *source, value_type *buffer, parity_t parity, int symmetry=9, unsigned int rank=0, bool diagonal=false, std::string description=&quot;&quot;)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SMat_</name>
      <anchorfile>classmolpro_1_1SMat__.html</anchorfile>
      <anchor>ab99b3114ed6ddaeea1d471048aaf39ca</anchor>
      <arglist>(SMat_ const &amp;source, int option=0)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SMat_</name>
      <anchorfile>classmolpro_1_1SMat__.html</anchorfile>
      <anchor>a6a4f9846a6de8a97218b002256490d5d</anchor>
      <arglist>(const char *dump, value_type *buffer=nullptr)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SMat_</name>
      <anchorfile>classmolpro_1_1SMat__.html</anchorfile>
      <anchor>a7ca0b0ca854905e53878e6be96c994dc</anchor>
      <arglist>(const molpro::bytestream &amp;bs, value_type *buffer=nullptr)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SMat_</name>
      <anchorfile>classmolpro_1_1SMat__.html</anchorfile>
      <anchor>a250d4fcd59dd037c272d272fa0a0ca07</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SMat_</name>
      <anchorfile>classmolpro_1_1SMat__.html</anchorfile>
      <anchor>a1598222c5621f038a6f8260f149f1e68</anchor>
      <arglist>(const std::map&lt; size_t, double &gt; &amp;source)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SMat_</name>
      <anchorfile>classmolpro_1_1SMat__.html</anchorfile>
      <anchor>a31e6c8494b6db22c4e2ed74b4dc376c2</anchor>
      <arglist>(const char *dump, double *buffer)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>~SMat_</name>
      <anchorfile>classmolpro_1_1SMat__.html</anchorfile>
      <anchor>a5df30e81a0c10dd11c3f3c1d525459fa</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>SMat_ &amp;</type>
      <name>operator=</name>
      <anchorfile>classmolpro_1_1SMat__.html</anchorfile>
      <anchor>a101b66c8de2e0ebf4525078e77c02102</anchor>
      <arglist>(SMat_ const &amp;source)</arglist>
    </member>
    <member kind="function">
      <type>SMat_&lt; double &gt; &amp;</type>
      <name>operator=</name>
      <anchorfile>classmolpro_1_1SMat__.html</anchorfile>
      <anchor>af98b315200c9f4b18ae4dd4737636371</anchor>
      <arglist>(const std::map&lt; size_t, double &gt; &amp;source)</arglist>
    </member>
    <member kind="function">
      <type>SMat_ &amp;</type>
      <name>copy</name>
      <anchorfile>classmolpro_1_1SMat__.html</anchorfile>
      <anchor>a8772e70926c11c6018ea80b84a2ba410</anchor>
      <arglist>(SMat_ const &amp;source, dims_t sourceOffset={{0, 0, 0, 0, 0, 0, 0, 0}, {0, 0, 0, 0, 0, 0, 0, 0}})</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>splice</name>
      <anchorfile>classmolpro_1_1SMat__.html</anchorfile>
      <anchor>a5d0e1b4ebd809e20903c469937e6037a</anchor>
      <arglist>(SMat_ const &amp;source, dims_t sourceOffset={{0, 0, 0, 0, 0, 0, 0, 0}, {0, 0, 0, 0, 0, 0, 0, 0}}, dims_t offset={{0, 0, 0, 0, 0, 0, 0, 0}, {0, 0, 0, 0, 0, 0, 0, 0}})</arglist>
    </member>
    <member kind="function">
      <type>SMat_</type>
      <name>slice</name>
      <anchorfile>classmolpro_1_1SMat__.html</anchorfile>
      <anchor>aa430910cb57918a059992d8e1345e5f2</anchor>
      <arglist>(dims_t dimensions, dims_t offset={{0, 0, 0, 0, 0, 0, 0, 0}, {0, 0, 0, 0, 0, 0, 0, 0}}, std::string description=&quot;&quot;)</arglist>
    </member>
    <member kind="function">
      <type>SMat_ &amp;</type>
      <name>operator*=</name>
      <anchorfile>classmolpro_1_1SMat__.html</anchorfile>
      <anchor>a212e6a6d64b026ba600d5ea713c78604</anchor>
      <arglist>(value_type a)</arglist>
    </member>
    <member kind="function">
      <type>const SMat_</type>
      <name>operator*</name>
      <anchorfile>classmolpro_1_1SMat__.html</anchorfile>
      <anchor>a209f34cc5b42189ac62b3b37d4f38ecf</anchor>
      <arglist>(value_type a) const</arglist>
    </member>
    <member kind="function">
      <type>const SMat_</type>
      <name>operator*</name>
      <anchorfile>classmolpro_1_1SMat__.html</anchorfile>
      <anchor>a5accc02756a9ed0c1f49a98a8d88704b</anchor>
      <arglist>(SMat_ const &amp;other) const</arglist>
    </member>
    <member kind="function">
      <type>SMat_ &amp;</type>
      <name>operator+=</name>
      <anchorfile>classmolpro_1_1SMat__.html</anchorfile>
      <anchor>a41ad7a4c85c10e0964c02b18d1a93ec7</anchor>
      <arglist>(SMat_ const &amp;other)</arglist>
    </member>
    <member kind="function">
      <type>SMat_ &amp;</type>
      <name>operator-=</name>
      <anchorfile>classmolpro_1_1SMat__.html</anchorfile>
      <anchor>a085817f06053ef9175e2b6d065fec4c5</anchor>
      <arglist>(SMat_ const &amp;other)</arglist>
    </member>
    <member kind="function">
      <type>const SMat_</type>
      <name>operator+</name>
      <anchorfile>classmolpro_1_1SMat__.html</anchorfile>
      <anchor>aa584ea3281c6576f0c07bb5de13430f0</anchor>
      <arglist>(SMat_ const &amp;other) const</arglist>
    </member>
    <member kind="function">
      <type>const SMat_</type>
      <name>operator-</name>
      <anchorfile>classmolpro_1_1SMat__.html</anchorfile>
      <anchor>a0db33e2542b6c7dd946fc3078b7fe337</anchor>
      <arglist>(SMat_ const &amp;other) const</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>multiply</name>
      <anchorfile>classmolpro_1_1SMat__.html</anchorfile>
      <anchor>a45ef1bf1087620d03f86ee3c8f111671</anchor>
      <arglist>(SMat_ const &amp;a, SMat_ const &amp;b, value_type alpha=1.0, value_type beta=0.0)</arglist>
    </member>
    <member kind="function">
      <type>scalar_type</type>
      <name>operator&amp;</name>
      <anchorfile>classmolpro_1_1SMat__.html</anchorfile>
      <anchor>acb9f39683496e90b66f1a5a2f30a6347</anchor>
      <arglist>(SMat_ const &amp;other) const</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>transpose</name>
      <anchorfile>classmolpro_1_1SMat__.html</anchorfile>
      <anchor>aa878713a29c0844e2cd3872156a3bc30</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>eval</name>
      <anchorfile>classmolpro_1_1SMat__.html</anchorfile>
      <anchor>a02746993eafa2f8bc9c473a7bf7faba1</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>trim</name>
      <anchorfile>classmolpro_1_1SMat__.html</anchorfile>
      <anchor>a2942690c1327698fa56541091033d9b4</anchor>
      <arglist>(scalar_type cut=0)</arglist>
    </member>
    <member kind="function">
      <type>bool</type>
      <name>operator==</name>
      <anchorfile>classmolpro_1_1SMat__.html</anchorfile>
      <anchor>a96a34d65a3c485318a1d38a7b185b326</anchor>
      <arglist>(SMat_ const &amp;other) const</arglist>
    </member>
    <member kind="function">
      <type>bool</type>
      <name>operator!=</name>
      <anchorfile>classmolpro_1_1SMat__.html</anchorfile>
      <anchor>a8cb7ca96f47fff37ac68d4fa86ef9118</anchor>
      <arglist>(SMat_ const &amp;other) const</arglist>
    </member>
    <member kind="function">
      <type>molpro::array&lt; value_type &gt; *</type>
      <name>data</name>
      <anchorfile>classmolpro_1_1SMat__.html</anchorfile>
      <anchor>a54ad673f1ae269ec9777255219d74d20</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>std::map&lt; size_t, double &gt;</type>
      <name>select_max_dot</name>
      <anchorfile>classmolpro_1_1SMat__.html</anchorfile>
      <anchor>a0f0818703e5fd58522ef17775f5b5d0a</anchor>
      <arglist>(size_t n, const SMat_&lt; double &gt; &amp;y) const</arglist>
    </member>
    <member kind="function">
      <type>std::map&lt; size_t, double &gt;</type>
      <name>select_max_dot</name>
      <anchorfile>classmolpro_1_1SMat__.html</anchorfile>
      <anchor>aa4bf47ca6cca88fa5459d23462d93e1e</anchor>
      <arglist>(size_t n, const std::map&lt; size_t, double &gt; &amp;y) const</arglist>
    </member>
    <member kind="function">
      <type>size_t</type>
      <name>size</name>
      <anchorfile>classmolpro_1_1SMat__.html</anchorfile>
      <anchor>a991324ba20fa8d9dfedd0e39570e7d5e</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>int</type>
      <name>max_symmetry</name>
      <anchorfile>classmolpro_1_1SMat__.html</anchorfile>
      <anchor>a8539a7cb4cbe5a826ab5702b692565f2</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>int</type>
      <name>symmetry</name>
      <anchorfile>classmolpro_1_1SMat__.html</anchorfile>
      <anchor>a547b277343b47bd508c8a1a9b8265917</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>parity_t</type>
      <name>parity</name>
      <anchorfile>classmolpro_1_1SMat__.html</anchorfile>
      <anchor>a98d3aa28735f6b9767860241b411467d</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>bool</type>
      <name>transposed</name>
      <anchorfile>classmolpro_1_1SMat__.html</anchorfile>
      <anchor>a6b326d37c967bd710614bfbfe5d9b039</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>bool</type>
      <name>Diagonal</name>
      <anchorfile>classmolpro_1_1SMat__.html</anchorfile>
      <anchor>a202742845c62542a214f49fd56768b4b</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>size_t</type>
      <name>dimension</name>
      <anchorfile>classmolpro_1_1SMat__.html</anchorfile>
      <anchor>a341a13f8db182f9827f4bda1160a287f</anchor>
      <arglist>(unsigned int block_symmetry=0, unsigned int axis=0) const</arglist>
    </member>
    <member kind="function">
      <type>unsigned int</type>
      <name>rank</name>
      <anchorfile>classmolpro_1_1SMat__.html</anchorfile>
      <anchor>a1afadd176dc7464b07ba2e3b7910f0d7</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>size_t</type>
      <name>block_size</name>
      <anchorfile>classmolpro_1_1SMat__.html</anchorfile>
      <anchor>a50567b48730e40fbc63a98c503412acc</anchor>
      <arglist>(unsigned int block_symmetry) const</arglist>
    </member>
    <member kind="function">
      <type>molpro::array&lt; value_type &gt;</type>
      <name>block</name>
      <anchorfile>classmolpro_1_1SMat__.html</anchorfile>
      <anchor>ac645aaea1fb648500512ab87e7a727a6</anchor>
      <arglist>(unsigned int block_symmetry) const</arglist>
    </member>
    <member kind="function">
      <type>std::vector&lt; size_t &gt;</type>
      <name>block_dimensions</name>
      <anchorfile>classmolpro_1_1SMat__.html</anchorfile>
      <anchor>ab93b3f5593b33760619295753b5d59d5</anchor>
      <arglist>(unsigned int block_symmetry) const</arglist>
    </member>
    <member kind="function">
      <type>dims_t</type>
      <name>dimensions</name>
      <anchorfile>classmolpro_1_1SMat__.html</anchorfile>
      <anchor>ad6d93288414fcf17fe589aec43663ea6</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>bool</type>
      <name>block_transposed</name>
      <anchorfile>classmolpro_1_1SMat__.html</anchorfile>
      <anchor>ab2bff361bef7e21e8d5559c84f1149e5</anchor>
      <arglist>(unsigned int block_symmetry) const</arglist>
    </member>
    <member kind="function">
      <type>value_type</type>
      <name>trace</name>
      <anchorfile>classmolpro_1_1SMat__.html</anchorfile>
      <anchor>a5f9e9a4b80130050227a951867384dd3</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>scalar_type</type>
      <name>norm</name>
      <anchorfile>classmolpro_1_1SMat__.html</anchorfile>
      <anchor>a87da40b6dc99e6121a56a268e5cb7d89</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>assign</name>
      <anchorfile>classmolpro_1_1SMat__.html</anchorfile>
      <anchor>a79992ebc8adb0f55ccbfcae9298cf496</anchor>
      <arglist>(value_type value)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>setIdentity</name>
      <anchorfile>classmolpro_1_1SMat__.html</anchorfile>
      <anchor>a3b183f6027e4dd11375d990fb8d7f008</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>std::string</type>
      <name>str</name>
      <anchorfile>classmolpro_1_1SMat__.html</anchorfile>
      <anchor>a2a2f0729c8d277b56aac40f0fc9801d8</anchor>
      <arglist>(std::string title, int level=0, int precision=Eigen::StreamPrecision) const</arglist>
    </member>
    <member kind="function">
      <type>std::string</type>
      <name>str</name>
      <anchorfile>classmolpro_1_1SMat__.html</anchorfile>
      <anchor>af00df9fde8fd27b222612b604cec0aaf</anchor>
      <arglist>(int verbosity=0, unsigned int columns=UINT_MAX) const</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>scal</name>
      <anchorfile>classmolpro_1_1SMat__.html</anchorfile>
      <anchor>aa0403579ec286fa82bba55b4dc50249c</anchor>
      <arglist>(value_type a, bool scaleDiagonal=true)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>fill</name>
      <anchorfile>classmolpro_1_1SMat__.html</anchorfile>
      <anchor>a847253cb6a578d49a64612400309bd67</anchor>
      <arglist>(value_type a)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>axpy</name>
      <anchorfile>classmolpro_1_1SMat__.html</anchorfile>
      <anchor>ac795c5a262fae4bee4edaa94a71cf55e</anchor>
      <arglist>(value_type a, const SMat_ &amp;x)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>axpy</name>
      <anchorfile>classmolpro_1_1SMat__.html</anchorfile>
      <anchor>ae9ce68b6801a554e81f4408409bd737f</anchor>
      <arglist>(value_type a, const std::map&lt; size_t, value_type &gt; &amp;other)</arglist>
    </member>
    <member kind="function">
      <type>SMat_</type>
      <name>transform</name>
      <anchorfile>classmolpro_1_1SMat__.html</anchorfile>
      <anchor>a572642adea5faac95ffde6488280dc3c</anchor>
      <arglist>(const SMat_ &amp;q, bool orthogonal=true) const</arglist>
    </member>
    <member kind="function">
      <type>SMat_</type>
      <name>diagonal</name>
      <anchorfile>classmolpro_1_1SMat__.html</anchorfile>
      <anchor>a37d11915f8ea6ad10c476ec3370d1d33</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>int</type>
      <name>ev</name>
      <anchorfile>classmolpro_1_1SMat__.html</anchorfile>
      <anchor>a2cdd0f1342f2969068b4ea38188a8906</anchor>
      <arglist>(SMat_ &amp;val, SMat_ *vec=nullptr, SMat_ *vali=nullptr, SMat_ *vecl=nullptr, std::string algorithm=&quot;lapack&quot;, std::string sort=&quot;ascending&quot;) const</arglist>
    </member>
    <member kind="function">
      <type>int</type>
      <name>ev</name>
      <anchorfile>classmolpro_1_1SMat__.html</anchorfile>
      <anchor>a6beb9b03aa3126b8d2ebe6c4a0a8bee1</anchor>
      <arglist>(SMat_&lt; double &gt; &amp;val, SMat_&lt; double &gt; *vec, SMat_&lt; double &gt; *vali, SMat_&lt; double &gt; *vecl, std::string algorithm, std::string sort) const</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>orthogonalize</name>
      <anchorfile>classmolpro_1_1SMat__.html</anchorfile>
      <anchor>a02a41573d916efcca2e28475ce243b01</anchor>
      <arglist>(const SMat_ *metric=nullptr, std::string algorithm=&quot;Gram-Schmidt&quot;)</arglist>
    </member>
    <member kind="function">
      <type>SMat_</type>
      <name>exp</name>
      <anchorfile>classmolpro_1_1SMat__.html</anchorfile>
      <anchor>a6b3a87a915e32f5ed1adf37c5ad117dd</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>SMat_</type>
      <name>log</name>
      <anchorfile>classmolpro_1_1SMat__.html</anchorfile>
      <anchor>a503cdf456709343ea17fc813454caddf</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>SMat_</type>
      <name>sqrt</name>
      <anchorfile>classmolpro_1_1SMat__.html</anchorfile>
      <anchor>a0f86776d92d5cf9667606b39525f9d40</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>SMat_</type>
      <name>pow</name>
      <anchorfile>classmolpro_1_1SMat__.html</anchorfile>
      <anchor>ac352224d7a7d8b5643b51c497cef187b</anchor>
      <arglist>(value_type p) const</arglist>
    </member>
    <member kind="function">
      <type>SMat_</type>
      <name>inverse</name>
      <anchorfile>classmolpro_1_1SMat__.html</anchorfile>
      <anchor>a4e7dfbc96ba45996acb36ba60efdda5e</anchor>
      <arglist>(scalar_type SVThresh=0.0) const</arglist>
    </member>
    <member kind="function">
      <type>SMat_</type>
      <name>solve</name>
      <anchorfile>classmolpro_1_1SMat__.html</anchorfile>
      <anchor>aaeced17693b785a25d29c67350865961</anchor>
      <arglist>(const SMat_ &amp;rhs, std::string algorithm=&quot;ColPivHouseholderQR&quot;) const</arglist>
    </member>
    <member kind="function">
      <type>SMat_</type>
      <name>desymmetrise</name>
      <anchorfile>classmolpro_1_1SMat__.html</anchorfile>
      <anchor>a634e0ddc74bc09838dde93545085661f</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>class molpro::bytestream</type>
      <name>bytestream</name>
      <anchorfile>classmolpro_1_1SMat__.html</anchorfile>
      <anchor>a957ab00af39f9506b9115df9cfacc561</anchor>
      <arglist>(bool data=true)</arglist>
    </member>
    <member kind="function">
      <type>molpro::bytestream</type>
      <name>bytestream</name>
      <anchorfile>classmolpro_1_1SMat__.html</anchorfile>
      <anchor>aac569d073f21357ef567ef5117a0277f</anchor>
      <arglist>(bool data)</arglist>
    </member>
    <member kind="function">
      <type>scalar_type</type>
      <name>dot</name>
      <anchorfile>classmolpro_1_1SMat__.html</anchorfile>
      <anchor>a5ba0ca2bd576b95d256041c67aecfb74</anchor>
      <arglist>(const SMat_ &amp;other) const</arglist>
    </member>
    <member kind="function">
      <type>scalar_type</type>
      <name>dot</name>
      <anchorfile>classmolpro_1_1SMat__.html</anchorfile>
      <anchor>a672d4f2699a86d74f2298ffaaa1ad28c</anchor>
      <arglist>(const std::map&lt; size_t, value_type &gt; &amp;other) const</arglist>
    </member>
    <member kind="function">
      <type>std::tuple&lt; std::vector&lt; size_t &gt;, std::vector&lt; value_type &gt; &gt;</type>
      <name>select</name>
      <anchorfile>classmolpro_1_1SMat__.html</anchorfile>
      <anchor>acf2c94dde6a37469cfd6787c9921ab89</anchor>
      <arglist>(const molpro::array&lt; value_type &gt; &amp;measure, const size_t maximumNumber=1000, const scalar_type threshold=0) const</arglist>
    </member>
    <member kind="variable">
      <type>std::string</type>
      <name>m_description</name>
      <anchorfile>classmolpro_1_1SMat__.html</anchorfile>
      <anchor>a40c0103547dd73b67fe34b59e58c6bc8</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>molpro::SMatMat_</name>
    <filename>classmolpro_1_1SMatMat__.html</filename>
    <templarg></templarg>
    <member kind="typedef">
      <type>typename T::value_type</type>
      <name>value_type</name>
      <anchorfile>classmolpro_1_1SMatMat__.html</anchorfile>
      <anchor>a00551b8ace2a4d1b9c262fb60a8fe435</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>typename T::scalar_type</type>
      <name>scalar_type</name>
      <anchorfile>classmolpro_1_1SMatMat__.html</anchorfile>
      <anchor>a5e31b5c3263c94cc02c7eca51adc8ad4</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>typename T::M</type>
      <name>M</name>
      <anchorfile>classmolpro_1_1SMatMat__.html</anchorfile>
      <anchor>ae8c0e08b711d56715705ccb090b8e30d</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>typename T::Mconst</type>
      <name>Mconst</name>
      <anchorfile>classmolpro_1_1SMatMat__.html</anchorfile>
      <anchor>ae5bef58d1e3deba8323f1f113d84cd64</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>typename T::V</type>
      <name>V</name>
      <anchorfile>classmolpro_1_1SMatMat__.html</anchorfile>
      <anchor>a4d0dfffde08ca4ddcbc8c61058f7665f</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SMatMat_</name>
      <anchorfile>classmolpro_1_1SMatMat__.html</anchorfile>
      <anchor>a80f6a52bc36cbb5501df04292f3b21a3</anchor>
      <arglist>(const T &amp;smat, dims_t dimensions, value_type *buffer=nullptr, parity_t parity=parityNone, int symmetry=0, std::string description=&quot;&quot;)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SMatMat_</name>
      <anchorfile>classmolpro_1_1SMatMat__.html</anchorfile>
      <anchor>a1092fbfff53960b80f5967ce8c30198a</anchor>
      <arglist>(const char *dump, value_type *buffer=nullptr)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SMatMat_</name>
      <anchorfile>classmolpro_1_1SMatMat__.html</anchorfile>
      <anchor>a96f60c2f25ac1e9dc1a9ec0c664d14fd</anchor>
      <arglist>(const molpro::bytestream &amp;bs, value_type *buffer=nullptr)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SMatMat_</name>
      <anchorfile>classmolpro_1_1SMatMat__.html</anchorfile>
      <anchor>a921595eb1e7252f2d684dfe9ee865e2e</anchor>
      <arglist>(const SMatMat_ &amp;source)</arglist>
    </member>
    <member kind="function">
      <type>SMatMat_ &amp;</type>
      <name>operator=</name>
      <anchorfile>classmolpro_1_1SMatMat__.html</anchorfile>
      <anchor>aa261ae3cb822624db88f3e7d580cfccf</anchor>
      <arglist>(const SMatMat_ &amp;other)</arglist>
    </member>
    <member kind="function">
      <type>SMatMat_ &amp;</type>
      <name>operator+=</name>
      <anchorfile>classmolpro_1_1SMatMat__.html</anchorfile>
      <anchor>a7800e97ce9c97cc8112a58e1926ed2d5</anchor>
      <arglist>(const SMatMat_ &amp;other)</arglist>
    </member>
    <member kind="function">
      <type>SMatMat_ &amp;</type>
      <name>operator-=</name>
      <anchorfile>classmolpro_1_1SMatMat__.html</anchorfile>
      <anchor>a8ef41b97039498c3aac646b34f4efef0</anchor>
      <arglist>(const SMatMat_ &amp;other)</arglist>
    </member>
    <member kind="function">
      <type>SMatMat_ &amp;</type>
      <name>operator*=</name>
      <anchorfile>classmolpro_1_1SMatMat__.html</anchorfile>
      <anchor>a1790172b894f989187db20e1f7bd5700</anchor>
      <arglist>(typename T::value_type other)</arglist>
    </member>
    <member kind="function">
      <type>SMatMat_</type>
      <name>operator+</name>
      <anchorfile>classmolpro_1_1SMatMat__.html</anchorfile>
      <anchor>a2c373b9df148f254c94d746523de5d10</anchor>
      <arglist>(const SMatMat_ &amp;other)</arglist>
    </member>
    <member kind="function">
      <type>SMatMat_</type>
      <name>operator-</name>
      <anchorfile>classmolpro_1_1SMatMat__.html</anchorfile>
      <anchor>ae7442731862d53ab86428e96993ded6e</anchor>
      <arglist>(const SMatMat_ &amp;other)</arglist>
    </member>
    <member kind="function">
      <type>SMatMat_</type>
      <name>operator*</name>
      <anchorfile>classmolpro_1_1SMatMat__.html</anchorfile>
      <anchor>a82aa23da6ff8140ad0ec1e3fcc365235</anchor>
      <arglist>(typename T::value_type other)</arglist>
    </member>
    <member kind="function">
      <type>scalar_type</type>
      <name>operator&amp;</name>
      <anchorfile>classmolpro_1_1SMatMat__.html</anchorfile>
      <anchor>a4aa59c9111a70f330cebd35206ac1fcc</anchor>
      <arglist>(const SMatMat_ &amp;other) const</arglist>
    </member>
    <member kind="function">
      <type>std::shared_ptr&lt; T &gt;</type>
      <name>smat</name>
      <anchorfile>classmolpro_1_1SMatMat__.html</anchorfile>
      <anchor>ac9d660e9d6474bfac4d34dd7b112f38b</anchor>
      <arglist>(unsigned int ijsym, unsigned int isym, int i, int j=0) const</arglist>
    </member>
    <member kind="function">
      <type>size_t</type>
      <name>size</name>
      <anchorfile>classmolpro_1_1SMatMat__.html</anchorfile>
      <anchor>a37455eac6a4dc87ab374540fe7345683</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>unsigned int</type>
      <name>symmetry</name>
      <anchorfile>classmolpro_1_1SMatMat__.html</anchorfile>
      <anchor>a47c2b7c4ffc180dbc101584595fd9999</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>parity_t</type>
      <name>parity</name>
      <anchorfile>classmolpro_1_1SMatMat__.html</anchorfile>
      <anchor>ac5df7b54d10be055b241049a9ccb312b</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>size_t</type>
      <name>dimension</name>
      <anchorfile>classmolpro_1_1SMatMat__.html</anchorfile>
      <anchor>a3062d99e9e902999f2341196fd0a96b4</anchor>
      <arglist>(unsigned int block_symmetry=0, unsigned int axis=0)</arglist>
    </member>
    <member kind="function">
      <type>unsigned int</type>
      <name>rank</name>
      <anchorfile>classmolpro_1_1SMatMat__.html</anchorfile>
      <anchor>a022be1c94a139bdbba7521190b9813ba</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>class molpro::bytestream</type>
      <name>bytestream</name>
      <anchorfile>classmolpro_1_1SMatMat__.html</anchorfile>
      <anchor>add82d23ebb9c4ea81c24ae673997d39c</anchor>
      <arglist>(bool data=true)</arglist>
    </member>
    <member kind="function">
      <type>std::string</type>
      <name>str</name>
      <anchorfile>classmolpro_1_1SMatMat__.html</anchorfile>
      <anchor>ad9c7696abdaaa2e2e764a50609a0c37c</anchor>
      <arglist>(std::string title=&quot;&quot;, int level=0) const</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>scal</name>
      <anchorfile>classmolpro_1_1SMatMat__.html</anchorfile>
      <anchor>aaa6af901b53fc502883bc2966141e305</anchor>
      <arglist>(value_type a, bool scaleDiagonal=true)</arglist>
    </member>
    <member kind="function">
      <type>size_t</type>
      <name>block_size</name>
      <anchorfile>classmolpro_1_1SMatMat__.html</anchorfile>
      <anchor>a113542570181bf5651d009688fbdd473</anchor>
      <arglist>(unsigned int ijsym, unsigned int isym) const</arglist>
    </member>
    <member kind="function">
      <type>size_t</type>
      <name>block_size</name>
      <anchorfile>classmolpro_1_1SMatMat__.html</anchorfile>
      <anchor>a2939f71201656cebf752629967a2c8d9</anchor>
      <arglist>(unsigned int ijsym) const</arglist>
    </member>
    <member kind="function">
      <type>size_t</type>
      <name>block_offset</name>
      <anchorfile>classmolpro_1_1SMatMat__.html</anchorfile>
      <anchor>aa96e6fb45711ea9d0ecf135928d11263</anchor>
      <arglist>(unsigned int ijsym, unsigned int isym) const</arglist>
    </member>
    <member kind="function">
      <type>size_t</type>
      <name>block_offset</name>
      <anchorfile>classmolpro_1_1SMatMat__.html</anchorfile>
      <anchor>a5238ec66c19e2d85ce57cffe0bb5e437</anchor>
      <arglist>(unsigned int ijsym) const</arglist>
    </member>
    <member kind="function">
      <type>molpro::array&lt; value_type &gt;</type>
      <name>block</name>
      <anchorfile>classmolpro_1_1SMatMat__.html</anchorfile>
      <anchor>a0e88da3ad1e2450058faf7251a6e93fd</anchor>
      <arglist>(unsigned int block_symmetry) const</arglist>
    </member>
    <member kind="function">
      <type>bool</type>
      <name>compatible</name>
      <anchorfile>classmolpro_1_1SMatMat__.html</anchorfile>
      <anchor>a5de48f757ec4bd40c2151bbe752e780a</anchor>
      <arglist>(const SMatMat_ &amp;other) const</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>checkCompatible</name>
      <anchorfile>classmolpro_1_1SMatMat__.html</anchorfile>
      <anchor>af1de985d1726bdf494d82a57f8563599</anchor>
      <arglist>(const SMatMat_ &amp;other) const</arglist>
    </member>
    <member kind="function">
      <type>molpro::array&lt; value_type &gt; *</type>
      <name>data</name>
      <anchorfile>classmolpro_1_1SMatMat__.html</anchorfile>
      <anchor>aa1406e19326a5fc24964f96d1a491125</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="variable">
      <type>unsigned int</type>
      <name>max_symmetry_</name>
      <anchorfile>classmolpro_1_1SMatMat__.html</anchorfile>
      <anchor>aa7f6bb768e1f745f3e9433a73a1c7199</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>dims_t</type>
      <name>m_dimensions</name>
      <anchorfile>classmolpro_1_1SMatMat__.html</anchorfile>
      <anchor>a8b4b1a58ea2e27a4230c0002632ab99f</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>parity_t</type>
      <name>m_parity</name>
      <anchorfile>classmolpro_1_1SMatMat__.html</anchorfile>
      <anchor>a35b4951a02b4aba108db2bab14ca6b42</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>unsigned int</type>
      <name>m_symmetry</name>
      <anchorfile>classmolpro_1_1SMatMat__.html</anchorfile>
      <anchor>ad79ccc05934254fa5f50ff97e606687b</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>std::string</type>
      <name>m_description</name>
      <anchorfile>classmolpro_1_1SMatMat__.html</anchorfile>
      <anchor>aff0206c7ced0745ff7c5ca590cbf1468</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>molpro::gci::State</name>
    <filename>classmolpro_1_1gci_1_1State.html</filename>
    <base>molpro::gci::Printable</base>
    <member kind="function">
      <type></type>
      <name>State</name>
      <anchorfile>classmolpro_1_1gci_1_1State.html</anchorfile>
      <anchor>a04f37afdeaab9ff96b558524b368cbc9</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>State</name>
      <anchorfile>classmolpro_1_1gci_1_1State.html</anchorfile>
      <anchor>a5db027c1628e2b923f29e87417c8936e</anchor>
      <arglist>(const Options &amp;dump)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>State</name>
      <anchorfile>classmolpro_1_1gci_1_1State.html</anchorfile>
      <anchor>a579663c2b5abff8a8149d7c853f80f68</anchor>
      <arglist>(OrbitalSpace *os, int nelec=0, int symmetry=1, int ms2=0)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>State</name>
      <anchorfile>classmolpro_1_1gci_1_1State.html</anchorfile>
      <anchor>a7391675690ef1b1688fa6aa9b5e239c2</anchor>
      <arglist>(OrbitalSpace &amp;os, int nelec=0, int symmetry=1, int ms2=0)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>State</name>
      <anchorfile>classmolpro_1_1gci_1_1State.html</anchorfile>
      <anchor>ae9e8f4254fc74ed94d8895d50426dbbf</anchor>
      <arglist>(const molpro::Operator &amp;o, int n, int s, int m2)</arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual</type>
      <name>~State</name>
      <anchorfile>classmolpro_1_1gci_1_1State.html</anchorfile>
      <anchor>a5c39a3315b401c2473f0f34322b605a6</anchor>
      <arglist>()=default</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>load</name>
      <anchorfile>classmolpro_1_1gci_1_1State.html</anchorfile>
      <anchor>a4f4d3711be1e0bb91179aa7c619c460c</anchor>
      <arglist>(const Options &amp;dump)</arglist>
    </member>
    <member kind="function">
      <type>std::string</type>
      <name>str</name>
      <anchorfile>classmolpro_1_1gci_1_1State.html</anchorfile>
      <anchor>abbd0377a07f7f62017b95e9eaa9b3244</anchor>
      <arglist>(int verbosity=0, unsigned int columns=UINT_MAX) const override</arglist>
    </member>
    <member kind="variable">
      <type>std::shared_ptr&lt; OrbitalSpace &gt;</type>
      <name>orbitalSpace</name>
      <anchorfile>classmolpro_1_1gci_1_1State.html</anchorfile>
      <anchor>a450e860052e6477e354036a1d4203df6</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>unsigned int</type>
      <name>nelec</name>
      <anchorfile>classmolpro_1_1gci_1_1State.html</anchorfile>
      <anchor>a175f2c71c652b78a6c3c61d4b59723eb</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>int</type>
      <name>ms2</name>
      <anchorfile>classmolpro_1_1gci_1_1State.html</anchorfile>
      <anchor>a5a2bb591ed1cdf6c155136b5489f3df5</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>unsigned int</type>
      <name>symmetry</name>
      <anchorfile>classmolpro_1_1gci_1_1State.html</anchorfile>
      <anchor>ab8bdd5e0561550c6f88f7ec626df745d</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>molpro::gci::String</name>
    <filename>classmolpro_1_1gci_1_1String.html</filename>
    <base>molpro::gci::State</base>
    <member kind="typedef">
      <type>uint8_t</type>
      <name>orbital_type</name>
      <anchorfile>classmolpro_1_1gci_1_1String.html</anchorfile>
      <anchor>affbfedc643ebaadb9400295eb9015416</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>size_t</type>
      <name>key_type</name>
      <anchorfile>classmolpro_1_1gci_1_1String.html</anchorfile>
      <anchor>af37d71dfcc300380121a215e02c6f269</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>String</name>
      <anchorfile>classmolpro_1_1gci_1_1String.html</anchorfile>
      <anchor>ac0fe985cc246e4ae6f64227e45e0cdd8</anchor>
      <arglist>(const State *State=nullptr, int Spin=1)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>String</name>
      <anchorfile>classmolpro_1_1gci_1_1String.html</anchorfile>
      <anchor>af05dc0de28d54ad0ccec60f2ee24a1d5</anchor>
      <arglist>(std::vector&lt; char &gt; bytestream, const State *State=nullptr)</arglist>
    </member>
    <member kind="function">
      <type>int</type>
      <name>create</name>
      <anchorfile>classmolpro_1_1gci_1_1String.html</anchorfile>
      <anchor>a9017864e82099de1664eab684ba140ad</anchor>
      <arglist>(orbital_type orbital)</arglist>
    </member>
    <member kind="function">
      <type>int</type>
      <name>destroy</name>
      <anchorfile>classmolpro_1_1gci_1_1String.html</anchorfile>
      <anchor>a6fc2acfd08d38d0d0286e396478bd57a</anchor>
      <arglist>(orbital_type orbital)</arglist>
    </member>
    <member kind="function">
      <type>bool</type>
      <name>next</name>
      <anchorfile>classmolpro_1_1gci_1_1String.html</anchorfile>
      <anchor>a727560e5927407a200bbeb86e9190729</anchor>
      <arglist>(int sym=-1)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>nullify</name>
      <anchorfile>classmolpro_1_1gci_1_1String.html</anchorfile>
      <anchor>a3f45316a866c799a18e16489bbcf436f</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>bool</type>
      <name>first</name>
      <anchorfile>classmolpro_1_1gci_1_1String.html</anchorfile>
      <anchor>afba0af0601be03934a59ed1ff425b8c6</anchor>
      <arglist>(int n=0, int sym=-1)</arglist>
    </member>
    <member kind="function">
      <type>const std::vector&lt; orbital_type &gt; &amp;</type>
      <name>orbitals</name>
      <anchorfile>classmolpro_1_1gci_1_1String.html</anchorfile>
      <anchor>a1507d13fdbf9c32c7e611039bec454ba</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>const key_type &amp;</type>
      <name>key</name>
      <anchorfile>classmolpro_1_1gci_1_1String.html</anchorfile>
      <anchor>a688f3280d32718a63b058806d3405830</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>keygen</name>
      <anchorfile>classmolpro_1_1gci_1_1String.html</anchorfile>
      <anchor>af61fb6a36c47ab68e59b85b8e7bf12b2</anchor>
      <arglist>(const std::vector&lt; std::vector&lt; T &gt;&gt; &amp;partialWeightArray)</arglist>
    </member>
    <member kind="function">
      <type>std::string</type>
      <name>str</name>
      <anchorfile>classmolpro_1_1gci_1_1String.html</anchorfile>
      <anchor>a0e7c12cace0798403098726e3d0dba35</anchor>
      <arglist>(int verbosity=0, unsigned int columns=UINT_MAX) const override</arglist>
    </member>
    <member kind="function">
      <type>unsigned int</type>
      <name>computed_symmetry</name>
      <anchorfile>classmolpro_1_1gci_1_1String.html</anchorfile>
      <anchor>af1342f9c939063bddd5c8d0b22f1bed5</anchor>
      <arglist>(bool nocheck=false) const</arglist>
    </member>
    <member kind="function">
      <type>size_t</type>
      <name>index</name>
      <anchorfile>classmolpro_1_1gci_1_1String.html</anchorfile>
      <anchor>ada106d0de224ec59329f36032ef00d82</anchor>
      <arglist>(const StringSet &amp;set) const</arglist>
    </member>
    <member kind="function">
      <type>bool</type>
      <name>operator==</name>
      <anchorfile>classmolpro_1_1gci_1_1String.html</anchorfile>
      <anchor>a283f7107c332312a8125ea2ada5c59a4</anchor>
      <arglist>(const String &amp;other) const</arglist>
    </member>
    <member kind="function">
      <type>std::vector&lt; char &gt;</type>
      <name>serialise</name>
      <anchorfile>classmolpro_1_1gci_1_1String.html</anchorfile>
      <anchor>aa4841f8fbac01411233f4dad86d8ba2b</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="variable" static="yes">
      <type>static String</type>
      <name>exhausted</name>
      <anchorfile>classmolpro_1_1gci_1_1String.html</anchorfile>
      <anchor>a27373b30a5d16db3cbd6d908a40fafa5</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" static="yes">
      <type>static key_type</type>
      <name>keyUnassigned</name>
      <anchorfile>classmolpro_1_1gci_1_1String.html</anchorfile>
      <anchor>aec60278dfe3a0352239ffa8bbf742432</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" static="yes">
      <type>static size_t</type>
      <name>StringNotFound</name>
      <anchorfile>classmolpro_1_1gci_1_1String.html</anchorfile>
      <anchor>a459279b279b1e09655995b38d53154ea</anchor>
      <arglist></arglist>
    </member>
    <member kind="friend" protection="private">
      <type>friend class</type>
      <name>ExcitationSet</name>
      <anchorfile>classmolpro_1_1gci_1_1String.html</anchorfile>
      <anchor>a513ba8c88a29bc3d5d37230035ce9055</anchor>
      <arglist></arglist>
    </member>
    <member kind="friend" protection="private">
      <type>friend class</type>
      <name>StringSet</name>
      <anchorfile>classmolpro_1_1gci_1_1String.html</anchorfile>
      <anchor>a271f976df4eb6d4791ad19f9d1499dc6</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>molpro::gci::StringSet</name>
    <filename>classmolpro_1_1gci_1_1StringSet.html</filename>
    <base>molpro::gci::Printable</base>
    <member kind="typedef">
      <type>std::unordered_map&lt; size_t, size_t &gt;</type>
      <name>t_addressMap</name>
      <anchorfile>classmolpro_1_1gci_1_1StringSet.html</anchorfile>
      <anchor>af10392aead0ada588607e380fec6fa74</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>StringSet</name>
      <anchorfile>classmolpro_1_1gci_1_1StringSet.html</anchorfile>
      <anchor>a91187d830fc59ba5f34559e03084711d</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>StringSet</name>
      <anchorfile>classmolpro_1_1gci_1_1StringSet.html</anchorfile>
      <anchor>a7c7060e6b7b8ddad2b1d63af2eea9962</anchor>
      <arglist>(const String &amp;prototype, bool all=true, int sym=-1)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>StringSet</name>
      <anchorfile>classmolpro_1_1gci_1_1StringSet.html</anchorfile>
      <anchor>ada35877814b2a6bc761d69010f0584ef</anchor>
      <arglist>(const StringSet &amp;referenceSpace, int annihilations, int creations, int sym=-1, bool parallel=false)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>StringSet</name>
      <anchorfile>classmolpro_1_1gci_1_1StringSet.html</anchorfile>
      <anchor>a5ea0fc415304d03267988b4279fb0847</anchor>
      <arglist>(const std::vector&lt; StringSet &gt; &amp;referenceSpaces, int annihilations, int creations, int sym=-1, bool parallel=false)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>complete</name>
      <anchorfile>classmolpro_1_1gci_1_1StringSet.html</anchorfile>
      <anchor>abc59d2739236aefb56e82eadbd06db11</anchor>
      <arglist>(int sym=-1)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>addByOperators</name>
      <anchorfile>classmolpro_1_1gci_1_1StringSet.html</anchorfile>
      <anchor>a26cc26b6e6e88ee5946c85d1ae474f4a</anchor>
      <arglist>(const StringSet &amp;referenceSpace, int annihilations, int creations, int sym=-1, bool parallel=false)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>addByOperators</name>
      <anchorfile>classmolpro_1_1gci_1_1StringSet.html</anchorfile>
      <anchor>a06009f2863bcfbe4fb62b17d93a53cea</anchor>
      <arglist>(const std::vector&lt; StringSet &gt; &amp;referenceSpaces, int annihilations, int creations, int sym=-1, bool parallel=false)</arglist>
    </member>
    <member kind="function">
      <type>std::vector&lt; ExcitationSet &gt;</type>
      <name>allExcitations</name>
      <anchorfile>classmolpro_1_1gci_1_1StringSet.html</anchorfile>
      <anchor>a2a1781a5d1f8e10eb85131c31e22eab2</anchor>
      <arglist>(StringSet &amp;to, int annihilations, int creations)</arglist>
    </member>
    <member kind="function">
      <type>std::vector&lt; double &gt;</type>
      <name>occupationNumbers</name>
      <anchorfile>classmolpro_1_1gci_1_1StringSet.html</anchorfile>
      <anchor>ac390f9843c31f0941932d63192f21ae0</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>insert</name>
      <anchorfile>classmolpro_1_1gci_1_1StringSet.html</anchorfile>
      <anchor>ae326b706e31c6ae6f074a181af764bcb</anchor>
      <arglist>(String &amp;s)</arglist>
    </member>
    <member kind="function">
      <type>std::vector&lt; size_t &gt;</type>
      <name>index</name>
      <anchorfile>classmolpro_1_1gci_1_1StringSet.html</anchorfile>
      <anchor>a0ceea0f84827fa4c23c4548ee8d33e7f</anchor>
      <arglist>(const StringSet &amp;set) const</arglist>
    </member>
    <member kind="function">
      <type>std::string</type>
      <name>str</name>
      <anchorfile>classmolpro_1_1gci_1_1StringSet.html</anchorfile>
      <anchor>a2d59cbe15a2f58d2cb35e26a61a3b8df</anchor>
      <arglist>(int verbosity=0, unsigned int columns=UINT_MAX) const override</arglist>
    </member>
    <member kind="variable">
      <type>std::vector&lt; std::vector&lt; int &gt; &gt;</type>
      <name>PartialWeightArray</name>
      <anchorfile>classmolpro_1_1gci_1_1StringSet.html</anchorfile>
      <anchor>a6e6f003cb50f58309ab3ab67d158cbcb</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>t_addressMap</type>
      <name>addressMap</name>
      <anchorfile>classmolpro_1_1gci_1_1StringSet.html</anchorfile>
      <anchor>a780c472ed39520789eb37caccc2f3ddc</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>int</type>
      <name>symmetry</name>
      <anchorfile>classmolpro_1_1gci_1_1StringSet.html</anchorfile>
      <anchor>a4c4d9d1949e4e13384cbb6f0837a88a8</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>String</type>
      <name>proto</name>
      <anchorfile>classmolpro_1_1gci_1_1StringSet.html</anchorfile>
      <anchor>a7d33c3d1036b6db1dd0bc3d3930ebb92</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>molpro::SMat_::SVD</name>
    <filename>classmolpro_1_1SMat___1_1SVD.html</filename>
    <member kind="function">
      <type>const SMat_ &amp;</type>
      <name>singularValues</name>
      <anchorfile>classmolpro_1_1SMat___1_1SVD.html</anchorfile>
      <anchor>a3deb518c7ade02ef24f94d7bfe6c2ac6</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>const SMat_ &amp;</type>
      <name>matrixU</name>
      <anchorfile>classmolpro_1_1SMat___1_1SVD.html</anchorfile>
      <anchor>a8a0aec77c87e6cc2945dbde84b9281fd</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>const SMat_ &amp;</type>
      <name>matrixV</name>
      <anchorfile>classmolpro_1_1SMat___1_1SVD.html</anchorfile>
      <anchor>a72055bc4aebbf0859d0e6aec2da3c0f2</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SVD</name>
      <anchorfile>classmolpro_1_1SMat___1_1SVD.html</anchorfile>
      <anchor>aa8fd3d4b0daac2b25b25e55bdb9f20d8</anchor>
      <arglist>(const SMat_ &amp;matrix, std::string algorithm=&quot;BDC&quot;, unsigned int computationOptions=Eigen::ComputeThinU|Eigen::ComputeThinV)</arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>molpro::gci::SymmetrySpace</name>
    <filename>classmolpro_1_1gci_1_1SymmetrySpace.html</filename>
    <base>molpro::gci::Printable</base>
    <member kind="function">
      <type></type>
      <name>SymmetrySpace</name>
      <anchorfile>classmolpro_1_1gci_1_1SymmetrySpace.html</anchorfile>
      <anchor>a13b23353ad015bf54ef1a8d77dff37fd</anchor>
      <arglist>(std::string title=&quot;&quot;, int maxrank=2)</arglist>
    </member>
    <member kind="function">
      <type>std::string</type>
      <name>str</name>
      <anchorfile>classmolpro_1_1gci_1_1SymmetrySpace.html</anchorfile>
      <anchor>a312e960d79c0b6b717147c4e31fd0b7a</anchor>
      <arglist>(int verbosity=0, unsigned int columns=UINT_MAX) const override</arglist>
    </member>
    <member kind="function">
      <type>size_t</type>
      <name>offset</name>
      <anchorfile>classmolpro_1_1gci_1_1SymmetrySpace.html</anchorfile>
      <anchor>a22f15b4453ea1955f11b8b8467751ea9</anchor>
      <arglist>(int sym1) const</arglist>
    </member>
    <member kind="function">
      <type>size_t</type>
      <name>offset</name>
      <anchorfile>classmolpro_1_1gci_1_1SymmetrySpace.html</anchorfile>
      <anchor>a7a5c45b4f74e0f8878455e7bb6420d84</anchor>
      <arglist>(int sym1, int sym2, int parity=0) const</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>calculateOffsets</name>
      <anchorfile>classmolpro_1_1gci_1_1SymmetrySpace.html</anchorfile>
      <anchor>a98ca7bcf12cbc431a7efdd68e0e804aa</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>size_t</type>
      <name>total</name>
      <anchorfile>classmolpro_1_1gci_1_1SymmetrySpace.html</anchorfile>
      <anchor>a3ea7716ae067a546f12f9eda2e190eb2</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>size_t</type>
      <name>total</name>
      <anchorfile>classmolpro_1_1gci_1_1SymmetrySpace.html</anchorfile>
      <anchor>a2726ba388d942567aef9b46bf8d356c2</anchor>
      <arglist>(int sym1, int parity=0) const</arglist>
    </member>
    <member kind="variable">
      <type>int</type>
      <name>maxrank</name>
      <anchorfile>classmolpro_1_1gci_1_1SymmetrySpace.html</anchorfile>
      <anchor>a3eee7258a9a9a9f8ed268699a6dcf429</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>std::string</type>
      <name>Title</name>
      <anchorfile>classmolpro_1_1gci_1_1SymmetrySpace.html</anchorfile>
      <anchor>a3df1a5e21ef1f0f6843728c3233ee768</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>molpro::gci::TransitionDensity</name>
    <filename>classmolpro_1_1gci_1_1TransitionDensity.html</filename>
    <base>molpro::gci::Printable</base>
    <member kind="function">
      <type></type>
      <name>TransitionDensity</name>
      <anchorfile>classmolpro_1_1gci_1_1TransitionDensity.html</anchorfile>
      <anchor>aa174e76a35148422749fe1ecbe890689</anchor>
      <arglist>(const Wavefunction &amp;w, const StringSet::const_iterator &amp;alphaStringsBegin, const StringSet::const_iterator &amp;alphaStringsEnd, const StringSet::const_iterator &amp;betaStringsBegin, const StringSet::const_iterator &amp;betaStringsEnd, molpro::parity_t parity, bool doAlpha=true, bool doBeta=true)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>TransitionDensity</name>
      <anchorfile>classmolpro_1_1gci_1_1TransitionDensity.html</anchorfile>
      <anchor>a16bd19b960a2fb37213c41c8ec4b4d24</anchor>
      <arglist>(const TransitionDensity &amp;source, bool copy=true)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>action</name>
      <anchorfile>classmolpro_1_1gci_1_1TransitionDensity.html</anchorfile>
      <anchor>ab2f8576b37b673cdb4a4af56a3ca566a</anchor>
      <arglist>(Wavefunction &amp;w) const</arglist>
    </member>
    <member kind="function">
      <type>molpro::Operator</type>
      <name>density</name>
      <anchorfile>classmolpro_1_1gci_1_1TransitionDensity.html</anchorfile>
      <anchor>aa820ceeee5817b7f21774b0faa9b2363</anchor>
      <arglist>(const Wavefunction &amp;w) const</arglist>
    </member>
    <member kind="function">
      <type>std::string</type>
      <name>str</name>
      <anchorfile>classmolpro_1_1gci_1_1TransitionDensity.html</anchorfile>
      <anchor>a4b37f09e1c8ddf9b595b598c88e08234</anchor>
      <arglist>(int verbosity=0, unsigned int columns=UINT_MAX) const override</arglist>
    </member>
  </compound>
  <compound kind="struct">
    <name>molpro::gci::updater</name>
    <filename>structmolpro_1_1gci_1_1updater.html</filename>
    <member kind="function">
      <type></type>
      <name>updater</name>
      <anchorfile>structmolpro_1_1gci_1_1updater.html</anchorfile>
      <anchor>a261c800fd5f6649030c7773ca5dfce64</anchor>
      <arglist>(const Wavefunction &amp;diagonals, bool subtractDiagonal)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>operator()</name>
      <anchorfile>structmolpro_1_1gci_1_1updater.html</anchorfile>
      <anchor>ae8f864768af7eedb139fdd76b7692460</anchor>
      <arglist>(ParameterVectorSet &amp;psc, const ParameterVectorSet &amp;psg, std::vector&lt; double &gt; shift=std::vector&lt; double &gt;(), bool append=false) const</arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>molpro::gci::VibExcitation</name>
    <filename>classmolpro_1_1gci_1_1VibExcitation.html</filename>
    <member kind="typedef">
      <type>std::array&lt; int, 3 &gt;</type>
      <name>exc_t</name>
      <anchorfile>classmolpro_1_1gci_1_1VibExcitation.html</anchorfile>
      <anchor>a89c7d60e641fdda5434c5b176221a4af</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>VibExcitation</name>
      <anchorfile>classmolpro_1_1gci_1_1VibExcitation.html</anchorfile>
      <anchor>aea5983c5384ad03d683483cea9ec0ff7</anchor>
      <arglist>(std::vector&lt; exc_t &gt; excs)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>conjugate</name>
      <anchorfile>classmolpro_1_1gci_1_1VibExcitation.html</anchorfile>
      <anchor>a8e87c3545d793fcb820964c5dc648e52</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="variable">
      <type>std::vector&lt; exc_t &gt;</type>
      <name>excitations</name>
      <anchorfile>classmolpro_1_1gci_1_1VibExcitation.html</anchorfile>
      <anchor>a15bbcf661aa211fd098cfa74e4b3fb37</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>int</type>
      <name>mc_lvl</name>
      <anchorfile>classmolpro_1_1gci_1_1VibExcitation.html</anchorfile>
      <anchor>a0b7002f356c626cca7c0126bb2392166</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>molpro::gci::VibOp</name>
    <filename>classmolpro_1_1gci_1_1VibOp.html</filename>
    <member kind="function">
      <type></type>
      <name>VibOp</name>
      <anchorfile>classmolpro_1_1gci_1_1VibOp.html</anchorfile>
      <anchor>a371a8caf51891f7c773b5cc1a289045e</anchor>
      <arglist>(const VibOpType &amp;type, const std::vector&lt; unsigned int &gt; &amp;mode={})</arglist>
    </member>
    <member kind="variable">
      <type>VibOpType</type>
      <name>type</name>
      <anchorfile>classmolpro_1_1gci_1_1VibOp.html</anchorfile>
      <anchor>a978e3fae6ea49c41f9eff543110711aa</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>std::vector&lt; unsigned int &gt;</type>
      <name>mode</name>
      <anchorfile>classmolpro_1_1gci_1_1VibOp.html</anchorfile>
      <anchor>a5f56d2029f2fd54a3340b851624f308f</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>molpro::gci::VibOperator</name>
    <filename>classmolpro_1_1gci_1_1VibOperator.html</filename>
    <templarg></templarg>
    <member kind="typedef">
      <type>VibTensEl&lt; Container &gt;</type>
      <name>tensor_el_t</name>
      <anchorfile>classmolpro_1_1gci_1_1VibOperator.html</anchorfile>
      <anchor>a01780b3c54e522e172e32f18188baa34</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>std::map&lt; size_t, tensor_el_t &gt;</type>
      <name>tensor_t</name>
      <anchorfile>classmolpro_1_1gci_1_1VibOperator.html</anchorfile>
      <anchor>a67b6811e2a5e38095de624f9eeeffa39</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>ns_VibOperator::parity_t</type>
      <name>parity_t</name>
      <anchorfile>classmolpro_1_1gci_1_1VibOperator.html</anchorfile>
      <anchor>a6f58ed876f1cd79f9d95b282e5899945</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>VibOperator</name>
      <anchorfile>classmolpro_1_1gci_1_1VibOperator.html</anchorfile>
      <anchor>a8787ed578b4ab62d218f711a06191187</anchor>
      <arglist>(int nMode, int nModal, parity_t hermiticity=parity_t::even, parity_t exchange=parity_t::even, std::string name_=&quot;&quot;)</arglist>
    </member>
    <member kind="function">
      <type>auto</type>
      <name>hermiticity</name>
      <anchorfile>classmolpro_1_1gci_1_1VibOperator.html</anchorfile>
      <anchor>a6f92ee96524c8cadb686130cfe2f5494</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>append</name>
      <anchorfile>classmolpro_1_1gci_1_1VibOperator.html</anchorfile>
      <anchor>afaf6d384a3906cde4bdeff914a1ea356</anchor>
      <arglist>(const Container &amp;op, const VibExcitation &amp;vibExc)</arglist>
    </member>
    <member kind="function">
      <type>Container &amp;</type>
      <name>at</name>
      <anchorfile>classmolpro_1_1gci_1_1VibOperator.html</anchorfile>
      <anchor>a304919a60bfec8d6490c2706a83344b5</anchor>
      <arglist>(const VibExcitation &amp;exc)</arglist>
    </member>
    <member kind="function">
      <type>class VibOperator &amp;</type>
      <name>operator+=</name>
      <anchorfile>classmolpro_1_1gci_1_1VibOperator.html</anchorfile>
      <anchor>a331b3815ec48ba0cb65da6ab5e5aaa91</anchor>
      <arglist>(const VibOperator&lt; Container &gt; &amp;other)</arglist>
    </member>
    <member kind="function">
      <type>class VibOperator</type>
      <name>operator+</name>
      <anchorfile>classmolpro_1_1gci_1_1VibOperator.html</anchorfile>
      <anchor>aac58aaf8e1084f0111612e4080588927</anchor>
      <arglist>(const VibOperator&lt; Container &gt; &amp;other) const</arglist>
    </member>
    <member kind="variable">
      <type>tensor_t</type>
      <name>tensor</name>
      <anchorfile>classmolpro_1_1gci_1_1VibOperator.html</anchorfile>
      <anchor>a57b439cf8a9cfbdbad149fe298451844</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>std::string</type>
      <name>name</name>
      <anchorfile>classmolpro_1_1gci_1_1VibOperator.html</anchorfile>
      <anchor>a680887aba6018070a854b16b8b2bd8d3</anchor>
      <arglist></arglist>
    </member>
    <member kind="function" protection="protected">
      <type>size_t</type>
      <name>hash</name>
      <anchorfile>classmolpro_1_1gci_1_1VibOperator.html</anchorfile>
      <anchor>a566419e41150b22fbfae722d1c6e3c73</anchor>
      <arglist>(const VibExcitation &amp;exc)</arglist>
    </member>
    <member kind="variable" protection="protected">
      <type>int</type>
      <name>m_nMode</name>
      <anchorfile>classmolpro_1_1gci_1_1VibOperator.html</anchorfile>
      <anchor>a263b399880eb5aa93ca679280790103b</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" protection="protected">
      <type>int</type>
      <name>m_nModal</name>
      <anchorfile>classmolpro_1_1gci_1_1VibOperator.html</anchorfile>
      <anchor>aadf572225745ad95000ec781e6ee01c7</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" protection="protected">
      <type>parity_t</type>
      <name>m_hermiticity</name>
      <anchorfile>classmolpro_1_1gci_1_1VibOperator.html</anchorfile>
      <anchor>aec7e561d3ad258943c20fd15aeb145db</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" protection="protected">
      <type>parity_t</type>
      <name>m_exchange</name>
      <anchorfile>classmolpro_1_1gci_1_1VibOperator.html</anchorfile>
      <anchor>a2c1ef33c8b151465fef635e3c3274313</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>VibOperator&lt; double &gt;</name>
    <filename>classmolpro_1_1gci_1_1VibOperator.html</filename>
    <member kind="typedef">
      <type>VibTensEl&lt; double &gt;</type>
      <name>tensor_el_t</name>
      <anchorfile>classmolpro_1_1gci_1_1VibOperator.html</anchorfile>
      <anchor>a01780b3c54e522e172e32f18188baa34</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>std::map&lt; size_t, tensor_el_t &gt;</type>
      <name>tensor_t</name>
      <anchorfile>classmolpro_1_1gci_1_1VibOperator.html</anchorfile>
      <anchor>a67b6811e2a5e38095de624f9eeeffa39</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>ns_VibOperator::parity_t</type>
      <name>parity_t</name>
      <anchorfile>classmolpro_1_1gci_1_1VibOperator.html</anchorfile>
      <anchor>a6f58ed876f1cd79f9d95b282e5899945</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>VibOperator</name>
      <anchorfile>classmolpro_1_1gci_1_1VibOperator.html</anchorfile>
      <anchor>a8787ed578b4ab62d218f711a06191187</anchor>
      <arglist>(int nMode, int nModal, parity_t hermiticity=parity_t::even, parity_t exchange=parity_t::even, std::string name_=&quot;&quot;)</arglist>
    </member>
    <member kind="function">
      <type>auto</type>
      <name>hermiticity</name>
      <anchorfile>classmolpro_1_1gci_1_1VibOperator.html</anchorfile>
      <anchor>a6f92ee96524c8cadb686130cfe2f5494</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>append</name>
      <anchorfile>classmolpro_1_1gci_1_1VibOperator.html</anchorfile>
      <anchor>afaf6d384a3906cde4bdeff914a1ea356</anchor>
      <arglist>(const double &amp;op, const VibExcitation &amp;vibExc)</arglist>
    </member>
    <member kind="function">
      <type>double &amp;</type>
      <name>at</name>
      <anchorfile>classmolpro_1_1gci_1_1VibOperator.html</anchorfile>
      <anchor>a304919a60bfec8d6490c2706a83344b5</anchor>
      <arglist>(const VibExcitation &amp;exc)</arglist>
    </member>
    <member kind="function">
      <type>class VibOperator &amp;</type>
      <name>operator+=</name>
      <anchorfile>classmolpro_1_1gci_1_1VibOperator.html</anchorfile>
      <anchor>a331b3815ec48ba0cb65da6ab5e5aaa91</anchor>
      <arglist>(const VibOperator&lt; double &gt; &amp;other)</arglist>
    </member>
    <member kind="function">
      <type>class VibOperator</type>
      <name>operator+</name>
      <anchorfile>classmolpro_1_1gci_1_1VibOperator.html</anchorfile>
      <anchor>aac58aaf8e1084f0111612e4080588927</anchor>
      <arglist>(const VibOperator&lt; double &gt; &amp;other) const</arglist>
    </member>
    <member kind="variable">
      <type>tensor_t</type>
      <name>tensor</name>
      <anchorfile>classmolpro_1_1gci_1_1VibOperator.html</anchorfile>
      <anchor>a57b439cf8a9cfbdbad149fe298451844</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>std::string</type>
      <name>name</name>
      <anchorfile>classmolpro_1_1gci_1_1VibOperator.html</anchorfile>
      <anchor>a680887aba6018070a854b16b8b2bd8d3</anchor>
      <arglist></arglist>
    </member>
    <member kind="function" protection="protected">
      <type>size_t</type>
      <name>hash</name>
      <anchorfile>classmolpro_1_1gci_1_1VibOperator.html</anchorfile>
      <anchor>a566419e41150b22fbfae722d1c6e3c73</anchor>
      <arglist>(const VibExcitation &amp;exc)</arglist>
    </member>
    <member kind="variable" protection="protected">
      <type>int</type>
      <name>m_nMode</name>
      <anchorfile>classmolpro_1_1gci_1_1VibOperator.html</anchorfile>
      <anchor>a263b399880eb5aa93ca679280790103b</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" protection="protected">
      <type>int</type>
      <name>m_nModal</name>
      <anchorfile>classmolpro_1_1gci_1_1VibOperator.html</anchorfile>
      <anchor>aadf572225745ad95000ec781e6ee01c7</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" protection="protected">
      <type>parity_t</type>
      <name>m_hermiticity</name>
      <anchorfile>classmolpro_1_1gci_1_1VibOperator.html</anchorfile>
      <anchor>aec7e561d3ad258943c20fd15aeb145db</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" protection="protected">
      <type>parity_t</type>
      <name>m_exchange</name>
      <anchorfile>classmolpro_1_1gci_1_1VibOperator.html</anchorfile>
      <anchor>a2c1ef33c8b151465fef635e3c3274313</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="struct">
    <name>molpro::gci::VibSpace</name>
    <filename>structmolpro_1_1gci_1_1VibSpace.html</filename>
    <member kind="function">
      <type></type>
      <name>VibSpace</name>
      <anchorfile>structmolpro_1_1gci_1_1VibSpace.html</anchorfile>
      <anchor>a2b59d89f04b9c99eb83d3ad082f26aa2</anchor>
      <arglist>(int mode, int modal, int excLevel)</arglist>
    </member>
    <member kind="function">
      <type>bool</type>
      <name>operator==</name>
      <anchorfile>structmolpro_1_1gci_1_1VibSpace.html</anchorfile>
      <anchor>a616a084aed1f73de0b3392afcb37b6b1</anchor>
      <arglist>(const VibSpace &amp;other) const</arglist>
    </member>
    <member kind="variable">
      <type>int</type>
      <name>nMode</name>
      <anchorfile>structmolpro_1_1gci_1_1VibSpace.html</anchorfile>
      <anchor>a7adbf1622a550ba3dd301d43bcd0d212</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>int</type>
      <name>nModal</name>
      <anchorfile>structmolpro_1_1gci_1_1VibSpace.html</anchorfile>
      <anchor>a4f989edc4852b9d564dc486d545a61b8</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>int</type>
      <name>excLvl</name>
      <anchorfile>structmolpro_1_1gci_1_1VibSpace.html</anchorfile>
      <anchor>a559676be97659fdcc73b4b9d9e3d8389</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>molpro::gci::VibTensEl</name>
    <filename>classmolpro_1_1gci_1_1VibTensEl.html</filename>
    <templarg></templarg>
    <member kind="typedef">
      <type>ns_VibOperator::parity_t</type>
      <name>parity_t</name>
      <anchorfile>classmolpro_1_1gci_1_1VibTensEl.html</anchorfile>
      <anchor>aba11265ddb18081b621197acbbd129d4</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>VibTensEl</name>
      <anchorfile>classmolpro_1_1gci_1_1VibTensEl.html</anchorfile>
      <anchor>ac4a75bd0ee8c0a5b114115a0e7eea66d</anchor>
      <arglist>(const Container &amp;op, VibExcitation vibExc, parity_t hermiticity, parity_t exchange)</arglist>
    </member>
    <member kind="function">
      <type>auto</type>
      <name>hermiticity</name>
      <anchorfile>classmolpro_1_1gci_1_1VibTensEl.html</anchorfile>
      <anchor>a00a3c76885a17056ae5191ffc5f16186</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>VibTensEl</type>
      <name>conjugate</name>
      <anchorfile>classmolpro_1_1gci_1_1VibTensEl.html</anchorfile>
      <anchor>a2440ff19a1cec8e7ff0280675c67d691</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="variable">
      <type>Container</type>
      <name>oper</name>
      <anchorfile>classmolpro_1_1gci_1_1VibTensEl.html</anchorfile>
      <anchor>afbe980c53837c58ab72f84a4368a7e8e</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>VibExcitation</type>
      <name>exc</name>
      <anchorfile>classmolpro_1_1gci_1_1VibTensEl.html</anchorfile>
      <anchor>aca84bbd589c183c7d55d162aff15cace</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" protection="protected">
      <type>parity_t</type>
      <name>m_hermiticity</name>
      <anchorfile>classmolpro_1_1gci_1_1VibTensEl.html</anchorfile>
      <anchor>a26544169c972e648b5fa727c98e0f403</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" protection="protected">
      <type>parity_t</type>
      <name>m_exchange</name>
      <anchorfile>classmolpro_1_1gci_1_1VibTensEl.html</anchorfile>
      <anchor>ad4fdcbc3489f060c82b805b411d234ac</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>molpro::gci::Wavefunction</name>
    <filename>classmolpro_1_1gci_1_1Wavefunction.html</filename>
    <base>molpro::gci::State</base>
    <member kind="typedef">
      <type>double</type>
      <name>value_type</name>
      <anchorfile>classmolpro_1_1gci_1_1Wavefunction.html</anchorfile>
      <anchor>ae43a6d387aa8c128b7adcc97350b22a9</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>double</type>
      <name>mapped_type</name>
      <anchorfile>classmolpro_1_1gci_1_1Wavefunction.html</anchorfile>
      <anchor>a989f1d36a56baccf2287964fb5655a4c</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>Wavefunction</name>
      <anchorfile>classmolpro_1_1gci_1_1Wavefunction.html</anchorfile>
      <anchor>ae5e7dfab0ce3ba95165c99ae9786e456</anchor>
      <arglist>(OrbitalSpace h, int nelec, int symmetry, int ms2, MPI_Comm communicator=mpi_comm_compute)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>Wavefunction</name>
      <anchorfile>classmolpro_1_1gci_1_1Wavefunction.html</anchorfile>
      <anchor>a23a9da0538bda1ca9dd8ed1221cad25d</anchor>
      <arglist>(OrbitalSpace *h, int nelec, int symmetry, int ms2, MPI_Comm communicator=mpi_comm_compute)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>Wavefunction</name>
      <anchorfile>classmolpro_1_1gci_1_1Wavefunction.html</anchorfile>
      <anchor>ae4cf6faa2f81d6ddc638248720cbd110</anchor>
      <arglist>(const State &amp;state, MPI_Comm communicator=mpi_comm_compute)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>Wavefunction</name>
      <anchorfile>classmolpro_1_1gci_1_1Wavefunction.html</anchorfile>
      <anchor>adc2868b5961ab5b168a7e49e2620535f</anchor>
      <arglist>(const Wavefunction &amp;source, int option, MPI_Comm communicator=MPI_COMM_NULL)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>Wavefunction</name>
      <anchorfile>classmolpro_1_1gci_1_1Wavefunction.html</anchorfile>
      <anchor>a413f880bbf744a0b4d5962d48203ee70</anchor>
      <arglist>(const Wavefunction &amp;source)</arglist>
    </member>
    <member kind="function">
      <type>Wavefunction &amp;</type>
      <name>operator=</name>
      <anchorfile>classmolpro_1_1gci_1_1Wavefunction.html</anchorfile>
      <anchor>a7a1fea205fe5c62e25dc8f1a82eea79f</anchor>
      <arglist>(const Wavefunction &amp;source)</arglist>
    </member>
    <member kind="function">
      <type>Wavefunction &amp;</type>
      <name>operator=</name>
      <anchorfile>classmolpro_1_1gci_1_1Wavefunction.html</anchorfile>
      <anchor>a9edff34591d39dbdfbb41efd54a1c4e9</anchor>
      <arglist>(const std::map&lt; size_t, double &gt; &amp;source)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>allocate_buffer</name>
      <anchorfile>classmolpro_1_1gci_1_1Wavefunction.html</anchorfile>
      <anchor>aa55ad453cde40f31a597351b85e90e2c</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>size_t</type>
      <name>size</name>
      <anchorfile>classmolpro_1_1gci_1_1Wavefunction.html</anchorfile>
      <anchor>ac68665a83e478d66beb6affa4adc70c5</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>diagonalOperator</name>
      <anchorfile>classmolpro_1_1gci_1_1Wavefunction.html</anchorfile>
      <anchor>ad77225c1375a2b6fd1a844507ca15f93</anchor>
      <arglist>(const molpro::Operator &amp;op)</arglist>
    </member>
    <member kind="function">
      <type>size_t</type>
      <name>minloc</name>
      <anchorfile>classmolpro_1_1gci_1_1Wavefunction.html</anchorfile>
      <anchor>a8ab2ef311e9ea3b35c8160c03b6a21b3</anchor>
      <arglist>(size_t n=1) const</arglist>
    </member>
    <member kind="function">
      <type>std::vector&lt; size_t &gt;</type>
      <name>minlocN</name>
      <anchorfile>classmolpro_1_1gci_1_1Wavefunction.html</anchorfile>
      <anchor>aacf43569fbde4151419ebd833c20a8a3</anchor>
      <arglist>(size_t n=1) const</arglist>
    </member>
    <member kind="function">
      <type>double</type>
      <name>at</name>
      <anchorfile>classmolpro_1_1gci_1_1Wavefunction.html</anchorfile>
      <anchor>a32640d452426d282c0a871c95b8f5182</anchor>
      <arglist>(size_t offset) const</arglist>
    </member>
    <member kind="function">
      <type>Determinant</type>
      <name>determinantAt</name>
      <anchorfile>classmolpro_1_1gci_1_1Wavefunction.html</anchorfile>
      <anchor>a5b133d2342afad9278ba56fb0296132a</anchor>
      <arglist>(size_t offset) const</arglist>
    </member>
    <member kind="function">
      <type>size_t</type>
      <name>stringAddress</name>
      <anchorfile>classmolpro_1_1gci_1_1Wavefunction.html</anchorfile>
      <anchor>a6c32b7a458839bb75728fe93716b5a48</anchor>
      <arglist>(size_t offset, unsigned int axis) const</arglist>
    </member>
    <member kind="function">
      <type>size_t</type>
      <name>stringSymmetry</name>
      <anchorfile>classmolpro_1_1gci_1_1Wavefunction.html</anchorfile>
      <anchor>ae2e716dad7fcff5c57f59c4ae4e3e373</anchor>
      <arglist>(size_t offset, unsigned int axis) const</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>operatorOnWavefunction</name>
      <anchorfile>classmolpro_1_1gci_1_1Wavefunction.html</anchorfile>
      <anchor>ad97fadcc5304ae9d4ae502638750ffaf</anchor>
      <arglist>(const molpro::Operator &amp;h, const Wavefunction &amp;w, bool parallel_stringset=false)</arglist>
    </member>
    <member kind="function">
      <type>molpro::Operator</type>
      <name>density</name>
      <anchorfile>classmolpro_1_1gci_1_1Wavefunction.html</anchorfile>
      <anchor>a3e07ee7c4db85cbfcbe14c2c7d6682d6</anchor>
      <arglist>(int rank=2, bool uhf=false, bool hermitian=true, const Wavefunction *bra=nullptr, std::string description=&quot;&quot;, bool parallel_stringset=false) const</arglist>
    </member>
    <member kind="function">
      <type>Orbitals</type>
      <name>naturalOrbitals</name>
      <anchorfile>classmolpro_1_1gci_1_1Wavefunction.html</anchorfile>
      <anchor>aef833704915394c4c7bcd3f8d0ed2a7a</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>size_t</type>
      <name>blockOffset</name>
      <anchorfile>classmolpro_1_1gci_1_1Wavefunction.html</anchorfile>
      <anchor>a5c7514e7eee0bf1b67ad725270ad9b30</anchor>
      <arglist>(unsigned int syma) const</arglist>
    </member>
    <member kind="function">
      <type>std::string</type>
      <name>str</name>
      <anchorfile>classmolpro_1_1gci_1_1Wavefunction.html</anchorfile>
      <anchor>a8cde9e41107c08be18556ea1731af061</anchor>
      <arglist>(int verbosity=0, unsigned int columns=UINT_MAX) const override</arglist>
    </member>
    <member kind="function">
      <type>std::string</type>
      <name>values</name>
      <anchorfile>classmolpro_1_1gci_1_1Wavefunction.html</anchorfile>
      <anchor>a06fd495c04faad2c076fb4fbf9ff1c0a</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>axpy</name>
      <anchorfile>classmolpro_1_1gci_1_1Wavefunction.html</anchorfile>
      <anchor>a50be09514db95597e91ae2c8087c331a</anchor>
      <arglist>(double a, const Wavefunction &amp;x)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>axpy</name>
      <anchorfile>classmolpro_1_1gci_1_1Wavefunction.html</anchorfile>
      <anchor>a78e464027f17ea3566e2fd9854531390</anchor>
      <arglist>(double a, const std::shared_ptr&lt; Wavefunction &gt; &amp;x)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>axpy</name>
      <anchorfile>classmolpro_1_1gci_1_1Wavefunction.html</anchorfile>
      <anchor>a1c86f743c332711bbba5e49cd40cf354</anchor>
      <arglist>(double a, const std::map&lt; size_t, double &gt; &amp;x)</arglist>
    </member>
    <member kind="function">
      <type>std::tuple&lt; std::vector&lt; size_t &gt;, std::vector&lt; double &gt; &gt;</type>
      <name>select</name>
      <anchorfile>classmolpro_1_1gci_1_1Wavefunction.html</anchorfile>
      <anchor>ad79f6e92a9ac3b6e04f4433d3682002a</anchor>
      <arglist>(const Wavefunction &amp;measure, const size_t maximumNumber=1000, const double threshold=0) const</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>scal</name>
      <anchorfile>classmolpro_1_1gci_1_1Wavefunction.html</anchorfile>
      <anchor>a9fd05f40ed9f53a9f4a182f76d37cad2</anchor>
      <arglist>(double a)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>fill</name>
      <anchorfile>classmolpro_1_1gci_1_1Wavefunction.html</anchorfile>
      <anchor>a3281454add2adfc7a61d3b46e190c85d</anchor>
      <arglist>(double a)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>putw</name>
      <anchorfile>classmolpro_1_1gci_1_1Wavefunction.html</anchorfile>
      <anchor>a329632cd6e05dd4a3418eb806329a8cd</anchor>
      <arglist>(File &amp;f, int index=0)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>getw</name>
      <anchorfile>classmolpro_1_1gci_1_1Wavefunction.html</anchorfile>
      <anchor>aeb126d055d4e8bde30fb4266786bb034</anchor>
      <arglist>(File &amp;f, int index=0)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>getAll</name>
      <anchorfile>classmolpro_1_1gci_1_1Wavefunction.html</anchorfile>
      <anchor>a42fc9976c5fdc1ae9b2b22668f46b59b</anchor>
      <arglist>(File &amp;f, int index=0)</arglist>
    </member>
    <member kind="function">
      <type>std::vector&lt; std::size_t &gt;</type>
      <name>histogram</name>
      <anchorfile>classmolpro_1_1gci_1_1Wavefunction.html</anchorfile>
      <anchor>aa4e8af1c5a2e6dea93803c4bc1e49f1a</anchor>
      <arglist>(const std::vector&lt; double &gt; &amp;edges, bool parallel=true, std::size_t start=0, std::size_t stop=(size_t)(-1))</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>replicate</name>
      <anchorfile>classmolpro_1_1gci_1_1Wavefunction.html</anchorfile>
      <anchor>a774a44baddb662e1fbc70f4fed38c6d1</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>set</name>
      <anchorfile>classmolpro_1_1gci_1_1Wavefunction.html</anchorfile>
      <anchor>a159c842fd607c883b2cb28e030e31c9f</anchor>
      <arglist>(size_t offset, double val)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>set</name>
      <anchorfile>classmolpro_1_1gci_1_1Wavefunction.html</anchorfile>
      <anchor>ae2c70b44a518d9597a9dfa808d506e28</anchor>
      <arglist>(const double val)</arglist>
    </member>
    <member kind="function">
      <type>Wavefunction &amp;</type>
      <name>operator*=</name>
      <anchorfile>classmolpro_1_1gci_1_1Wavefunction.html</anchorfile>
      <anchor>aac594622bd9b8d1674ea62fbf81d750d</anchor>
      <arglist>(const double &amp;value)</arglist>
    </member>
    <member kind="function">
      <type>Wavefunction &amp;</type>
      <name>operator+=</name>
      <anchorfile>classmolpro_1_1gci_1_1Wavefunction.html</anchorfile>
      <anchor>aebe9351a66fda144b42c321130810625</anchor>
      <arglist>(const Wavefunction &amp;other)</arglist>
    </member>
    <member kind="function">
      <type>Wavefunction &amp;</type>
      <name>operator-=</name>
      <anchorfile>classmolpro_1_1gci_1_1Wavefunction.html</anchorfile>
      <anchor>a53d851ba7318b503afc6455246e79d3d</anchor>
      <arglist>(const Wavefunction &amp;other)</arglist>
    </member>
    <member kind="function">
      <type>Wavefunction &amp;</type>
      <name>operator+=</name>
      <anchorfile>classmolpro_1_1gci_1_1Wavefunction.html</anchorfile>
      <anchor>aa2a0afa778147a9647fcb9464f1a74c2</anchor>
      <arglist>(double)</arglist>
    </member>
    <member kind="function">
      <type>Wavefunction &amp;</type>
      <name>operator-=</name>
      <anchorfile>classmolpro_1_1gci_1_1Wavefunction.html</anchorfile>
      <anchor>a6d3f0cb851c49657668f83e075010ecb</anchor>
      <arglist>(double)</arglist>
    </member>
    <member kind="function">
      <type>Wavefunction &amp;</type>
      <name>operator-</name>
      <anchorfile>classmolpro_1_1gci_1_1Wavefunction.html</anchorfile>
      <anchor>a21a0b3dd6f6f203c402d58f88fcba726</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>Wavefunction &amp;</type>
      <name>operator/=</name>
      <anchorfile>classmolpro_1_1gci_1_1Wavefunction.html</anchorfile>
      <anchor>ad385c3ab3d02e4750101087ba32d3a5e</anchor>
      <arglist>(const Wavefunction &amp;other)</arglist>
    </member>
    <member kind="function">
      <type>double</type>
      <name>update</name>
      <anchorfile>classmolpro_1_1gci_1_1Wavefunction.html</anchorfile>
      <anchor>a185cffd975ee62bab7c17dfcbe59900e</anchor>
      <arglist>(const Wavefunction &amp;diagonalH, double &amp;eTruncated, const double dEmax=(double) 0)</arglist>
    </member>
    <member kind="function">
      <type>double</type>
      <name>norm</name>
      <anchorfile>classmolpro_1_1gci_1_1Wavefunction.html</anchorfile>
      <anchor>a07d9ed1798e34a3f30a7d88bfe814998</anchor>
      <arglist>(double k=2)</arglist>
    </member>
    <member kind="function">
      <type>Wavefunction &amp;</type>
      <name>addAbsPower</name>
      <anchorfile>classmolpro_1_1gci_1_1Wavefunction.html</anchorfile>
      <anchor>a6a45c2d9609a6cf307baaa368c74e652</anchor>
      <arglist>(const Wavefunction &amp;c, double k=0, double factor=1)</arglist>
    </member>
    <member kind="function">
      <type>double</type>
      <name>dot</name>
      <anchorfile>classmolpro_1_1gci_1_1Wavefunction.html</anchorfile>
      <anchor>a4f5a8fcba1ba87bd841ea55a614ecd91</anchor>
      <arglist>(const Wavefunction &amp;other) const</arglist>
    </member>
    <member kind="function">
      <type>double</type>
      <name>dot</name>
      <anchorfile>classmolpro_1_1gci_1_1Wavefunction.html</anchorfile>
      <anchor>ab8cbe640132f3703442c3e69e0abcbaf</anchor>
      <arglist>(const std::shared_ptr&lt; Wavefunction &gt; other) const</arglist>
    </member>
    <member kind="function">
      <type>double</type>
      <name>dot</name>
      <anchorfile>classmolpro_1_1gci_1_1Wavefunction.html</anchorfile>
      <anchor>a171d10dd92f16d9ea77bebc267376d84</anchor>
      <arglist>(const std::unique_ptr&lt; Wavefunction &gt; other) const</arglist>
    </member>
    <member kind="function">
      <type>double</type>
      <name>dot</name>
      <anchorfile>classmolpro_1_1gci_1_1Wavefunction.html</anchorfile>
      <anchor>a70c19dfb4a882e335549dfe80421b6b6</anchor>
      <arglist>(const std::map&lt; size_t, double &gt; &amp;other) const</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>times</name>
      <anchorfile>classmolpro_1_1gci_1_1Wavefunction.html</anchorfile>
      <anchor>a1a3aa4b4c3e51df043a6d14ff71c9f42</anchor>
      <arglist>(const Wavefunction *a, const Wavefunction *b)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>divide</name>
      <anchorfile>classmolpro_1_1gci_1_1Wavefunction.html</anchorfile>
      <anchor>a4f9ff0cba0850b80223d1c4d62767526</anchor>
      <arglist>(const Wavefunction *a, const Wavefunction *b, double shift=0, bool append=false, bool negative=false)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>zero</name>
      <anchorfile>classmolpro_1_1gci_1_1Wavefunction.html</anchorfile>
      <anchor>a146ab167a0f604b053a3df4d73144f59</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>settilesize</name>
      <anchorfile>classmolpro_1_1gci_1_1Wavefunction.html</anchorfile>
      <anchor>abffa7671753707c253bbebcd1d8333a3</anchor>
      <arglist>(int t=-1, int a=-1, int b=-1)</arglist>
    </member>
    <member kind="function">
      <type>std::vector&lt; StringSet &gt;</type>
      <name>activeStrings</name>
      <anchorfile>classmolpro_1_1gci_1_1Wavefunction.html</anchorfile>
      <anchor>ad2a866e65e45e14ea69bad68df9daaac</anchor>
      <arglist>(bool spinUp=true) const</arglist>
    </member>
    <member kind="function">
      <type>bool</type>
      <name>compatible</name>
      <anchorfile>classmolpro_1_1gci_1_1Wavefunction.html</anchorfile>
      <anchor>a84ce6961c68ea80e957443b0377ed42c</anchor>
      <arglist>(const Wavefunction &amp;other) const</arglist>
    </member>
    <member kind="variable">
      <type>std::map&lt; std::string, double &gt;</type>
      <name>m_properties</name>
      <anchorfile>classmolpro_1_1gci_1_1Wavefunction.html</anchorfile>
      <anchor>ab9574d72f1b8233e066a677a555ded11</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>std::map&lt; size_t, double &gt;</type>
      <name>buffer_sparse</name>
      <anchorfile>classmolpro_1_1gci_1_1Wavefunction.html</anchorfile>
      <anchor>a6462d500fbc0881035691f2b45ca7572</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>bool</type>
      <name>m_sparse</name>
      <anchorfile>classmolpro_1_1gci_1_1Wavefunction.html</anchorfile>
      <anchor>a7c957cb1142fc43ccd67d9799cc68ecc</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>MPI_Comm</type>
      <name>m_communicator</name>
      <anchorfile>classmolpro_1_1gci_1_1Wavefunction.html</anchorfile>
      <anchor>a68b9fcfa75749f8a0563fdc9384d7f4d</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>int</type>
      <name>m_parallel_size</name>
      <anchorfile>classmolpro_1_1gci_1_1Wavefunction.html</anchorfile>
      <anchor>a95ea0172a1c7c738576d62394a724e5c</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>int</type>
      <name>m_parallel_rank</name>
      <anchorfile>classmolpro_1_1gci_1_1Wavefunction.html</anchorfile>
      <anchor>a82294841c5983beffe3ef08a9093922d</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>molpro::vector&lt; double &gt;</type>
      <name>buffer</name>
      <anchorfile>classmolpro_1_1gci_1_1Wavefunction.html</anchorfile>
      <anchor>ad8daf1a1a86645dc29b99e6931335977</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>std::unique_ptr&lt; molpro::linalg::array::DistrArrayMPI3 &gt;</type>
      <name>distr_buffer</name>
      <anchorfile>classmolpro_1_1gci_1_1Wavefunction.html</anchorfile>
      <anchor>a94c6649e774f8e349d7ce7be25d2e05d</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>std::vector&lt; StringSet &gt;</type>
      <name>alphaStrings</name>
      <anchorfile>classmolpro_1_1gci_1_1Wavefunction.html</anchorfile>
      <anchor>aaa02fad12c3c849b2bb55b97d810b127</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>std::vector&lt; StringSet &gt;</type>
      <name>betaStrings</name>
      <anchorfile>classmolpro_1_1gci_1_1Wavefunction.html</anchorfile>
      <anchor>a5631374c5370b9e43d19ef741a25b153</anchor>
      <arglist></arglist>
    </member>
    <member kind="function" protection="protected">
      <type>void</type>
      <name>buildStrings</name>
      <anchorfile>classmolpro_1_1gci_1_1Wavefunction.html</anchorfile>
      <anchor>a104d07473d5b43dfa39fa136c754ff6a</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function" protection="protected">
      <type>molpro::vector&lt; double &gt;::iterator</type>
      <name>begin</name>
      <anchorfile>classmolpro_1_1gci_1_1Wavefunction.html</anchorfile>
      <anchor>a536184975f3fc1afbe9e52fc2bfec5bc</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function" protection="protected">
      <type>molpro::vector&lt; double &gt;::iterator</type>
      <name>end</name>
      <anchorfile>classmolpro_1_1gci_1_1Wavefunction.html</anchorfile>
      <anchor>a1e94eba8039f87686c739194cc15466a</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function" protection="protected">
      <type>molpro::vector&lt; double &gt;::const_iterator</type>
      <name>cbegin</name>
      <anchorfile>classmolpro_1_1gci_1_1Wavefunction.html</anchorfile>
      <anchor>a3e02c8ecb11ddf366868507a57953c81</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function" protection="protected">
      <type>molpro::vector&lt; double &gt;::const_iterator</type>
      <name>cend</name>
      <anchorfile>classmolpro_1_1gci_1_1Wavefunction.html</anchorfile>
      <anchor>a270bfc82a6b9174191eb5e7f90820516</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="variable" protection="protected">
      <type>size_t</type>
      <name>dimension</name>
      <anchorfile>classmolpro_1_1gci_1_1Wavefunction.html</anchorfile>
      <anchor>a638a58abc71883e855990b7fafe4f8af</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" protection="protected">
      <type>std::vector&lt; size_t &gt;</type>
      <name>_blockOffset</name>
      <anchorfile>classmolpro_1_1gci_1_1Wavefunction.html</anchorfile>
      <anchor>a7b3f9b90d863af841473ef1d9672c483</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" protection="protected">
      <type>int</type>
      <name>m_tilesize</name>
      <anchorfile>classmolpro_1_1gci_1_1Wavefunction.html</anchorfile>
      <anchor>af226b8cd5e2f7a6374cbc2c0587aa61d</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" protection="protected">
      <type>int</type>
      <name>m_alphatilesize</name>
      <anchorfile>classmolpro_1_1gci_1_1Wavefunction.html</anchorfile>
      <anchor>a9307dc688db6bdaa410b0ab362719557</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" protection="protected">
      <type>int</type>
      <name>m_betatilesize</name>
      <anchorfile>classmolpro_1_1gci_1_1Wavefunction.html</anchorfile>
      <anchor>aa691181015303a5d1ec2d3a4a3d9075b</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" protection="protected" static="yes">
      <type>static constexpr double</type>
      <name>m_activeStringTolerance</name>
      <anchorfile>classmolpro_1_1gci_1_1Wavefunction.html</anchorfile>
      <anchor>adc680e096db6722a8680fff1953909d6</anchor>
      <arglist></arglist>
    </member>
    <member kind="friend" protection="private">
      <type>friend class</type>
      <name>TransitionDensity</name>
      <anchorfile>classmolpro_1_1gci_1_1Wavefunction.html</anchorfile>
      <anchor>acc34a58a6938e99ad8f27c6bf0a63d42</anchor>
      <arglist></arglist>
    </member>
    <member kind="friend" protection="private">
      <type>friend class</type>
      <name>MixedWavefunction</name>
      <anchorfile>classmolpro_1_1gci_1_1Wavefunction.html</anchorfile>
      <anchor>a00d4f583fc1557c24500e7823507f02c</anchor>
      <arglist></arglist>
    </member>
    <member kind="friend">
      <type>friend double</type>
      <name>operator*</name>
      <anchorfile>classmolpro_1_1gci_1_1Wavefunction.html</anchorfile>
      <anchor>ad7a897ee5469a6c639bcdbcebc7a9001</anchor>
      <arglist>(const Wavefunction &amp;w1, const Wavefunction &amp;w2)</arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>molpro::gci::wavefunction::WavefunctionHandler</name>
    <filename>classmolpro_1_1gci_1_1wavefunction_1_1WavefunctionHandler.html</filename>
    <templarg></templarg>
    <templarg></templarg>
    <member kind="function">
      <type>ProxyHandle</type>
      <name>lazy_handle</name>
      <anchorfile>classmolpro_1_1gci_1_1wavefunction_1_1WavefunctionHandler.html</anchorfile>
      <anchor>a864ec4aec169f244a9c3667f0b668bbc</anchor>
      <arglist>() override</arglist>
    </member>
    <member kind="function">
      <type>AL</type>
      <name>copy</name>
      <anchorfile>classmolpro_1_1gci_1_1wavefunction_1_1WavefunctionHandler.html</anchorfile>
      <anchor>a4986c436795d36f02a7fc57423d5adde</anchor>
      <arglist>(const AR &amp;source) override</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>copy</name>
      <anchorfile>classmolpro_1_1gci_1_1wavefunction_1_1WavefunctionHandler.html</anchorfile>
      <anchor>af3356d44edea2d0662d2fc0c51c0e2e7</anchor>
      <arglist>(AL &amp;x, const AR &amp;y) override</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>scal</name>
      <anchorfile>classmolpro_1_1gci_1_1wavefunction_1_1WavefunctionHandler.html</anchorfile>
      <anchor>a7f8857b601c83b54f330e2f5166a0d9b</anchor>
      <arglist>(value_type alpha, AL &amp;x) override</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>fill</name>
      <anchorfile>classmolpro_1_1gci_1_1wavefunction_1_1WavefunctionHandler.html</anchorfile>
      <anchor>a3b42db38896c5e2e1acecb766c22a114</anchor>
      <arglist>(value_type alpha, AL &amp;x) override</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>axpy</name>
      <anchorfile>classmolpro_1_1gci_1_1wavefunction_1_1WavefunctionHandler.html</anchorfile>
      <anchor>acdbc4056e5636e1a843eb7f7a1c407db</anchor>
      <arglist>(value_type alpha, const AR &amp;x, AL &amp;y) override</arglist>
    </member>
    <member kind="function">
      <type>value_type</type>
      <name>dot</name>
      <anchorfile>classmolpro_1_1gci_1_1wavefunction_1_1WavefunctionHandler.html</anchorfile>
      <anchor>a4b552d76d367f420b028eef6e44747d0</anchor>
      <arglist>(const AL &amp;x, const AR &amp;y) override</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>gemm_outer</name>
      <anchorfile>classmolpro_1_1gci_1_1wavefunction_1_1WavefunctionHandler.html</anchorfile>
      <anchor>a3edd034ba09fac0d44b6187c7d3d1e86</anchor>
      <arglist>(const Matrix&lt; value_type &gt; alphas, const CVecRef&lt; AR &gt; &amp;xx, const VecRef&lt; AL &gt; &amp;yy) override</arglist>
    </member>
    <member kind="function">
      <type>Matrix&lt; value_type &gt;</type>
      <name>gemm_inner</name>
      <anchorfile>classmolpro_1_1gci_1_1wavefunction_1_1WavefunctionHandler.html</anchorfile>
      <anchor>af7d40e6ca3a9b1657a83a2836e9c6b80</anchor>
      <arglist>(const CVecRef&lt; AL &gt; &amp;xx, const CVecRef&lt; AR &gt; &amp;yy) override</arglist>
    </member>
    <member kind="function">
      <type>std::map&lt; size_t, value_type_abs &gt;</type>
      <name>select_max_dot</name>
      <anchorfile>classmolpro_1_1gci_1_1wavefunction_1_1WavefunctionHandler.html</anchorfile>
      <anchor>a924a451e95f366a7c558d2a2967c6765</anchor>
      <arglist>(size_t n, const AL &amp;x, const AR &amp;y) override</arglist>
    </member>
    <member kind="function">
      <type>std::map&lt; size_t, value_type &gt;</type>
      <name>select</name>
      <anchorfile>classmolpro_1_1gci_1_1wavefunction_1_1WavefunctionHandler.html</anchorfile>
      <anchor>a0cf446f0b4491f4d7679593a783eb236</anchor>
      <arglist>(size_t n, const AL &amp;x, bool max=false, bool ignore_sign=false) override</arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>molpro::gci::wavefunction::WavefunctionHandlerSparse</name>
    <filename>classmolpro_1_1gci_1_1wavefunction_1_1WavefunctionHandlerSparse.html</filename>
    <templarg></templarg>
    <templarg></templarg>
    <member kind="function">
      <type>ProxyHandle</type>
      <name>lazy_handle</name>
      <anchorfile>classmolpro_1_1gci_1_1wavefunction_1_1WavefunctionHandlerSparse.html</anchorfile>
      <anchor>a55d967e6da0f9c23845fac4825605b38</anchor>
      <arglist>() override</arglist>
    </member>
    <member kind="function">
      <type>AL</type>
      <name>copy</name>
      <anchorfile>classmolpro_1_1gci_1_1wavefunction_1_1WavefunctionHandlerSparse.html</anchorfile>
      <anchor>abc4bae73be074f56bd7730c38ed8eeb3</anchor>
      <arglist>(const AR &amp;source) override</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>copy</name>
      <anchorfile>classmolpro_1_1gci_1_1wavefunction_1_1WavefunctionHandlerSparse.html</anchorfile>
      <anchor>a88b06c47462f6f9a07e985fd8d2aae37</anchor>
      <arglist>(AL &amp;x, const AR &amp;y) override</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>scal</name>
      <anchorfile>classmolpro_1_1gci_1_1wavefunction_1_1WavefunctionHandlerSparse.html</anchorfile>
      <anchor>a85232b510da8eb5fafae6209c25eb841</anchor>
      <arglist>(value_type alpha, AL &amp;x) override</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>fill</name>
      <anchorfile>classmolpro_1_1gci_1_1wavefunction_1_1WavefunctionHandlerSparse.html</anchorfile>
      <anchor>af25ca33cdd1a9114a8f271364fc62eeb</anchor>
      <arglist>(value_type alpha, AL &amp;x) override</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>axpy</name>
      <anchorfile>classmolpro_1_1gci_1_1wavefunction_1_1WavefunctionHandlerSparse.html</anchorfile>
      <anchor>ac7527475ec17691166694ef3c0ccff05</anchor>
      <arglist>(value_type alpha, const AR &amp;x, AL &amp;y) override</arglist>
    </member>
    <member kind="function">
      <type>value_type</type>
      <name>dot</name>
      <anchorfile>classmolpro_1_1gci_1_1wavefunction_1_1WavefunctionHandlerSparse.html</anchorfile>
      <anchor>a646d4322b5ddd0aeb01cd91d4aec1afe</anchor>
      <arglist>(const AL &amp;x, const AR &amp;y) override</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>gemm_outer</name>
      <anchorfile>classmolpro_1_1gci_1_1wavefunction_1_1WavefunctionHandlerSparse.html</anchorfile>
      <anchor>a67e480661a9807c77ba4610896d5cbaf</anchor>
      <arglist>(const Matrix&lt; value_type &gt; alphas, const CVecRef&lt; AR &gt; &amp;xx, const VecRef&lt; AL &gt; &amp;yy) override</arglist>
    </member>
    <member kind="function">
      <type>Matrix&lt; value_type &gt;</type>
      <name>gemm_inner</name>
      <anchorfile>classmolpro_1_1gci_1_1wavefunction_1_1WavefunctionHandlerSparse.html</anchorfile>
      <anchor>ac52a2b8c20649029b8c02ffa101cf494</anchor>
      <arglist>(const CVecRef&lt; AL &gt; &amp;xx, const CVecRef&lt; AR &gt; &amp;yy) override</arglist>
    </member>
    <member kind="function">
      <type>std::map&lt; size_t, value_type_abs &gt;</type>
      <name>select_max_dot</name>
      <anchorfile>classmolpro_1_1gci_1_1wavefunction_1_1WavefunctionHandlerSparse.html</anchorfile>
      <anchor>ab99549c430a98fb1472446cb487ae67f</anchor>
      <arglist>(size_t n, const AL &amp;x, const AR &amp;y) override</arglist>
    </member>
    <member kind="function">
      <type>std::map&lt; size_t, value_type &gt;</type>
      <name>select</name>
      <anchorfile>classmolpro_1_1gci_1_1wavefunction_1_1WavefunctionHandlerSparse.html</anchorfile>
      <anchor>ac52286cd3e09cf05821ac5f38b91ae8b</anchor>
      <arglist>(size_t n, const AL &amp;x, bool max=false, bool ignore_sign=false) override</arglist>
    </member>
  </compound>
  <compound kind="namespace">
    <name>molpro</name>
    <filename>namespacemolpro.html</filename>
    <namespace>molpro::gci</namespace>
    <namespace>molpro::linalg</namespace>
    <namespace>molpro::SymmetryMatrix</namespace>
    <class kind="class">molpro::Operator_</class>
    <class kind="class">molpro::SMat_</class>
    <class kind="class">molpro::SMatMat_</class>
    <member kind="typedef">
      <type>typename molpro::Operator_&lt; double &gt;</type>
      <name>Operator</name>
      <anchorfile>namespacemolpro.html</anchorfile>
      <anchor>ac7045436261ae89fc1236ff3d70c9218</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>std::vector&lt; size_t &gt;</type>
      <name>dim_t</name>
      <anchorfile>namespacemolpro.html</anchorfile>
      <anchor>a67177c2ad49feab84008cc04c3bb1f7c</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>std::vector&lt; dim_t &gt;</type>
      <name>dims_t</name>
      <anchorfile>namespacemolpro.html</anchorfile>
      <anchor>a7a136b7a21c942e40967ed5bab20ff2e</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>typename molpro::SMat_&lt; double &gt;</type>
      <name>SMat</name>
      <anchorfile>namespacemolpro.html</anchorfile>
      <anchor>ad80f79742f183b105c60b295863d6718</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>typename molpro::SMatMat_&lt; molpro::SMat_&lt; double &gt; &gt;</type>
      <name>SMatMat</name>
      <anchorfile>namespacemolpro.html</anchorfile>
      <anchor>a68eb83545d98691e82c07cb7b980adbe</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumeration">
      <type></type>
      <name>parity_t</name>
      <anchorfile>namespacemolpro.html</anchorfile>
      <anchor>a77b8d977180296c55c184036b65c5a6f</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>parityNone</name>
      <anchorfile>namespacemolpro.html</anchorfile>
      <anchor>a77b8d977180296c55c184036b65c5a6fab84d144528f1a54d906ec2d9922f3aec</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>parityEven</name>
      <anchorfile>namespacemolpro.html</anchorfile>
      <anchor>a77b8d977180296c55c184036b65c5a6fa09ceea7356628ff7d1cbc1d0149544e7</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>parityOdd</name>
      <anchorfile>namespacemolpro.html</anchorfile>
      <anchor>a77b8d977180296c55c184036b65c5a6fa5d5c6a3594b6f312d3d19b349ca8d25e</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>parityOddPacked</name>
      <anchorfile>namespacemolpro.html</anchorfile>
      <anchor>a77b8d977180296c55c184036b65c5a6fadf9df807b4f5e704d4dd447772943798</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>parityUnspecified</name>
      <anchorfile>namespacemolpro.html</anchorfile>
      <anchor>a77b8d977180296c55c184036b65c5a6fa36d4c7d8181c3d6fc1f1519c27b6e543</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>std::ostream &amp;</type>
      <name>operator&lt;&lt;</name>
      <anchorfile>namespacemolpro.html</anchorfile>
      <anchor>aeb1a854b5d484750e84957171556c573</anchor>
      <arglist>(std::ostream &amp;os, Operator_&lt; T &gt; const &amp;obj)</arglist>
    </member>
    <member kind="function">
      <type>SMat_&lt; T &gt;</type>
      <name>operator*</name>
      <anchorfile>namespacemolpro.html</anchorfile>
      <anchor>a5be765a88a29ee1d6f4fd32ce4afec05</anchor>
      <arglist>(typename SMat_&lt; T &gt;::value_type a, SMat_&lt; T &gt; const &amp;b)</arglist>
    </member>
    <member kind="function">
      <type>SMat_&lt; T &gt;</type>
      <name>transpose</name>
      <anchorfile>namespacemolpro.html</anchorfile>
      <anchor>a85fc3fa2c992ee01ccea2509b9d76f37</anchor>
      <arglist>(const SMat_&lt; T &gt; &amp;mat)</arglist>
    </member>
    <member kind="function">
      <type>SMat_&lt; T &gt;</type>
      <name>eval</name>
      <anchorfile>namespacemolpro.html</anchorfile>
      <anchor>a796fa89776bd8cfb5cf59059f67cadda</anchor>
      <arglist>(const SMat_&lt; T &gt; &amp;mat)</arglist>
    </member>
    <member kind="function">
      <type>SMat_&lt; T &gt;</type>
      <name>trim</name>
      <anchorfile>namespacemolpro.html</anchorfile>
      <anchor>ac578bd58532fe11d0ef06da0ad0443e2</anchor>
      <arglist>(const SMat_&lt; T &gt; &amp;mat, typename SMat_&lt; T &gt;::scalar_type cut=0)</arglist>
    </member>
    <member kind="function">
      <type>std::ostream &amp;</type>
      <name>operator&lt;&lt;</name>
      <anchorfile>namespacemolpro.html</anchorfile>
      <anchor>a2913f10101dccd0a0d37d4f3196af078</anchor>
      <arglist>(std::ostream &amp;os, SMat_&lt; T &gt; const &amp;obj)</arglist>
    </member>
    <member kind="function">
      <type>std::ostream &amp;</type>
      <name>operator&lt;&lt;</name>
      <anchorfile>namespacemolpro.html</anchorfile>
      <anchor>a2edea01905081b3094c90bc9fc891282</anchor>
      <arglist>(std::ostream &amp;os, SMatMat_&lt; T &gt; const &amp;obj)</arglist>
    </member>
  </compound>
  <compound kind="namespace">
    <name>molpro::gci</name>
    <filename>namespacemolpro_1_1gci.html</filename>
    <namespace>molpro::gci::array</namespace>
    <namespace>molpro::gci::ns_VibOperator</namespace>
    <namespace>molpro::gci::run</namespace>
    <namespace>molpro::gci::schedule</namespace>
    <namespace>molpro::gci::utils</namespace>
    <namespace>molpro::gci::wavefunction</namespace>
    <class kind="class">molpro::gci::State</class>
    <class kind="class">molpro::gci::Wavefunction</class>
    <class kind="class">molpro::gci::Run</class>
    <class kind="struct">molpro::gci::residual</class>
    <class kind="struct">molpro::gci::Presidual</class>
    <class kind="struct">molpro::gci::meanfield_residual</class>
    <class kind="struct">molpro::gci::updater</class>
    <class kind="class">molpro::gci::Problem</class>
    <class kind="class">molpro::gci::Determinant</class>
    <class kind="class">molpro::gci::Excitation</class>
    <class kind="class">molpro::gci::ExcitationSet</class>
    <class kind="class">molpro::gci::File</class>
    <class kind="class">molpro::gci::Options</class>
    <class kind="class">molpro::gci::Orbitals</class>
    <class kind="class">molpro::gci::OrbitalSpace</class>
    <class kind="class">molpro::gci::Printable</class>
    <class kind="class">molpro::gci::String</class>
    <class kind="class">molpro::gci::StringSet</class>
    <class kind="class">molpro::gci::SymmetrySpace</class>
    <class kind="class">molpro::gci::ctor_allocator</class>
    <class kind="class">molpro::gci::TransitionDensity</class>
    <class kind="class">molpro::gci::HProduct</class>
    <class kind="class">molpro::gci::HProductSet</class>
    <class kind="class">molpro::gci::VibOp</class>
    <class kind="struct">molpro::gci::MixedOpTerm</class>
    <class kind="class">molpro::gci::MixedOperator</class>
    <class kind="class">molpro::gci::MixedWavefunction</class>
    <class kind="struct">molpro::gci::VibSpace</class>
    <class kind="class">molpro::gci::PersistentOperator</class>
    <class kind="class">molpro::gci::MixedOperatorSecondQuant</class>
    <class kind="class">molpro::gci::VibTensEl</class>
    <class kind="class">molpro::gci::VibOperator</class>
    <class kind="class">molpro::gci::VibExcitation</class>
    <member kind="typedef">
      <type>std::vector&lt; Wavefunction &gt;</type>
      <name>ParameterVectorSet</name>
      <anchorfile>namespacemolpro_1_1gci.html</anchorfile>
      <anchor>a6aff8525163d30020a0dfc9f03dbac92</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>double</type>
      <name>scalar</name>
      <anchorfile>namespacemolpro_1_1gci.html</anchorfile>
      <anchor>ad290ac7c1ac2e78dfb9a34ace3c59082</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>std::map&lt; size_t, double &gt;</type>
      <name>Pvector</name>
      <anchorfile>namespacemolpro_1_1gci.html</anchorfile>
      <anchor>a93bc4e37dd503e5a6334adfbd5dc43a5</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>unsigned int</type>
      <name>uint</name>
      <anchorfile>namespacemolpro_1_1gci.html</anchorfile>
      <anchor>a2be15605b2c4fe82556bd5ac93701798</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>std::vector&lt; Excitation &gt;</type>
      <name>ExcitationSetContainer</name>
      <anchorfile>namespacemolpro_1_1gci.html</anchorfile>
      <anchor>a7045e610f51477b48f588b9d924d7cdb</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumeration">
      <type></type>
      <name>VibOpType</name>
      <anchorfile>namespacemolpro_1_1gci.html</anchorfile>
      <anchor>a75e1db8c4a2e6df48f661dd3ba9352ba</anchor>
      <arglist></arglist>
      <enumvalue file="namespacemolpro_1_1gci.html" anchor="a75e1db8c4a2e6df48f661dd3ba9352baa3969dc7ec85ba96faa4cc7c446f7401c">HO</enumvalue>
      <enumvalue file="namespacemolpro_1_1gci.html" anchor="a75e1db8c4a2e6df48f661dd3ba9352baaf09564c9ca56850d4cd6b3319e541aee">Q</enumvalue>
      <enumvalue file="namespacemolpro_1_1gci.html" anchor="a75e1db8c4a2e6df48f661dd3ba9352baa623ce4ee9b146516003af19773c3cb41">dQ</enumvalue>
      <enumvalue file="namespacemolpro_1_1gci.html" anchor="a75e1db8c4a2e6df48f661dd3ba9352baa3bc0a671839f3692167917d77b9444cb">Qsq</enumvalue>
    </member>
    <member kind="function">
      <type>double</type>
      <name>operator*</name>
      <anchorfile>namespacemolpro_1_1gci.html</anchorfile>
      <anchor>a50323d4a8da2af64d2046d73bdc79f39</anchor>
      <arglist>(const Wavefunction &amp;w1, const Wavefunction &amp;w2)</arglist>
    </member>
    <member kind="function">
      <type>Wavefunction</type>
      <name>operator+</name>
      <anchorfile>namespacemolpro_1_1gci.html</anchorfile>
      <anchor>aba0738b624c3e61af44a30c22b3aab14</anchor>
      <arglist>(const Wavefunction &amp;w1, const Wavefunction &amp;w2)</arglist>
    </member>
    <member kind="function">
      <type>Wavefunction</type>
      <name>operator-</name>
      <anchorfile>namespacemolpro_1_1gci.html</anchorfile>
      <anchor>a05484faf6c56746f042757a6280bd6f9</anchor>
      <arglist>(const Wavefunction &amp;w1, const Wavefunction &amp;w2)</arglist>
    </member>
    <member kind="function">
      <type>Wavefunction</type>
      <name>operator/</name>
      <anchorfile>namespacemolpro_1_1gci.html</anchorfile>
      <anchor>a222c8dc451777cc1c2bfdc9ff93270e8</anchor>
      <arglist>(const Wavefunction &amp;w1, const Wavefunction &amp;w2)</arglist>
    </member>
    <member kind="function">
      <type>Wavefunction</type>
      <name>operator*</name>
      <anchorfile>namespacemolpro_1_1gci.html</anchorfile>
      <anchor>afe29acb0c67e08af6217e7329966ddee</anchor>
      <arglist>(const Wavefunction &amp;w1, const double &amp;value)</arglist>
    </member>
    <member kind="function">
      <type>Wavefunction</type>
      <name>operator*</name>
      <anchorfile>namespacemolpro_1_1gci.html</anchorfile>
      <anchor>a3a9f77ca823dfa72880c5413f52db8ab</anchor>
      <arglist>(const double &amp;value, const Wavefunction &amp;w1)</arglist>
    </member>
    <member kind="function">
      <type>Eigen::VectorXd</type>
      <name>int1</name>
      <anchorfile>namespacemolpro_1_1gci.html</anchorfile>
      <anchor>a8b577999c4d871d66410fe046692cd70</anchor>
      <arglist>(const molpro::Operator &amp;hamiltonian, int spin)</arglist>
    </member>
    <member kind="function">
      <type>Eigen::MatrixXd</type>
      <name>intJ</name>
      <anchorfile>namespacemolpro_1_1gci.html</anchorfile>
      <anchor>adf86f34bf19ae32b3a84dde1a10b2d60</anchor>
      <arglist>(const molpro::Operator &amp;hamiltonian, int spini, int spinj)</arglist>
    </member>
    <member kind="function">
      <type>Eigen::MatrixXd</type>
      <name>intK</name>
      <anchorfile>namespacemolpro_1_1gci.html</anchorfile>
      <anchor>a152bd8328e9e1fe853d5a395f0437950</anchor>
      <arglist>(const molpro::Operator &amp;hamiltonian, int spin)</arglist>
    </member>
    <member kind="function">
      <type>molpro::Operator</type>
      <name>constructOperator</name>
      <anchorfile>namespacemolpro_1_1gci.html</anchorfile>
      <anchor>aec7484a4f64e8334c4665b49a9eab953</anchor>
      <arglist>(const molpro::FCIdump &amp;dump, bool collective=true)</arglist>
    </member>
    <member kind="function">
      <type>molpro::Operator</type>
      <name>fockOperator</name>
      <anchorfile>namespacemolpro_1_1gci.html</anchorfile>
      <anchor>a4fb1d4d9051a5c77e5cf63472b2038fe</anchor>
      <arglist>(const molpro::Operator &amp;hamiltonian, const Determinant &amp;reference, std::string description=&quot;Fock&quot;)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>gsum</name>
      <anchorfile>namespacemolpro_1_1gci.html</anchorfile>
      <anchor>a2b9b892dfad15e9f6ce88e7c363accee</anchor>
      <arglist>(molpro::Operator &amp;op)</arglist>
    </member>
    <member kind="function">
      <type>molpro::Operator</type>
      <name>sameSpinOperator</name>
      <anchorfile>namespacemolpro_1_1gci.html</anchorfile>
      <anchor>aff0a782594874cd13b816f3248e5645f</anchor>
      <arglist>(const molpro::Operator &amp;hamiltonian, const Determinant &amp;reference, std::string description=&quot;Same Spin Hamiltonian&quot;)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>FCIDump</name>
      <anchorfile>namespacemolpro_1_1gci.html</anchorfile>
      <anchor>a48a994389e84ce021f24245c03dbf33e</anchor>
      <arglist>(const molpro::Operator &amp;op, const std::string filename, std::vector&lt; int &gt; orbital_symmetries=std::vector&lt; int &gt;(0))</arglist>
    </member>
    <member kind="function">
      <type>std::ostream &amp;</type>
      <name>operator&lt;&lt;</name>
      <anchorfile>namespacemolpro_1_1gci.html</anchorfile>
      <anchor>a425973d8799515ed20b0604c078bfdb0</anchor>
      <arglist>(std::ostream &amp;os, ExcitationSet const &amp;obj)</arglist>
    </member>
    <member kind="function">
      <type>MPI_Comm</type>
      <name>create_new_comm</name>
      <anchorfile>namespacemolpro_1_1gci.html</anchorfile>
      <anchor>a5b972710edeaf1387434f969e65ea44b</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>int</type>
      <name>_mpi_rank</name>
      <anchorfile>namespacemolpro_1_1gci.html</anchorfile>
      <anchor>ad164612271e547366674a008f2731d1c</anchor>
      <arglist>(MPI_Comm comm)</arglist>
    </member>
    <member kind="function">
      <type>int</type>
      <name>_mpi_size</name>
      <anchorfile>namespacemolpro_1_1gci.html</anchorfile>
      <anchor>a07e1c7b62b114bfbcc359bf6feb553a1</anchor>
      <arglist>(MPI_Comm comm)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>MXM</name>
      <anchorfile>namespacemolpro_1_1gci.html</anchorfile>
      <anchor>ae83ac4a872001cdd083e7cabcd874f3e</anchor>
      <arglist>(double *Out, const double *A, const double *B, uint nRows, uint nLink, uint nCols, bool AddToDest, int nStrideLink=-1)</arglist>
    </member>
    <member kind="function">
      <type>std::ostream &amp;</type>
      <name>operator&lt;&lt;</name>
      <anchorfile>namespacemolpro_1_1gci.html</anchorfile>
      <anchor>a6a98b862d7dd4647cac838d26456a32c</anchor>
      <arglist>(std::ostream &amp;os, HProduct const &amp;obj)</arglist>
    </member>
    <member kind="function">
      <type>molpro::Operator</type>
      <name>constructOperatorT1</name>
      <anchorfile>namespacemolpro_1_1gci.html</anchorfile>
      <anchor>ac4c7ecbe6e8c5527cf065869a85cb8a2</anchor>
      <arglist>(const molpro::FCIdump &amp;dump)</arglist>
    </member>
    <member kind="function">
      <type>PersistentOperator</type>
      <name>create_persistentoperator</name>
      <anchorfile>namespacemolpro_1_1gci.html</anchorfile>
      <anchor>afde796ffae8dec801f2d15c14096691f</anchor>
      <arglist>(const std::string &amp;fcidump, bool restart, std::string description, int hid_file, int root, Op(*construct_op)(const molpro::FCIdump &amp;, bool))</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>constructHvib</name>
      <anchorfile>namespacemolpro_1_1gci.html</anchorfile>
      <anchor>a07f7d9dafcc03d24b27bdf58528246b6</anchor>
      <arglist>(VibOperator&lt; double &gt; &amp;Hvib, const std::string &amp;fcidump_name, int nmode, int nmodal)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>constructHvib</name>
      <anchorfile>namespacemolpro_1_1gci.html</anchorfile>
      <anchor>ad2ba4c052820d85cc3b9bf6e9e571f54</anchor>
      <arglist>(VibOperator&lt; double &gt; &amp;Hvib, int nmode, int nmodal, std::vector&lt; double &gt; freq)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>constructDMcoupling</name>
      <anchorfile>namespacemolpro_1_1gci.html</anchorfile>
      <anchor>a2368b28f705b3703dc6a052600799382</anchor>
      <arglist>(std::map&lt; std::string, MixedOperatorSecondQuant::hel_t &gt; &amp;elHam2, std::map&lt; std::string, VibOperator&lt; MixedOperatorSecondQuant::hel_t &gt;&gt; &amp;mixedHam, const std::string &amp;fcidump_f, const std::vector&lt; double &gt; &amp;gamma, const std::vector&lt; double &gt; &amp;freq, int nmode, int nmodal)</arglist>
    </member>
    <member kind="function">
      <type>std::ostream &amp;</type>
      <name>operator&lt;&lt;</name>
      <anchorfile>namespacemolpro_1_1gci.html</anchorfile>
      <anchor>afe901d292779e127d2e208c7a5562c38</anchor>
      <arglist>(std::ostream &amp;os, Printable const &amp;obj)</arglist>
    </member>
    <member kind="function">
      <type>std::ostream &amp;</type>
      <name>operator&lt;&lt;</name>
      <anchorfile>namespacemolpro_1_1gci.html</anchorfile>
      <anchor>af11e0e1ee586418f66120d0e9aee5a8b</anchor>
      <arglist>(std::ostream &amp;o, const MixedOperatorSecondQuant &amp;op)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>create_new_counter</name>
      <anchorfile>namespacemolpro_1_1gci.html</anchorfile>
      <anchor>a9d22e939230de8d8c210abf6ef022518</anchor>
      <arglist>(MPI_Comm communicator)</arglist>
    </member>
    <member kind="function">
      <type>long</type>
      <name>nextval</name>
      <anchorfile>namespacemolpro_1_1gci.html</anchorfile>
      <anchor>ab44389f5c53dc69719109403ef3490d4</anchor>
      <arglist>(MPI_Comm communicator, int64_t option=parallel_size)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>DivideTasks</name>
      <anchorfile>namespacemolpro_1_1gci.html</anchorfile>
      <anchor>aae40c4d391e95e3aab7e7e04db9df6e8</anchor>
      <arglist>(std::size_t ntasks, std::size_t nMinBatch, std::size_t nMaxBatch, MPI_Comm communicator)</arglist>
    </member>
    <member kind="function">
      <type>bool</type>
      <name>NextTask</name>
      <anchorfile>namespacemolpro_1_1gci.html</anchorfile>
      <anchor>ab9afaee349f6667c200845bb7e7b0dd8</anchor>
      <arglist>(MPI_Comm communicator)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>EndTasks</name>
      <anchorfile>namespacemolpro_1_1gci.html</anchorfile>
      <anchor>a4d731ebd047599af13d647023898b74c</anchor>
      <arglist>(MPI_Comm communicator)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>gather_chunks</name>
      <anchorfile>namespacemolpro_1_1gci.html</anchorfile>
      <anchor>ada0ad6980ad3eed9dfae614c5eb98d5c</anchor>
      <arglist>(double *buffer, const size_t length, const size_t chunk, MPI_Comm communicator)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>gsum</name>
      <anchorfile>namespacemolpro_1_1gci.html</anchorfile>
      <anchor>afbedafc56dab2f307775ea18d64b9f71</anchor>
      <arglist>(double *buffer, size_t len, MPI_Comm communicator)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>gsum</name>
      <anchorfile>namespacemolpro_1_1gci.html</anchorfile>
      <anchor>a24c504d28e50c1888b7dc6245bc18cca</anchor>
      <arglist>(std::map&lt; size_t, double &gt; &amp;buffer, MPI_Comm communicator)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>gsum</name>
      <anchorfile>namespacemolpro_1_1gci.html</anchorfile>
      <anchor>ae4582e83757c8320433c2e72a2ac47d7</anchor>
      <arglist>(molpro::array&lt; double &gt; v, MPI_Comm communicator)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>gsum</name>
      <anchorfile>namespacemolpro_1_1gci.html</anchorfile>
      <anchor>a375859886a6cec9371f796286c4c845f</anchor>
      <arglist>(molpro::vector&lt; double &gt; v, MPI_Comm communicator)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>gsum</name>
      <anchorfile>namespacemolpro_1_1gci.html</anchorfile>
      <anchor>a3a5b3e42f12d16596ec7641ee3ad841e</anchor>
      <arglist>(std::vector&lt; double &gt; v, MPI_Comm communicator)</arglist>
    </member>
    <member kind="variable">
      <type>int</type>
      <name>parallel_size</name>
      <anchorfile>namespacemolpro_1_1gci.html</anchorfile>
      <anchor>a03a3f22b8cd7b2789b98e6e3474bcb9b</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>int</type>
      <name>parallel_rank</name>
      <anchorfile>namespacemolpro_1_1gci.html</anchorfile>
      <anchor>a69609a4424d1e27aae322f69a8d6194e</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>bool</type>
      <name>molpro_plugin</name>
      <anchorfile>namespacemolpro_1_1gci.html</anchorfile>
      <anchor>ac21415d9dbec3ac5a369b37e5a75c494</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>MPI_Comm</type>
      <name>molpro_plugin_intercomm</name>
      <anchorfile>namespacemolpro_1_1gci.html</anchorfile>
      <anchor>afe262cf1cfd346b886eb2e6960cc80b7</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>std::map&lt; MPI_Comm, std::unique_ptr&lt; schedule::SharedCounter &gt; &gt;</type>
      <name>_nextval_counter</name>
      <anchorfile>namespacemolpro_1_1gci.html</anchorfile>
      <anchor>af584c0dd9eb59177902e0c9b09cd6d19</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>std::map&lt; MPI_Comm, int &gt;</type>
      <name>_ga_pgroups</name>
      <anchorfile>namespacemolpro_1_1gci.html</anchorfile>
      <anchor>ab68e9705410b18a0c47e1474b60595c6</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>MPI_Comm</type>
      <name>_sub_communicator</name>
      <anchorfile>namespacemolpro_1_1gci.html</anchorfile>
      <anchor>a6c1a231dfda15edff66c0b83603c18cd</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>MPI_Comm</type>
      <name>mpi_comm_compute</name>
      <anchorfile>namespacemolpro_1_1gci.html</anchorfile>
      <anchor>a40ef598d77230c2fd441c7800ae19540</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>std::map&lt; MPI_Comm, long int &gt;</type>
      <name>__my_first_task</name>
      <anchorfile>namespacemolpro_1_1gci.html</anchorfile>
      <anchor>add4a7d73fd92aee07b5d4a5c3d6af6d4</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>std::map&lt; MPI_Comm, long int &gt;</type>
      <name>__task</name>
      <anchorfile>namespacemolpro_1_1gci.html</anchorfile>
      <anchor>ab0edc7c75d899e607ea44372db45d53d</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>std::map&lt; MPI_Comm, long int &gt;</type>
      <name>__task_granularity</name>
      <anchorfile>namespacemolpro_1_1gci.html</anchorfile>
      <anchor>a0ae7fb09ab1a40ffcc81594ee448e9a5</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>std::unique_ptr&lt; molpro::Profiler &gt;</type>
      <name>profiler</name>
      <anchorfile>namespacemolpro_1_1gci.html</anchorfile>
      <anchor>a693228c63ef13caf937a222aed70c61c</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="namespace">
    <name>molpro::gci::array</name>
    <filename>namespacemolpro_1_1gci_1_1array.html</filename>
  </compound>
  <compound kind="namespace">
    <name>molpro::gci::ns_VibOperator</name>
    <filename>namespacemolpro_1_1gci_1_1ns__VibOperator.html</filename>
    <member kind="enumeration">
      <type></type>
      <name>parity_t</name>
      <anchorfile>namespacemolpro_1_1gci_1_1ns__VibOperator.html</anchorfile>
      <anchor>aa6b0eccb81cf71f699d384838a9f8b53</anchor>
      <arglist></arglist>
      <enumvalue file="namespacemolpro_1_1gci_1_1ns__VibOperator.html" anchor="aa6b0eccb81cf71f699d384838a9f8b53a334c4a4c42fdb79d7ebc3e73b517e6f8">none</enumvalue>
      <enumvalue file="namespacemolpro_1_1gci_1_1ns__VibOperator.html" anchor="aa6b0eccb81cf71f699d384838a9f8b53acc935c5faf4c8f7a0468d7552a9b8138">even</enumvalue>
      <enumvalue file="namespacemolpro_1_1gci_1_1ns__VibOperator.html" anchor="aa6b0eccb81cf71f699d384838a9f8b53aa2b6f2a6066ed8700d83335fc50a2b8e">odd</enumvalue>
    </member>
    <member kind="function">
      <type>size_t</type>
      <name>hash</name>
      <anchorfile>namespacemolpro_1_1gci_1_1ns__VibOperator.html</anchorfile>
      <anchor>a3d66de902247b393b0b21e7cc0ab5028</anchor>
      <arglist>(const VibExcitation &amp;exc, int nMode, int nModal, parity_t hermiticity, parity_t exchange)</arglist>
    </member>
    <member kind="function">
      <type>size_t</type>
      <name>hash_mc1_sym</name>
      <anchorfile>namespacemolpro_1_1gci_1_1ns__VibOperator.html</anchorfile>
      <anchor>a6614730933ba1ea2fce486aaa6b1a04b</anchor>
      <arglist>(const VibExcitation &amp;exc, int nModal)</arglist>
    </member>
    <member kind="function">
      <type>size_t</type>
      <name>hash_mc1_nosym</name>
      <anchorfile>namespacemolpro_1_1gci_1_1ns__VibOperator.html</anchorfile>
      <anchor>abcf16d1a771c4506564f4e034312b194</anchor>
      <arglist>(const VibExcitation &amp;exc, int nModal)</arglist>
    </member>
    <member kind="function">
      <type>size_t</type>
      <name>hash_mc1_nosym_old</name>
      <anchorfile>namespacemolpro_1_1gci_1_1ns__VibOperator.html</anchorfile>
      <anchor>a1725c302094ef19c87f10627820a8d4e</anchor>
      <arglist>(const VibExcitation &amp;exc, int nModal)</arglist>
    </member>
  </compound>
  <compound kind="namespace">
    <name>molpro::gci::run</name>
    <filename>namespacemolpro_1_1gci_1_1run.html</filename>
    <class kind="class">molpro::gci::run::Davidson</class>
    <member kind="function">
      <type>void</type>
      <name>davidson_read_write_array</name>
      <anchorfile>namespacemolpro_1_1gci_1_1run.html</anchorfile>
      <anchor>a64b77d8c195caf4fa08c7951d3a905aa</anchor>
      <arglist>(MixedWavefunction &amp;w, const std::string &amp;fname, unsigned int i, int id, bool save)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>davidson_read_write_wfn</name>
      <anchorfile>namespacemolpro_1_1gci_1_1run.html</anchorfile>
      <anchor>af8837323f27bb72f4c594b339aba6320</anchor>
      <arglist>(std::vector&lt; t_Wavefunction &gt; &amp;ww, const std::string &amp;fname, bool save)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>davidson_read_write_wfn</name>
      <anchorfile>namespacemolpro_1_1gci_1_1run.html</anchorfile>
      <anchor>a2b3aaef693eec2db68d6a21c09fa8f29</anchor>
      <arglist>(std::vector&lt; Wavefunction &gt; &amp;ww, const std::string &amp;fname, bool save)</arglist>
    </member>
  </compound>
  <compound kind="namespace">
    <name>molpro::gci::schedule</name>
    <filename>namespacemolpro_1_1gci_1_1schedule.html</filename>
    <class kind="class">molpro::gci::schedule::SharedCounterBase</class>
    <class kind="class">molpro::gci::schedule::SharedCounterMPI3</class>
    <member kind="typedef">
      <type>SharedCounterMPI3</type>
      <name>SharedCounter</name>
      <anchorfile>namespacemolpro_1_1gci_1_1schedule.html</anchorfile>
      <anchor>a69d55cb27e27909aeeb0446cf3e36c76</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="namespace">
    <name>molpro::gci::utils</name>
    <filename>namespacemolpro_1_1gci_1_1utils.html</filename>
    <member kind="function">
      <type>bool</type>
      <name>file_exists</name>
      <anchorfile>namespacemolpro_1_1gci_1_1utils.html</anchorfile>
      <anchor>af40e41132a0026382ba114be8fbff4fa</anchor>
      <arglist>(const std::string &amp;fname, const std::string &amp;message=&quot;&quot;)</arglist>
    </member>
    <member kind="function">
      <type>int</type>
      <name>open_hdf5_file</name>
      <anchorfile>namespacemolpro_1_1gci_1_1utils.html</anchorfile>
      <anchor>a82309a03d6f6d74b61efa6c3a1bd37e1</anchor>
      <arglist>(const std::string &amp;fname, MPI_Comm communicator, bool create)</arglist>
    </member>
    <member kind="function">
      <type>bool</type>
      <name>hdf5_file_open</name>
      <anchorfile>namespacemolpro_1_1gci_1_1utils.html</anchorfile>
      <anchor>af70b57521b6923b2bb7c9716519bbae6</anchor>
      <arglist>(int file_id)</arglist>
    </member>
    <member kind="function">
      <type>bool</type>
      <name>hdf5_dataset_exists</name>
      <anchorfile>namespacemolpro_1_1gci_1_1utils.html</anchorfile>
      <anchor>ac2298febd5f20fb4daed9b79a5581039</anchor>
      <arglist>(int location, const std::string &amp;dataset_name)</arglist>
    </member>
    <member kind="function">
      <type>int</type>
      <name>open_or_create_hdf5_dataset</name>
      <anchorfile>namespacemolpro_1_1gci_1_1utils.html</anchorfile>
      <anchor>adfb84b16291cc485f9131f67c804dc36</anchor>
      <arglist>(const int &amp;location, const std::string &amp;dataset_name, const int &amp;dtype_id, const size_t &amp;length)</arglist>
    </member>
  </compound>
  <compound kind="namespace">
    <name>molpro::gci::wavefunction</name>
    <filename>namespacemolpro_1_1gci_1_1wavefunction.html</filename>
    <class kind="class">molpro::gci::wavefunction::WavefunctionHandler</class>
    <class kind="class">molpro::gci::wavefunction::WavefunctionHandlerSparse</class>
  </compound>
  <compound kind="namespace">
    <name>molpro::linalg</name>
    <filename>namespacemolpro_1_1linalg.html</filename>
  </compound>
  <compound kind="namespace">
    <name>molpro::SymmetryMatrix</name>
    <filename>namespacemolpro_1_1SymmetryMatrix.html</filename>
    <member kind="function">
      <type>dims_t</type>
      <name>spaces</name>
      <anchorfile>namespacemolpro_1_1SymmetryMatrix.html</anchorfile>
      <anchor>a0f57c0ef0c5cc587b17a063ef926d548</anchor>
      <arglist>(std::string space)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>register_get_orbital_space</name>
      <anchorfile>namespacemolpro_1_1SymmetryMatrix.html</anchorfile>
      <anchor>a2a57659578f3ba39e34a8c2d08256d09</anchor>
      <arglist>(void(*func)(char c, size_t nt[]))</arglist>
    </member>
  </compound>
</tagfile>
