#!/usr/bin/env bash

set -e

echo "*** Initializing WASM build environment"

if [ -z $CI_PROJECT_NAME ] ; then
   rustup update nightly-2020-07-10
   rustup update 1.45.0
   rustup default 1.45.0
fi

rustup target add wasm32-unknown-unknown --toolchain nightly-2020-07-10

# Install wasm-gc. It's useful for stripping slimming down wasm binaries.
command -v wasm-gc || \
	cargo +nightly install --git https://github.com/alexcrichton/wasm-gc --force
