cmake_minimum_required(VERSION 3.15)
project(gci CXX)

include(FetchContent)
FetchContent_Declare(
        LibraryManager
        GIT_REPOSITORY https://github.com/molpro/library-manager
        GIT_TAG 0.11.3
)
FetchContent_MakeAvailable(LibraryManager)
set(MPI ON CACHE BOOL "Whether to build with MPI" FORCE)
set(FORTRAN OFF)
LibraryManager_Project(MPI_OPTION)

########## Options ##########
option(GCI_TEST "Whether to force tests to be built" OFF)
option(GCI_SHAREDCOUNTER_MPI3 "Use MPI3 RMA implementation of SharedCounter" ON)
option(GCI_SHAREDCOUNTER_GA "Use Global Arrays implementation of SharedCounter" OFF)
option(GCI_ARRAY_MPI3 "Use MPI3 RMA implementation of Array" ON)
option(GCI_ARRAY_GA "Use Global Arrays implementation of Array" OFF)
option(GCI_HDF5 "Build using parallel HDF5 (some features missing if off)" OFF)

########## Dependencies ##########

add_subdirectory(dependencies)

########## Targets ##########

add_subdirectory(src)

if (${CMAKE_PROJECT_NAME} STREQUAL ${PROJECT_NAME} OR GCI_TEST)
    enable_testing()
    add_subdirectory(test)
endif ()
########## Documentation ##########

# Documentation has to come last to make sure all dependencies have been added
include(DependencyManagerDocs)
DependencyManagerDocs_Add(${PROJECT_NAME}
        # FILES README.md
        DOC_URL "https://molpro.github.io/gci"
        # projects whose documentation has to be built before the current project.
        DEPENDS fcidump iterative-solver molpro-plugin profiler utilities
        )

