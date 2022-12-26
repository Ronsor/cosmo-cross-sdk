# cosmo-cross-sdk

Cosmo-cross-sdk is a set of scripts to aid in building third-party software
with the [Cosmopolitan](https://github.com/jart/cosmopolitan) C library.

# Usage:

Set the `COSMO_REPO`, `COSMO_MODE`, and `COSMO_SYSROOT` to appropriate
values:

```bash
export COSMO_REPO=/path/to/git/cloned/repo # Path to cosmopolitan repo
export COSMO_MODE=rel # Build mode used
export COSMO_SYSROOT=$PWD/sysroot # Path to sysroot
export COSMO_STUBS=$PWD/lib
export PATH="$PWD/bin:$PATH"

mkdir -p ${COSMO_SYSROOT}/{lib,include}
cosmo-config --gen-stubs
```

Better documentation coming soon!
