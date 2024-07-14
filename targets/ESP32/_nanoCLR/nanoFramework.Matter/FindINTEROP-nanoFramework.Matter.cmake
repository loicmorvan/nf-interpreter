#
# Copyright (c) .NET Foundation and Contributors
# See LICENSE file in the project root for full license information.
#

########################################################################################
# make sure that a valid path is set bellow                                            #
# this is an Interop module so this file should be placed in the CMakes module folder  #
# usually CMake\Modules                                                                #
########################################################################################

# native code directory
set(BASE_PATH_FOR_THIS_MODULE ${PROJECT_SOURCE_DIR}/InteropAssemblies/nanoFramework.Matter)


# set include directories
list(APPEND nanoFramework.Matter_INCLUDE_DIRS ${PROJECT_SOURCE_DIR}/src/CLR/Core)
list(APPEND nanoFramework.Matter_INCLUDE_DIRS ${PROJECT_SOURCE_DIR}/src/CLR/Include)
list(APPEND nanoFramework.Matter_INCLUDE_DIRS ${PROJECT_SOURCE_DIR}/src/HAL/Include)
list(APPEND nanoFramework.Matter_INCLUDE_DIRS ${PROJECT_SOURCE_DIR}/src/PAL/Include)
list(APPEND nanoFramework.Matter_INCLUDE_DIRS ${BASE_PATH_FOR_THIS_MODULE})


# source files
set(nanoFramework.Matter_SRCS

    nanoFramework_Matter.cpp


    nanoFramework_Matter_nanoFramework_Matter_Math_mshl.cpp
    nanoFramework_Matter_nanoFramework_Matter_Math.cpp

)

foreach(SRC_FILE ${nanoFramework.Matter_SRCS})

    set(nanoFramework.Matter_SRC_FILE SRC_FILE-NOTFOUND)

    find_file(nanoFramework.Matter_SRC_FILE ${SRC_FILE}
        PATHS
	        ${BASE_PATH_FOR_THIS_MODULE}
	        ${TARGET_BASE_LOCATION}
            ${PROJECT_SOURCE_DIR}/src/nanoFramework.Matter

	    CMAKE_FIND_ROOT_PATH_BOTH
    )

    if (BUILD_VERBOSE)
        message("${SRC_FILE} >> ${nanoFramework.Matter_SRC_FILE}")
    endif()

    list(APPEND nanoFramework.Matter_SOURCES ${nanoFramework.Matter_SRC_FILE})

endforeach()

include(FindPackageHandleStandardArgs)

FIND_PACKAGE_HANDLE_STANDARD_ARGS(nanoFramework.Matter DEFAULT_MSG nanoFramework.Matter_INCLUDE_DIRS nanoFramework.Matter_SOURCES)
