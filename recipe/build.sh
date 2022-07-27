#!/bin/bash

mkdir ${SRC_DIR}/build
cd ${SRC_DIR}/build
cmake .. -DBUILD_SHARED_LIBS=ON \
         -DCMAKE_BUILD_TYPE=Release \
         -DBUILD_TESTING=OFF \
         -DPYTHON_EXECUTABLE=${PYTHON} \
         -DCMAKE_INSTALL_PREFIX=${PREFIX}

make -j${CPU_COUNT:-4}
make install
