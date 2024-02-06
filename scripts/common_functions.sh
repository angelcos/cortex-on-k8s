#!/bin/sh

check_requirements() {
  REQUIREMENTS_OK=1

  MINIKUBE_INSTALLED=$(cmd_installed minikube)
  [ "$MINIKUBE_INSTALLED" = "1" ] || { REQUIREMENTS_OK=0 && echo_warning "Missing Minikube installation"; }

  DOCKER_INSTALLED=$(cmd_installed docker)
  [ "$DOCKER_INSTALLED" = "1" ] || { REQUIREMENTS_OK=0 && echo_warning "Missing docker command"; }

  KUBECTL_INSTALLED=$(cmd_installed kubectl)
  [ "$KUBECTL_INSTALLED" = "1" ] || { REQUIREMENTS_OK=0 && echo_warning "Missing kubectl command"; }

  HELM_INSTALLED=$(cmd_installed helm)
  [ "$HELM_INSTALLED" = "1" ] || { REQUIREMENTS_OK=0 && echo_warning "Missing helm command"; }

  if [ "$REQUIREMENTS_OK" = "0" ]; then
    exit 1
  fi
}

cmd_installed() {
  if command -v "$1" >/dev/null 2>&1; then
    echo 1
  else
    echo 0
  fi
}


## Print lines helpers (NO DIRECT COLORING, call echo_<color> instead)
echo_run() {
  echo_info "  🏃 $*"
}

echo_warning() {
  echo "⚠️️  $(echo_yellow "$*") ⚠️️"
}

echo_fatal() {
  echo "⚠️️  $(echo_red "$*")"
  exit 1
}

echo_wait() {
  echo "⏳ $*"
}

echo_info() {
  echo_yellow "$*"
}

echo_check() {
  echo_light_green "✔ $*"
}

echo_done() {
  MSG=${1:-"Done"}
  echo
  echo_green "✔ ${MSG}."
  echo
}

echo_debug() {
  if [ "$DEBUG" = "1" ]; then
      echo "$* $*\n" "$(echo_red "[DEBUG]")" "$@"
  fi
}

# Coloring echo strings (NO NEW LINES HERE, use helpers instead)

echo_red() {
  echo "\033[31m$*\033[m\n"
}

echo_green() {
  echo "\033[92m$*\033[m"
}

echo_light_green() {
  echo "\033[32m$*\033[m"
}

echo_yellow() {
  echo "\033[33m$*\033[m"
}

echo_red() {
  echo "\033[31m$*\033[m"
}
