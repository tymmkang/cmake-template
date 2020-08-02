FUNC_GET_PARENT_DIRECTORY_NAME(${CMAKE_CURRENT_LIST_DIR} PARENT_DIR_NAME)
set("VAR_MODULE_NAME_${PARENT_DIR_NAME}" ${PARENT_DIR_NAME} CACHE INTERNAL ${PARENT_DIR_NAME})
set(VAR_MODULE_NAME "${VAR_MODULE_NAME_${PARENT_DIR_NAME}}") # For local use 
string(TOUPPER ${VAR_MODULE_NAME} VAR_UPPER_MODULE_NAME)
message(STATUS "module : ${VAR_MODULE_NAME}")

##################################################
# Option
##################################################

OPTION("OPT_${VAR_MODULE_NAME}_SHARED_LIB" OFF)

OPTION("OPT_${VAR_MODULE_NAME}_INSTALL" ON)

##################################################
# ~Option
##################################################

##################################################
# Configure
##################################################

if(OPT_${VAR_MODULE_NAME}_SHARED_LIB)
    SET(IS_SHARED_LIB 1)
else()
    SET(IS_SHARED_LIB 0)
endif()

CONFIGURE_FILE("Config.h.template" "${CMAKE_CURRENT_LIST_DIR}/include/${VAR_MODULE_NAME}/Config.h")

##################################################
# ~Configure
##################################################

##################################################
# Assemble source files 
##################################################

set(VAR_EXPOSED_SOURCES)
add_subdirectory("include")
FUNC_GROUP_SOURCE("${VAR_EXPOSED_SOURCES}" "${CMAKE_CURRENT_LIST_DIR}")

set(VAR_INTERNAL_SOURCES)
add_subdirectory("src")
FUNC_GROUP_SOURCE("${VAR_INTERNAL_SOURCES}" "${CMAKE_CURRENT_LIST_DIR}")

##################################################
# ~Assemble source files 
##################################################

##################################################
# Add library 
##################################################

if(OPT_${VAR_MODULE_NAME}_SHARED_LIB)
    add_library(${VAR_MODULE_NAME} SHARED ${VAR_EXPOSED_SOURCES} ${VAR_INTERNAL_SOURCES})
    target_compile_definitions(${VAR_MODULE_NAME} PRIVATE "${VAR_UPPER_MODULE_NAME}_BUILD_SHARED_LIB")
else()
    add_library(${VAR_MODULE_NAME} STATIC ${VAR_EXPOSED_SOURCES} ${VAR_INTERNAL_SOURCES})
endif()

set_target_properties(${VAR_MODULE_NAME} PROPERTIES
    OUTPUT_NAME                 "${VAR_MODULE_NAME}"
    RUNTIME_OUTPUT_DIRECTORY    "${CMAKE_SOURCE_DIR}/${VAR_DIR_NAME_OUTPUT}/$<CONFIG>"
    ARCHIVE_OUTPUT_DIRECTORY    "${CMAKE_SOURCE_DIR}/${VAR_DIR_NAME_OUTPUT}/$<CONFIG>"
    LIBRARY_OUTPUT_DIRECTORY    "${CMAKE_SOURCE_DIR}/${VAR_DIR_NAME_OUTPUT}/$<CONFIG>"
    FOLDER                      "${VAR_DIR_NAME_MODULE}"
)

##################################################
# ~Add library
##################################################

##################################################
# Install 
##################################################

if(OPT_${VAR_MODULE_NAME}_INSTALL)

    install(FILES ${VAR_EXPOSED_SOURCES} 
        DESTINATION "${VAR_MODULE_NAME}/${CMAKE_INSTALL_INCLUDEDIR}/${VAR_MODULE_NAME}"
    )

    install(TARGETS ${VAR_MODULE_NAME}
        EXPORT              "${VAR_MODULE_NAME}"
        RUNTIME DESTINATION "${VAR_MODULE_NAME}/${CMAKE_INSTALL_BINDIR}"
        ARCHIVE DESTINATION "${VAR_MODULE_NAME}/${CMAKE_INSTALL_LIBDIR}"
        LIBRARY DESTINATION "${VAR_MODULE_NAME}/${CMAKE_INSTALL_LIBDIR}"
    )

endif()

##################################################
# ~Install 
##################################################

##################################################
# Add library function 
##################################################

function(FUNC_ADD_${VAR_MODULE_NAME} TARGET)
    string(REPLACE "FUNC_ADD_" "" VAR_MODULE_NAME ${CMAKE_CURRENT_FUNCTION})
    message(STATUS "Add '${VAR_MODULE_NAME}' to '${TARGET}'")

    add_dependencies(${TARGET} ${VAR_MODULE_NAME})
    target_link_libraries(${TARGET} PRIVATE ${VAR_MODULE_NAME})
    include_directories("${CMAKE_SOURCE_DIR}/${VAR_DIR_NAME_MODULE}/${VAR_MODULE_NAME}/include")
endfunction()

##################################################
# ~Add library function  
##################################################
