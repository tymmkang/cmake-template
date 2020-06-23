cmake_minimum_required(VERSION 3.6)

##################################################
# Project variables
##################################################

set(VAR_CMAKE_PROJECT_NAME "cmake-template")
set(VAR_DIR_NAME_CMAKE_UTILS "cmake")
set(VAR_DIR_NAME_MODULE "module")
set(VAR_DIR_NAME_OUTPUT "output")

##################################################
# ~Project variables
##################################################

project(${VAR_CMAKE_PROJECT_NAME})
include(ExternalProject)
include(FetchContent)
include(GNUInstallDirs)

IF(CMAKE_INSTALL_PREFIX_INITIALIZED_TO_DEFAULT)
    SET(CMAKE_INSTALL_PREFIX "${CMAKE_CURRENT_LIST_DIR}/install" CACHE PATH 
        "Install path prefix, prepended onto install directories." 
        FORCE
    )
ENDIF(CMAKE_INSTALL_PREFIX_INITIALIZED_TO_DEFAULT)

unset(FETCHCONTENT_BASE_DIR CACHE)
unset(FETCHCONTENT_FULLY_DISCONNECTED CACHE)
unset(FETCHCONTENT_QUIET CACHE)
unset(FETCHCONTENT_UPDATES_DISCONNECTED CACHE)

##################################################
# Configuration
##################################################

set(CMAKE_CONFIGURATION_TYPES Debug Release CACHE STRING INTERNAL FORCE )

# Debug
set(CMAKE_CXX_FLAGS_DEBUG ${CMAKE_CXX_FLAGS_DEBUG})
set(CMAKE_EXE_LINKER_FLAGS_DEBUG ${CMAKE_EXE_LINKER_FLAGS_DEBUG})
set(CMAKE_SHARED_LINKER_FLAGS_DEBUG ${CMAKE_SHARED_LINKER_FLAGS_DEBUG})
add_compile_definitions("$<$<CONFIG:Debug>:DEBUG=1>")

# Release
set(CMAKE_CXX_FLAGS_RELEASE ${CMAKE_CXX_FLAGS_RELEASE})
set(CMAKE_EXE_LINKER_FLAGS_RELEASE ${CMAKE_EXE_LINKER_FLAGS_RELEASE})
set(CMAKE_SHARED_LINKER_FLAGS_RELEASE ${CMAKE_SHARED_LINKER_FLAGS_RELEASE})
add_compile_definitions("$<$<CONFIG:Release>:RELEASE=2>")

##################################################
# ~Configuration
##################################################

set_property(GLOBAL PROPERTY USE_FOLDERS ON)
add_subdirectory(${VAR_DIR_NAME_CMAKE_UTILS})
add_subdirectory(${VAR_DIR_NAME_MODULE})
