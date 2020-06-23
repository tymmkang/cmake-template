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
