#!/bin/sh

[ ! -f "openssl-3.0.7.patch" ] && { echo "You must be in the recipes/ directory first." >&2; exit 1; }

mkdir -p ${COSMO_SYSROOT}/src
cp openssl-3.0.7.patch ${COSMO_SYSROOT}/src || exit 1
cd ${COSMO_SYSROOT}/src || exit 1


wget https://www.openssl.org/source/openssl-3.0.7.tar.gz -O openssl-3.0.7.tar.gz || exit 1
tar xzf openssl-3.0.7.tar.gz || exit 1
patch -p1 < openssl-3.0.7.patch || exit 1

CC=cosmocc CXX=cosmoc++ AR=cosmoar LD=cosmold MAKEDEPPROG=cosmocc \
  ./Configure linux-generic64 no-shared no-dso no-dynamic-engine no-afalgeng \
  -DL_ENDIAN -UHAVE_DLINFO --prefix="${COSMO_SYSROOT}" --openssldir="${COSMO_SYSROOT}" || exit 1

make -j$(nproc) || exit 1
