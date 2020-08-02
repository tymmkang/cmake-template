# List of module

set(VAR_PRIMAL_MODULES "external")

foreach(PRIMAL_MODULE ${VAR_PRIMAL_MODULES})
    add_subdirectory(${PRIMAL_MODULE})
endforeach()

set(VAR_MODULES)
FUNC_GET_SUBDIRECTORIES(${CMAKE_CURRENT_SOURCE_DIR} VAR_MODULES)

list(REMOVE_ITEM VAR_MODULES ${VAR_PRIMAL_MODULES})

foreach(MODULE ${VAR_MODULES})
    add_subdirectory(${MODULE})
endforeach()
