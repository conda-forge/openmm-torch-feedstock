@echo on
setlocal EnableDelayedExpansion

if exist build rd /s /q build

:: Create build directory and cd into it
mkdir build
cd build

:: Set up CMake flags
set "CMAKE_FLAGS=-DCMAKE_INSTALL_PREFIX=%PREFIX%"
set "CMAKE_FLAGS=!CMAKE_FLAGS! -DCMAKE_BUILD_TYPE=Release"
set "CMAKE_FLAGS=!CMAKE_FLAGS! -DBUILD_TESTING=ON"
set "CMAKE_FLAGS=!CMAKE_FLAGS! -DOPENMM_DIR=%PREFIX%"
set "CMAKE_FLAGS=!CMAKE_FLAGS! -DPYTORCH_DIR=%SP_DIR%/torch"
set "CMAKE_FLAGS=!CMAKE_FLAGS! -DTorch_DIR=%SP_DIR%/torch/share/cmake/Torch"
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
    set "CMAKE_FLAGS=!CMAKE_FLAGS! -DTORCH_CUDA_ARCH_LIST=!ARCH_LIST!"
    
    :: Set CUDA include path for newer CUDA versions
    if %cuda_compiler_version:~0,2% GEQ 12 (
        set "CUDA_INC_PATH=%CONDA_PREFIX%\Library\include"
    )
)

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