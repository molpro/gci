FetchContent_GetProperties(googletest_dep)
if (NOT googletest_dep_POPULATED)
    FetchContent_Populate(googletest_dep)
    add_subdirectory(${googletest_dep_SOURCE_DIR} ${googletest_dep_BINARY_DIR} EXCLUDE_FROM_ALL)
endif ()

set(config_files
        "data/fcidump_holstein_2site"
        "data/fcidump_holstein_2site_d1_0"
        "data/fcidump_holstein_2site_d1_1"
        "data/fcidump_holstein_2site_nmodal3"
        "data/fcidump_holstein_2site_nmodal3_d1_0"
        "data/fcidump_holstein_2site_nmodal3_d1_1"
        )
foreach (fil ${config_files})
    configure_file(${fil} ${CMAKE_CURRENT_BINARY_DIR}/${fil} COPYONLY)
endforeach ()

add_executable(test-gci main.cpp
        testVibSpace.cpp
        testHProduct.cpp
        testMixedOperator.cpp
        testHProductSet.cpp
        testMixedWavefunction.cpp
        )
target_link_libraries(test-gci PUBLIC gci gmock_main)

include(GoogleTest)
gtest_discover_tests(test-gci)