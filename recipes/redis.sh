#!/bin/sh

[ ! -f "redis-7379d2219.patch" ] && { echo "You must be in the recipes/ directory first." >&2; exit 1; }

mkdir -p ${COSMO_SYSROOT}/src
cp redis-7379d2219.patch ${COSMO_SYSROOT}/src || exit 1
cd ${COSMO_SYSROOT}/src || exit 1

git clone https://github.com/redis/redis
cd redis || exit 1
git reset --hard 7379d2219620d809943f32a5d26137a077bbae37 || exit 1
git apply ../redis-7379d2219.patch || exit 1

make V=1 PREFIX="${COSMO_SYSROOT}" CC=cosmocc AR=cosmoar MALLOC=libc USE_SYSTEMD=no -j$(nproc) || exit 1
make PREFIX="${COSMO_SYSROOT}" install
