CMAKE_MINIMUM_REQUIRED(VERSION 2.8.12)
PROJECT(Comp01)

set(LIBNAME ${PROJECT_NAME} CACHE STRING "LIBNAME" FORCE)

#set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++98 -g -o0 -fpermissive" CACHE STRING "CXXFLAGS append" FORCE)
#################################################################################
include_directories(
${CMAKE_CURRENT_LIST_DIR}
)

#file(GLOB_RECURSE ${LIBNAME}_PUBLIC_SRC 
#	${CMAKE_CURRENT_LIST_DIR}/source/*.c 
#	${CMAKE_CURRENT_LIST_DIR}/source/*.cpp
#)

file(GLOB ${LIBNAME}_PUBLIC_HEADER
				${CMAKE_CURRENT_LIST_DIR}/*.h
)

set(PRIVATE_HEADER_FILES "")

set(${LIBNAME}_PUBLIC_SRC
        ${CMAKE_CURRENT_LIST_DIR}/Comp_01.cpp
)

add_library(${LIBNAME} STATIC ${${LIBNAME}_PUBLIC_SRC} )

# target_link_libraries(${LIBNAME} PUBLIC adcDriver errorled)

target_include_directories(${LIBNAME} PUBLIC ${CMAKE_CURRENT_LIST_DIR} )

set(CMAKE_INSTALL_PREFIX "${CMAKE_CURRENT_LIST_DIR}/install")
install (FILES ${${LIBNAME}_PUBLIC_HEADER} DESTINATION include)
install (TARGETS ${LIBNAME} DESTINATION lib)
