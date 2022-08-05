CMAKE_MINIMUM_REQUIRED(VERSION 2.8.12)
PROJECT(temp01)
set(CMAKE_CXX_STANDARD 14)

add_subdirectory(${CMAKE_CURRENT_LIST_DIR}/comp01)
# add_subdirectory(${CMAKE_CURRENT_LIST_DIR}/src/drivers/error_led)
# add_subdirectory(${CMAKE_CURRENT_LIST_DIR}/src/HAL/pedal)
# add_subdirectory(${CMAKE_CURRENT_LIST_DIR}/src/SAL/torque)

#set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++98 -g -o0 -fpermissive" CACHE STRING "CXXFLAGS append" FORCE)
#################################################################################
include_directories(
		${CMAKE_CURRENT_LIST_DIR}
)

#file(GLOB_RECURSE ${PROJECT_NAME}_PUBLIC_SRC
#	${CMAKE_CURRENT_LIST_DIR}/source/*.c
#	${CMAKE_CURRENT_LIST_DIR}/source/*.cpp
#)

file(GLOB ${PROJECT_NAME}_PUBLIC_HEADER
		${CMAKE_CURRENT_LIST_DIR}/*.h
		${CMAKE_CURRENT_LIST_DIR}/*.hpp
		)

set(${PROJECT_NAME}_PUBLIC_SRC
		${CMAKE_CURRENT_LIST_DIR}/main.cpp
		)

add_executable(${PROJECT_NAME}
		${${PROJECT_NAME}_PUBLIC_SRC}
		)

set(CMAKE_PROJ_EXE ${PROJECT_NAME})
configure_file(
    ${CMAKE_SOURCE_DIR}/launcher.bat.in
    ${CMAKE_BINARY_DIR}/launcher.bat 
)
install (FILES  ${CMAKE_BINARY_DIR}/launcher.bat DESTINATION .)

target_link_libraries(${PROJECT_NAME} PUBLIC Comp01)
# target_link_libraries(${PROJECT_NAME} PUBLIC errorled)
# target_link_libraries(${PROJECT_NAME} PUBLIC pedal)
# target_link_libraries(${PROJECT_NAME} PUBLIC torque)


# first we can indicate the documentation build as an option and set it to ON by default
option(BUILD_DOC "Build documentation" OFF)
if(BUILD_DOC)
    # check if Doxygen is installed
    find_package(Doxygen)
    if (DOXYGEN_FOUND)
        # set input and output files
        set(DOXYGEN_IN ${CMAKE_CURRENT_SOURCE_DIR}/doc/Doxyfile)
        set(DOXYGEN_OUT ${CMAKE_CURRENT_BINARY_DIR}/Doxyfile)

        # request to configure the file
        configure_file(${DOXYGEN_IN} ${DOXYGEN_OUT} @ONLY)
        message("Doxygen build started")

        # note the option ALL which allows to build the docs together with the application
        add_custom_target( doc_doxygen ALL
                COMMAND ${DOXYGEN_EXECUTABLE} ${DOXYGEN_OUT}
                WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
                COMMENT "Generating API documentation with Doxygen"
                VERBATIM )
    else (DOXYGEN_FOUND)
        message("Doxygen need to be installed to generate the doxygen documentation")
        endif (DOXYGEN_FOUND)
else (BUILD_DOC)
        message("Doxygen Documentation DISABLED!!")
endif (BUILD_DOC)

if(NOT DEFINED ${CMAKE_INSTALL_PREFIX})
    set(CMAKE_INSTALL_PREFIX "${CMAKE_CURRENT_LIST_DIR}/install")
endif(NOT DEFINED ${CMAKE_INSTALL_PREFIX})

install (FILES ${${PROJECT_NAME}_PUBLIC_HEADER} DESTINATION include)
install (TARGETS ${PROJECT_NAME} DESTINATION bin)
