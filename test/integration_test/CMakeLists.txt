if (GCI_HDF5)
    add_test(NAME gci-C2-vibronic
            COMMAND ${MPIEXEC_EXECUTABLE} ${MPIOPTIONS} ${MPIEXEC_NUMPROC_FLAG} ${MPIEXEC_MAX_NUMPROCS} ${MPIEXEC_PREFLAGS}
            ${PROJECT_BINARY_DIR}/gci.exe ${MPIEXEC_POSTFLAGS} ${CMAKE_CURRENT_SOURCE_DIR}/data/C2/fcidump HAM_HDF5=${CMAKE_BINARY_DIR}/ham.hdf5
            )
#    add_test(NAME gci-C2-vibronic-serial
#            COMMAND ${PROJECT_BINARY_DIR}/gci.exe ${CMAKE_CURRENT_SOURCE_DIR}/data/C2/fcidump HAM_HDF5=${CMAKE_BINARY_DIR}/ham.hdf5
#            )
endif ()
