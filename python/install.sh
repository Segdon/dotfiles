#!/usr/bin/env bash

#set -Eeuo pipefail

BASE_DIR=$(dirname "${BASH_SOURCE[0]:-$0}")
cd "${BASE_DIR}/.." || exit 127

# shellcheck source=../scripts/utils.sh
. scripts/utils.sh

symlink ~/.dotfiles/python/default-python-packages ~/.default-python-packages
