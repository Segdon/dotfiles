#!/usr/bin/env bash

BASE_DIR=$(dirname "${BASH_SOURCE[0]:-$0}")
cd "${BASE_DIR}/.." || exit 127

# shellcheck source=../scripts/utils.sh
. scripts/utils.sh

symlink ~/.dotfiles/sqlite/sqliterc ~/.sqliterc

install_package sqlitebrowser
