﻿FUNC_GET_SUBDIRECTORIES(${CMAKE_CURRENT_SOURCE_DIR} SUBDIRS)
foreach(SUBDIR ${SUBDIRS})
    add_subdirectory(${SUBDIR})
endforeach()

file(GLOB SOURCES_IN_CURRENT_DIR "${CMAKE_CURRENT_LIST_DIR}/*.h" "${CMAKE_CURRENT_LIST_DIR}/*.hpp" "${CMAKE_CURRENT_LIST_DIR}/*.cpp")
set(VAR_MODULE_SOURCES ${VAR_MODULE_SOURCES} ${SOURCES_IN_CURRENT_DIR} PARENT_SCOPE)
