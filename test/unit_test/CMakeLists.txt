include(FetchContent)
FetchContent_MakeAvailable(googletest)
include(GoogleTest)


set(data_files data/he2.fcidump data/he2_1el.fcidump)
file(MAKE_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/data)
foreach (fil ${data_files})
    configure_file(${fil} ${CMAKE_CURRENT_BINARY_DIR}/data/${file} COPYONLY)
endforeach ()

add_executable(test-gci
        testVibSpace.cpp
        testHProduct.cpp
        testHProductSet.cpp
        )
target_link_libraries(test-gci PUBLIC molpro::gci gmock_main)
gtest_discover_tests(test-gci)

if (GCI_HDF5 AND TARGET ga::ga)
    add_executable(test-gci-parallel
            main.cpp parallel_utils.h
            testPersistentOperator.cpp
            )
    target_link_libraries(test-gci-parallel PUBLIC molpro::gci gmock_main ga::ga)
    target_compile_definitions(test-gci-parallel PRIVATE "DATA_PATH=\"${CMAKE_CURRENT_SOURCE_DIR}/data\"")
    add_test(NAME test-gci-parallel
            COMMAND ${MPIEXEC_EXECUTABLE} ${MPIOPTIONS} ${MPIEXEC_NUMPROC_FLAG} 2 ${MPIEXEC_PREFLAGS}
            ${CMAKE_CURRENT_BINARY_DIR}/test-gci-parallel ${MPIEXEC_POSTFLAGS}
            WORKING_DIRECTORY ${CMAKE_BINARY_DIR}
            )
endif ()