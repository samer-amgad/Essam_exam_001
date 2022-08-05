# this one is important
SET(CMAKE_SYSTEM_NAME Windows CACHE STRING "")
#this one not so much
# SET(CMAKE_SYSTEM_VERSION 1)


file(TO_CMAKE_PATH $ENV{MINGW_PATH} mingw_32_path)

# SET(CMAKE_SYSROOT "${YOCTO_SDK}/ICAM_SDK_FRAMEWORK_WIN")
#SET(CMAKE_SYSROOT "${CMAKE_CURRENT_LIST_DIR}/install")


# specify the cross compiler
SET(CMAKE_C_COMPILER   "${mingw_32_path}/gcc.exe")

SET(CMAKE_CXX_COMPILER "${mingw_32_path}/g++.exe")
# include (CMakeForceCompiler)
set(CMAKE_TRY_COMPILE_TARGET_TYPE STATIC_LIBRARY)

set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM   NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE   ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY   ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_PACKAGE   ONLY)

# SET(CMAKE_SYSTEM_PROCESSOR arm)  

# set(CMAKE_C_FLAGS " -march=armv8-a -mtune=cortex-a57 -pipe -g -feliminate-unused-debug-types " CACHE STRING "CFLAGS" FORCE)
# set(CMAKE_CXX_FLAGS " -march=armv8-a -mtune=cortex-a57 -pipe -g -feliminate-unused-debug-types  -fvisibility-inlines-hidden " CACHE STRING "CXXFLAGS" FORCE)
# set(CMAKE_ASM_FLAGS " -march=armv8-a -mtune=cortex-a57 -pipe -g -feliminate-unused-debug-types " CACHE STRING "ASM FLAGS" FORCE)
# set(CMAKE_C_FLAGS_RELEASE "-DNDEBUG" CACHE STRING "Additional CFLAGS for release" FORCE)
# set(CMAKE_CXX_FLAGS_RELEASE "-DNDEBUG" CACHE STRING "Additional CXXFLAGS for release" FORCE)
# set(CMAKE_ASM_FLAGS_RELEASE "-DNDEBUG" CACHE STRING "Additional ASM FLAGS for release" FORCE)
# set(CMAKE_C_LINK_FLAGS "-march=armv8-a -mtune=cortex-a57 -Wl,--hash-style=gnu -Wl,--as-needed" CACHE STRING "LDFLAGS" FORCE)
# set(CMAKE_CXX_LINK_FLAGS "-march=armv8-a -mtune=cortex-a57 -fpermissive -pipe -g -feliminate-unused-debug-types -Wl,--hash-style=gnu -Wl,--as-needed" CACHE STRING "LDFLAGS" FORCE)

#set(CMAKE_INSTALL_PREFIX "${CMAKE_SYSROOT}/usr/")
set(CMAKE_INSTALL_PREFIX "${CMAKE_CURRENT_LIST_DIR}/install" CACHE PATH "Cmake prefix" FORCE )

# set(COMPONENT_TYPE "rcarhxx_a57")
# set(COMPONENT_ARCH "rcarhxx_a57")
# set(CMAKE_STAGING_LIBDIR "${CMAKE_SYSROOT}/usr/lib")
#set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11 -L${SDK_SYSROOT_DIR} -Wl,-rpath,${SDK_SYSROOT_DIR}")


if("${CMAKE_BUILD_TYPE}" MATCHES "release")
	set(CMAKE_BUILD_TYPE "Release")
	set(COMPONENT_LIB_TYPE "r")
else()
	set(CMAKE_BUILD_TYPE "RelWithDebInfo")
	set(COMPONENT_LIB_TYPE "d")
endif()


#link_directories(${CMAKE_INSTALL_PREFIX}/lib)
#include_directories(${CMAKE_INSTALL_PREFIX}/include)