@echo on
setlocal EnableDelayedExpansion

if exist build rd /s /q build

:: Create build directory and cd into it
mkdir build
cd build


cmake %SRC_DIR% -G Ninja -DCMAKE_INSTALL_PREFIX="%CONDA_PREFIX%\Library" -DTorch_DIR="%CONDA_PREFIX%\Lib\site-packages\torch\share\cmake\Torch" -DOPENMM_DIR="%CONDA_PREFIX%\Library" -DNN_BUILD_PYTHON_WRAPPERS=ON
if errorlevel 1 exit 1

:: check things with the config
ccmake %SRC_DIR%
cmake --build .
cmake --install .

:: manually fix setup.py torch_include_dirs line
cmake --build . -- PythonInstall