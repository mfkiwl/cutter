#!/bin/bash

set -e

SCRIPTPATH=$(realpath "$(dirname "${BASH_SOURCE[0]}")")

cd "$SCRIPTPATH/.."

if [[ ! -d libswift ]]; then
	git clone https://github.com/rizinorg/rz-libswift.git --depth 1 libswift
fi

cd libswift
rm -rf build || sleep 0
mkdir build && cd build
meson --buildtype=release -Drizin_plugdir=share/rizin/plugins --libdir=share/rizin/plugins --datadir=share/rizin/plugins "$@" ..
ninja
ninja install

