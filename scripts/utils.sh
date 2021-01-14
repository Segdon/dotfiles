#!/usr/bin/env bash

# set -Eeuo pipefail

SCRIPTS_DIR=$(dirname "${BASH_SOURCE[0]:-$0}")

# shellcheck source=./colors.sh
. "${SCRIPTS_DIR}/colors.sh"
# shellcheck source=./extras.sh
. "${SCRIPTS_DIR}/extras.sh"

VERSION=0.3.0

function __log() {
  local LABEL="$1"
  local COLOR="$2"
  shift 2
  local MSG=("$@")
  # Get symbols from https://coolsymbol.com/
  printf "${COLOR}${BOLD}${LABEL}${RESET} ╞%*s\n" $(($(tput cols) - ${#LABEL} - 2)) | sed -e 's/ /═/g'
  for M in "${MSG[@]}"; do
    echo "• $M"
  done
  printf "%*s\n" $(tput cols) | sed -e 's/ /═/g'
}

function log_error() {
  __log "FAIL" "$RED" "$@"
}

function log_warn() {
  __log "WARN" "$ORANGE" "$@"
}

function log_success() {
  __log "OK" "$GREEN" "$@"
}

function log_info() {
  local LABEL="INFO"

  if ! [ "$#" -eq 1 ]; then
    LABEL=$(echo "$1" | tr '[a-z]' '[A-Z]')
    shift 1
  fi

  __log "${LABEL}" "$CYAN" "$@"
}

function log_section() {
  local LABEL="$1"
  local COLOR="$PURPLE"
  printf "[${COLOR}${BOLD}${LABEL}${RESET}]%*s\n" $(($(tput cols) - ${#LABEL} - 2)) | sed -e 's/ /═/g'
}

function not_installed() {
  [ ! -x "$(command -v "$@")" ]
}

function symlink() {
  local SRC="$1"
  local DST="$2"

  execute "ln -sfT ${SRC} ${DST}" "Symlinking $(basename $DST)"
}

function install_package() {
  local PKG="$1"
  ask_for_sudo

  execute "yay -Syyu ${PKG} --needed --noconfirm" "Installing ${BOLD}${PKG}${RESET}..."
}

function ask_for_sudo() {
  # Ask for the administrator password upfront.
  sudo -v &>/dev/null

  # Update existing `sudo` time stamp
  # until this script has finished.
  #
  # https://gist.github.com/cowboy/3118588
  while true; do
    sudo -n true
    sleep 60
    kill -0 "$$" || exit
  done &>/dev/null &
}
