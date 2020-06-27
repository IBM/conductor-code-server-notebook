#!/bin/bash

PACKAGE_NAME="code-server"
PACKAGE_VERSION="3.4.1"
BUILD_DIR=${BUILD_DIR:-./build}
DOWNLOAD_URL="https://github.com/cdr/code-server/releases/download/v3.4.1/code-server-3.4.1-linux-amd64.tar.gz"


if [ -d "$BUILD_DIR" ]; then
    rm -fr "$BUILD_DIR"
fi

mkdir -p $BUILD_DIR
cp -f deployment.xml $BUILD_DIR
cp -fr scripts $BUILD_DIR
mkdir -p $BUILD_DIR/package

cd $BUILD_DIR/package;curl -L ${DOWNLOAD_URL} --output code-server-${PACKAGE_VERSION}-linux-amd64.tar.gz
cd ..
tar czvf "${PACKAGE_NAME}-${PACKAGE_VERSION}.tar.gz" deployment.xml scripts package
