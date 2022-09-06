#!/bin/bash

set -euxo pipefail

rm -rf build || true

CMAKE_FLAGS="  -DCMAKE_INSTALL_PREFIX=${PREFIX}"
CMAKE_FLAGS+=" -DCMAKE_BUILD_TYPE=Release"

CMAKE_FLAGS+=" -DBUILD_TESTING=ON"
CMAKE_FLAGS+=" -DOPENMM_DIR=${PREFIX}"
CMAKE_FLAGS+=" -DPYTORCH_DIR=${SP_DIR}/torch"
CMAKE_FLAGS+=" -DTorch_DIR=${BUILD_PREFIX}/lib/python${PY_VER}/site-packages/torch/share/cmake/Torch"
# OpenCL
CMAKE_FLAGS+=" -DNN_BUILD_OPENCL_LIB=ON"
CMAKE_FLAGS+=" -DOPENCL_INCLUDE_DIR=${PREFIX}/include"
CMAKE_FLAGS+=" -DOPENCL_LIBRARY=${PREFIX}/lib/libOpenCL${SHLIB_EXT}"

# if CUDA_HOME is defined and not empty, we enable CUDA
if [[ -n ${CUDA_HOME-} ]]; then
    CMAKE_FLAGS+=" -DNN_BUILD_CUDA_LIB=ON"
fi

# Build in subdirectory and install.
mkdir -p build
cd build
#if [[ "$OSTYPE" == "darwin"* ]]; then
#    cmake ${CMAKE_ARGS} ${CMAKE_FLAGS} -DCMAKE_SHARED_LINKER_FLAGS_INIT="-undefined dynamic_lookup" ${SRC_DIR}
#else
    cmake ${CMAKE_ARGS} ${CMAKE_FLAGS} ${SRC_DIR}
#fi
make -j$CPU_COUNT install
make -j$CPU_COUNT PythonInstall


# Include test executables too
mkdir -p ${PREFIX}/share/${PKG_NAME}/tests
if [[ "$target_platform" == osx* ]]; then
    find . -name 'Test*' -perm +0111 -type f -exec cp {} ${PREFIX}/share/${PKG_NAME}/tests/ \;
else
    find . -name 'Test*' -executable -type f -exec cp {} ${PREFIX}/share/${PKG_NAME}/tests/ \;
fi
cp -r tests ${PREFIX}/share/${PKG_NAME}/tests/
ls -al ${PREFIX}/share/${PKG_NAME}/tests/

#if [[ "$OSTYPE" == "darwin"* && $(arch) == 'arm64' ]]; then
#    ${INSTALL_NAME_TOOL} -add_rpath @rpath/libtorch_cpu.dylib -add_rpath @rpath/libc10.dylib ${PREFIX}/lib/libOpenMMTorch.dylib
#    otool -L ${PREFIX}/lib/libOpenMMTorch.dylib
#fi