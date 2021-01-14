#!/usr/bin/env bash

BASE_DIR=$(dirname "${BASH_SOURCE[0]:-$0}")
cd "${BASE_DIR}/.." || exit 127

# shellcheck source=../scripts/utils.sh
. scripts/utils.sh

install_package rofi

mkdir -p ~/.config/rofi
symlink ~/.dotfiles/rofi/config ~/.config/rofi/config
