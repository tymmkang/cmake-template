# Directory.cmake

# Get subdirectories in target directory
# IN_DIRECTORY[in]      Target directory to get subdirectory
# OUT_RESULT[out]       Subdirectories in target directory
function(FUNC_GET_SUBDIRECTORIES IN_DIRECTORY OUT_RESULT)
    file(GLOB CHILDREN RELATIVE ${IN_DIRECTORY} ${IN_DIRECTORY}/*)

    set(DIR_LIST)
    foreach(CHILD ${CHILDREN})
        if(IS_DIRECTORY ${IN_DIRECTORY}/${CHILD})
            set(DIR_LIST ${DIR_LIST} ${CHILD})
        endif() 
    endforeach()

    set(${OUT_RESULT} ${DIR_LIST} PARENT_SCOPE)
endfunction()

# Get name of parent directory(Not path)
# IN_PATH[in]       Target path to get parent directory
#OUT_RESULT[out]    Return string of parent directory name
function(FUNC_GET_PARENT_DIRECTORY_NAME IN_PATH OUT_RESULT)
    get_filename_component(PARENT_DIR ${IN_PATH} DIRECTORY)
    file(RELATIVE_PATH RELATIVE ${PARENT_DIR} ${CMAKE_CURRENT_LIST_DIR})
    set(${OUT_RESULT} ${RELATIVE} PARENT_SCOPE)
endfunction()
