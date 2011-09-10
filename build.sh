#!/bin/bash
set -e -x

ROOT=${NACL_TOOLCHAIN_ROOT:-$HOME/root/nacl-sdk}
PATH=$ROOT/bin:$ROOT/x86_64-nacl/usr/bin:$PATH

export SDL_LIBS="-L$ROOT/x86_64-nacl/usr/lib -lSDL -lppapi_cpp -lpthread -lm"
CC=x86_64-nacl-gcc AR=x86_64-nacl-ar RANLIB=x86_64-nacl-ranlib PKG_CONFIG_LIBDIR=$ROOT/x86_64-nacl/usr/lib/pkgconfig \
  ./configure --host=x86_64-nacl --prefix=$ROOT/x86_64-nacl/usr --without-x
make
make install

