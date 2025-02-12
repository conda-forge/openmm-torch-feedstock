@echo on
setlocal EnableDelayedExpansion

if exist build rd /s /q build

:: Create build directory and cd into it
mkdir build
cd build

:: Configure and build
cmake %CMAKE_ARGS% %CMAKE_FLAGS% %SRC_DIR%
if errorlevel 1 exit 1
