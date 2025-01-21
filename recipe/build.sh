#!/bin/bash

set -euxo pipefail

rm -rf build || true

# get torch libraries for osx-arm64
LIBTORCH_DIR=${BUILD_PREFIX}
if [[ "$OSTYPE" == "darwin"* && $OSX_ARCH == "arm64" ]]; then
    LIBTORCH_DIR=${RECIPE_DIR}/libtorch
    conda list -p ${BUILD_PREFIX} > packages.txt
    cat packages.txt
    PYTORCH_PACKAGE_VERSION=`grep pytorch packages.txt | head -n 1 | awk -F ' ' '{print $2}'`
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

declare -a CUDA_CONFIG_ARGS
if [ ${cuda_compiler_version} != "None" ]; then
    # Output format from torch._C._cuda_getArchFlags(): 'sm_35 sm_50 sm_60 sm_61 sm_70 sm_75 sm_80 sm_86 compute_86'
    # We need to turn this into: "3.5;5.0;6.0;6.1;7.0;7.5;8.0;8.6" for TORCH_CUDA_ARCH_LIST (which overrides CMake-native option)
    # There is a higher level function, called torch.cuda.get_arch_list, but it returns an empty list when there is no GPU available.
    # Should that fail, this could be used instead:
    # $ cuobjdump $(find $CONDA_PREFIX -name "libtorch_cuda.so")  | grep arch | awk '{print $3}' | sort | uniq | sed 's+sm_\([0-9]\)\([0-9]\)+\1.\2+g' | tr '\n' ';'
    ARCH_LIST=$(${PYTHON} -c "import torch; print(';'.join([f'{y[0]}.{y[1]}' for y in [x[3:] for x in torch._C._cuda_getArchFlags().split() if x.startswith('sm_')]]))")
    # CMakeLists.txt seems to ignore the CMAKE_CUDA_ARCHITECTURES variable, instead, it is overwritten by TORCH_CUDA_ARCH_LIST
    CMAKE_FLAGS+=" -DTORCH_CUDA_ARCH_LIST=${ARCH_LIST}"
    if [ majorversion ${cuda_compiler_version} -ge 12 ]; then
	# This is required because conda-forge stores cuda headers in a non standard location
	export CUDA_INC_PATH=$CONDA_PREFIX/$targetsDir/include
    fi
else
    CMAKE_FLAGS+=" -DENABLE_CUDA=OFF"
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
mkdir -p ${PREFIX}/share/${PKG_NAME}/tests/tests
cp ${SRC_DIR}/tests/generate.py ${PREFIX}/share/${PKG_NAME}/tests/tests/
(cd ${PREFIX}/share/${PKG_NAME}/tests/tests/ && python generate.py)
ls -l ${PREFIX}/share/${PKG_NAME}/tests
ls -l ${PREFIX}/share/${PKG_NAME}/tests/tests

if [[ "$OSTYPE" == "darwin"* && $OSX_ARCH == "arm64" ]]; then
    # clean up, otherwise, environment is stored in package
    rm -fr ${LIBTORCH_DIR}
fi
