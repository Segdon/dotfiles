#!/usr/bin/env bash

set -Eeuo pipefail

SCRIPTS_DIR=$(dirname "${BASH_SOURCE[0]:-$0}")

VERSION=0.3.0

__ansi() {
  echo -e "\e[${1}m${*:2}\e[0m"
}

function bold() {
  __ansi 1 "$@"
}

function italic() {
  __ansi 3 "$@"
}

function underline() {
  __ansi 4 "$@"
}

function strikethrough() {
  __ansi 9 "$@"
}

cat <<EOF
╔══════╗
║ ${PURPLE}I3WM${RESET} ╠═════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════
╚══════╝
┌──────┐
│ ${PURPLE}I3WM${RESET} ╞═════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════
└──────┘
 
┌──────┐
│ ${PURPLE}I3WM${RESET} ├─────────────────────────────────────────────────────────────────────────────────────────────
└──────┘
EOF
echo "═════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════"