#!/bin/bash

SHORT_OS_STR=$(uname -s)

if [ "${SHORT_OS_STR:0:5}" == "Linux" ]; then
    cd $SRC_DIR
#    NT=$(cat /proc/cpuinfo | grep processor | wc -l)
    NT=10
    mkdir build && cd build

    cmake -DCMAKE_INSTALL_PREFIX=$PREFIX -DWITH_QT5=ON ..
    make install -j$NT

    cp -R $SRC_DIR/bin $PREFIX/
    cp -R $SRC_DIR/lib $PREFIX/
    cp -R $SRC_DIR/data $PREFIX/
    cp -R $SRC_DIR/include $PREFIX/
    cp -R $SRC_DIR/binaire-aux $PREFIX/
    cp -R $SRC_DIR/scripts $PREFIX/

fi
