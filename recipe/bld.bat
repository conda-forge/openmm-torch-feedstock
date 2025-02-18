@echo on
setlocal EnableDelayedExpansion

if exist build rd /s /q build

:: Create build directory and cd into it
mkdir build
cd build

:: Set up CMake flags
set "CMAKE_FLAGS=-DBUILD_TESTING=ON"
set "CMAKE_FLAGS=!CMAKE_FLAGS! -DOPENMM_DIR=%PREFIX%/Library"
set "CMAKE_FLAGS=!CMAKE_FLAGS! -DPYTORCH_DIR=%SP_DIR%/torch"
set "CMAKE_FLAGS=!CMAKE_FLAGS! -DTorch_DIR=%SP_DIR%/torch/share/cmake/Torch"
set "CMAKE_FLAGS=!CMAKE_FLAGS! -DNN_BUILD_PYTHON_WRAPPERS=ON"
:: OpenCL flags
set "CMAKE_FLAGS=!CMAKE_FLAGS! -DNN_BUILD_OPENCL_LIB=ON"
set "CMAKE_FLAGS=!CMAKE_FLAGS! -DOPENCL_INCLUDE_DIR=%PREFIX%/Library/include"
set "CMAKE_FLAGS=!CMAKE_FLAGS! -DOPENCL_LIBRARY=%PREFIX%/Library/lib/OpenCL.lib"

:: CUDA configuration
if "%cuda_compiler_version%" == "None" (
    set "CMAKE_FLAGS=!CMAKE_FLAGS! -DENABLE_CUDA=OFF"
) else (
    :: Get CUDA architecture list from PyTorch
    for /f "tokens=*" %%i in ('python -c "import torch; print(';'.join([f'{y[0]}.{y[1]}' for y in [x[3:] for x in torch._C._cuda_getArchFlags().split() if x.startswith('sm_')]]))"') do set "ARCH_LIST=%%i"
    set "TORCH_CUDA_ARCH_LIST=!ARCH_LIST!"
    set "TORCH_NVCC_FLAGS=-Xfatbin -compress-all"
    set MAGMA_HOME=%LIBRARY_PREFIX%
    set "PATH=%CUDA_BIN_PATH%;%PATH%"
    set CUDNN_INCLUDE_DIR=%LIBRARY_PREFIX%\include
    set "CUDA_VERSION=%cuda_compiler_version%"
)

set CMAKE_INCLUDE_PATH=%LIBRARY_PREFIX%\include
set LIB=%LIBRARY_PREFIX%\lib;%LIB%

set "CMAKE_INSTALL_PREFIX=%PREFIX%/Library"
set CMAKE_GENERATOR=Ninja
set "CMAKE_GENERATOR_TOOLSET="
set "CMAKE_GENERATOR_PLATFORM="
set "CMAKE_PREFIX_PATH=%LIBRARY_PREFIX%"
set "CMAKE_INCLUDE_PATH=%LIBRARY_INC%"
set "CMAKE_LIBRARY_PATH=%LIBRARY_LIB%"
set "CMAKE_BUILD_TYPE=Release"

@REM The activation script for cuda-nvcc doesnt add the CUDA_CFLAGS on windows.
@REM Therefore we do this manually here. See:
@REM https://github.com/conda-forge/cuda-nvcc-feedstock/issues/47
echo "CUDA_CFLAGS=%CUDA_CFLAGS%"
set "CUDA_CFLAGS=-I%PREFIX%/Library/include -I%BUILD_PREFIX%/Library/include"
set "CFLAGS=%CFLAGS% %CUDA_CFLAGS%"
set "CPPFLAGS=%CPPFLAGS% %CUDA_CFLAGS%"
set "CXXFLAGS=%CXXFLAGS% %CUDA_CFLAGS%"
echo "CUDA_CFLAGS=%CUDA_CFLAGS%"
echo "CXXFLAGS=%CXXFLAGS%"

:: Configure and build
cmake %CMAKE_ARGS% %CMAKE_FLAGS% %SRC_DIR%
if errorlevel 1 exit 1

cmake --build . --config Release --target install
if errorlevel 1 exit 1

cmake --build . --config Release --target PythonInstall
if errorlevel 1 exit 1

:: Copy test executables
mkdir "%PREFIX%\share\%PKG_NAME%\tests"
for /r %%i in (Test*.exe) do (
    copy "%%i" "%PREFIX%\share\%PKG_NAME%\tests\"
    if errorlevel 1 exit 1
)

:: Generate test files
mkdir "%PREFIX%\share\%PKG_NAME%\tests\tests"
copy "%SRC_DIR%\tests\generate.py" "%PREFIX%\share\%PKG_NAME%\tests\tests\"
if errorlevel 1 exit 1

cd "%PREFIX%\share\%PKG_NAME%\tests\tests"
python generate.py
if errorlevel 1 exit 1

dir "%PREFIX%\share\%PKG_NAME%\tests"
dir "%PREFIX%\share\%PKG_NAME%\tests\tests"