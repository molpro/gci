LibraryManager_Add(${PROJECT_NAME} NAMESPACE molpro)

if (MPI)
    find_package(MPI COMPONENTS CXX)
endif ()

# Its source files are conventionally in directories named by C++ namespace
add_subdirectory(molpro)

LibraryManager_Install(${PROJECT_NAME})

if (CMAKE_PROJECT_NAME STREQUAL PROJECT_NAME OR GCI_TEST)
    include(LibraryManagerUtils)
    print_target_properties(ga::ga)
    add_executable(${PROJECT_NAME}.exe gci.cpp)
    target_link_libraries(${PROJECT_NAME}.exe PUBLIC molpro::gci ga::ga)
    set_target_properties(${PROJECT_NAME}.exe PROPERTIES RUNTIME_OUTPUT_DIRECTORY ${PROJECT_BINARY_DIR})
    LibraryManager_Install(${PROJECT_NAME}.exe EXPORT ${PROJECT_NAME}-export)
endif ()

LibraryManager_Export(${PROJECT_NAME})
