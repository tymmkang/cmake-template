# SourceGroup.cmake

function(FUNC_FIX_PATH_FOR_GROUP_SOURCE IN_PATH_TO_FIX OUT_FIXED_PATH)
    set(RETURN ${IN_PATH_TO_FIX})

    if(MSVC)
        string(REPLACE "/" "\\" RETURN ${IN_PATH_TO_FIX})
    endif()

    set(${OUT_FIXED_PATH} ${RETURN} PARENT_SCOPE)
endfunction()

function(FUNC_GROUP_SOURCE IN_SOURCE_LIST_TO_GROUP IN_GROUP_ROOT)
    foreach(SOURCE ${IN_SOURCE_LIST_TO_GROUP})
        file(RELATIVE_PATH RELATIVE ${IN_GROUP_ROOT} ${SOURCE})
        get_filename_component(PARENT_DIR ${RELATIVE} DIRECTORY)

        if(NOT ${PARENT_DIR} STREQUAL "")
            FUNC_FIX_PATH_FOR_GROUP_SOURCE(${PARENT_DIR} FIXED_PARENT_DIR)
            source_group(${FIXED_PARENT_DIR} FILES ${SOURCE})
        else()
            source_group("" FILES ${SOURCE})
        endif()
    endforeach()
endfunction()

function(FUNC_GROUP_SOURCE_WITH_FRONT_PATH IN_SOURCE_LIST_TO_GROUP IN_GROUP_ROOT IN_FRONT_ADDITIONAL_PATH)
    foreach(SOURCE ${IN_SOURCE_LIST_TO_GROUP})
        file(RELATIVE_PATH RELATIVE ${IN_GROUP_ROOT} ${SOURCE})
        get_filename_component(PARENT_DIR ${RELATIVE} DIRECTORY)

        if(NOT ${parentDir} STREQUAL "")
            FUNC_FIX_PATH_FOR_GROUP_SOURCE("${IN_FRONT_ADDITIONAL_PATH}/${PARENT_DIR}" FIXED_PARENT_DIR)
            source_group(${FIXED_PARENT_DIR} FILES ${SOURCE})
        else()
            source_group("${IN_FRONT_ADDITIONAL_PATH}" FILES ${SOURCE})
        endif()
    endforeach()
endfunction()
