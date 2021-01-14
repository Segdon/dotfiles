#!/usr/bin/env bash

BASE_DIR=$(dirname "${BASH_SOURCE[0]:-$0}")
cd "${BASE_DIR}/.." || exit 127

# shellcheck source=../scripts/utils.sh
. scripts/utils.sh

install_package ranger

mkdir -p ~/.config/ranger
symlink ~/.dotfiles/ranger/rc.conf ~/.config/ranger/rc.conf
