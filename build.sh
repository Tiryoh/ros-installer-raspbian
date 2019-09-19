#!/usr/bin/env bash
set -eu

sudo apt install debhelper
pushd src && dpkg-buildpackage -r -uc -b && popd
#pushd src

#popd
