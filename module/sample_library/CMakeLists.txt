# Module 'sample_library'

set(VAR_MODULE_NAME_SAMPLE_LIBRARY "sample_library" CACHE INTERNAL "sample_library")
set(VAR_MODULE_NAME ${VAR_MODULE_NAME_SAMPLE_LIBRARY}) # For local use 

##################################################
# Option
##################################################

OPTION(OPT_SAMPLE_LIBRARY_SHARED_LIB OFF)

OPTION(OPT_SAMPLE_LIBRARY_INSTALL ON)

##################################################
# ~Option
##################################################

##################################################
# Configure
##################################################

if(OPT_SAMPLE_LIBRARY_SHARED_LIB)
    SET(CONF_SAMPLE_LIBRARY_SHARED_LIB 1)
else()
    SET(CONF_SAMPLE_LIBRARY_SHARED_LIB 0)
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

if(OPT_SAMPLE_LIBRARY_SHARED_LIB)
    add_library(${VAR_MODULE_NAME} SHARED ${VAR_EXPOSED_SOURCES} ${VAR_INTERNAL_SOURCES})
    target_compile_definitions(${VAR_MODULE_NAME} PRIVATE "BUILD_SHARED_LIB")
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

if(OPT_SAMPLE_LIBRARY_INSTALL)

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

macro(FUNC_ADD_SAMPLE_LIBRARY TARGET)
    message(STATUS "Add '${VAR_MODULE_NAME_SAMPLE_LIBRARY}' to '${TARGET}'")
    add_dependencies(${TARGET} ${VAR_MODULE_NAME_SAMPLE_LIBRARY})
    target_link_libraries(${TARGET} PRIVATE ${VAR_MODULE_NAME_SAMPLE_LIBRARY})
    include_directories("${CMAKE_SOURCE_DIR}/${VAR_DIR_NAME_MODULE}/${VAR_MODULE_NAME_SAMPLE_LIBRARY}/include")
endmacro()

##################################################
# ~Add library function  
##################################################
