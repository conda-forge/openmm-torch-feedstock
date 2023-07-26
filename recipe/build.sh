#!/bin/bash

set -euxo pipefail

rm -rf build || true

# get torch libraries for osx-arm64
LIBTORCH_DIR=${BUILD_PREFIX}
if [[ "$OSTYPE" == "darwin"* && $OSX_ARCH == "arm64" ]]; then
    LIBTORCH_DIR=${RECIPE_DIR}/libtorch
    conda list -p ${BUILD_PREFIX} > packages.txt
    cat packages.txt
    PYTORCH_PACKAGE_VERSION=`grep pytorch packages.txt | awk -F ' ' '{print $2}'`
    CONDA_SUBDIR=osx-arm64 conda create -y -p ${LIBTORCH_DIR} --no-deps pytorch=${PYTORCH_PACKAGE_VERSION} python=${PY_VER}
fi

CMAKE_FLAGS="  -DCMAKE_INSTALL_PREFIX=${PREFIX}"
CMAKE_FLAGS+=" -DCMAKE_BUILD_TYPE=Release"

CMAKE_FLAGS+=" -DBUILD_TESTING=ON"
CMAKE_FLAGS+=" -DOPENMM_DIR=${PREFIX}"
CMAKE_FLAGS+=" -DPYTORCH_DIR=${SP_DIR}/torch"
CMAKE_FLAGS+=" -DTorch_DIR=${LIBTORCH_DIR}/lib/python${PY_VER}/site-packages/torch/share/cmake/Torch"
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
cmake ${CMAKE_ARGS} ${CMAKE_FLAGS} ${SRC_DIR}
make -j$CPU_COUNT install
make -j$CPU_COUNT PythonInstall


# Include test executables too
mkdir -p ${PREFIX}/share/${PKG_NAME}/tests
if [[ "$target_platform" == osx* ]]; then
    find . -name 'Test*' -perm +0111 -type f -exec cp {} ${PREFIX}/share/${PKG_NAME}/tests/ \;
else
    find . -name 'Test*' -executable -type f -exec cp {} ${PREFIX}/share/${PKG_NAME}/tests/ \;
fi

# Generate test files
cp ${SRC_DIR}/tests/generate.py ${PREFIX}/share/${PKG_NAME}/tests
(cd ${PREFIX}/share/${PKG_NAME}/tests && python generate.py)
ls -l ${PREFIX}/share/${PKG_NAME}/tests

if [[ "$OSTYPE" == "darwin"* && $OSX_ARCH == "arm64" ]]; then
    # clean up, otherwise, environment is stored in package
    rm -fr ${LIBTORCH_DIR}
fi