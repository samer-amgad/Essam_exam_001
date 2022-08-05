@echo off


@REM IF "%1"=="--clean" GOTO CLEAN
@REM IF "%1"=="-c" GOTO CLEAN

@REM Now your batch file handles %%A instead of %1
FOR %%A IN (%*) DO (
	IF "%%A"=="-c" GOTO CLEAN
	IF "%%A"=="-C" GOTO CLEAN
	IF "%%A"=="--clean" GOTO CLEAN
	IF "%%A"=="--Clean" GOTO CLEAN

	IF "%%A"=="-a" Call :CLEAN
	IF "%%A"=="-A" Call :CLEAN
	IF "%%A"=="--all" Call :CLEAN
	IF "%%A"=="--All" Call :CLEAN

	IF "%%A"=="-h" GOTO HELP
	IF "%%A"=="-H" GOTO HELP
	IF "%%A"=="--help" GOTO HELP
	IF "%%A"=="--Help" GOTO HELP
)

:BUILD
call :INFO "compilation starts ..."

if [%MINGW_PATH%]==[] (
	ECHO "An ERROR has occurred @line:"
	goto ERROR
) else (
	set MINGW_PATH_loc=%MINGW_PATH%
)

set PATHSAV=%PATH%

set PATH=%MINGW_PATH_loc%;%PATH%

@REM echo %PATH%

mkdir %~dp0\build\default

cd %~dp0\build\default

cmake.exe -DCMAKE_TOOLCHAIN_FILE="%~dp0\toolchain_mingw_win.cmake" -DCMAKE_MAKE_PROGRAM="make.exe" -G "MinGW Makefiles" -DCMAKE_VERBOSE_MAKEFILE:BOOL=OFF -DCMAKE_BUILD_TYPE=Debug --target install ../..
@REM cmake.exe -DCMAKE_MAKE_PROGRAM="make.exe" -G "MinGW Makefiles" -DCMAKE_VERBOSE_MAKEFILE:BOOL=OFF -DCMAKE_BUILD_TYPE=Debug -DCMAKE_INSTALL_PREFIX="../../install" ../..
make.exe install -j8 


set PATH=%PATHSAV%
cd %~dp0
call :INFO "compilation Ends ..."
EXIT /B %errorlevel%

:ERROR
ECHO [92m[Error] %~1 Oh no Oh no no no noooo!! [0m
EXIT /B %errorlevel%

:CLEAN
call :INFO "Cleaning build/install folders ..."
RMDIR /S/Q build
RMDIR /S/Q install
EXIT /B %errorlevel%

:HELP
ECHO This is the build script for the project.
ECHO This is a windows bat file to automate and execute the cmake cmd
ECHO PreRequists are either :
ECHO - adding MINGW_PATH to point on mingw/bin directory
ECHO - adding mingw/bin directory in the path Env var
Echo -----------------------------------------------------------------
ECHO build [options]
ECHO options are : 
ECHO     -C , -c , --clean       		Cleaning the project (delete build and install folders).
ECHO     -A , -a , --all         		Clean and build the project from scratch with no caches or tmps.
ECHO     -T , -t , --toolchain_file     Specify a toolchain cmake file to specify compiler and c/c++ flags.
ECHO     -H , -h , --help        		Getting this help message.
EXIT /B %errorlevel%

:INFO
echo [92m[Info] %~1 [0m
