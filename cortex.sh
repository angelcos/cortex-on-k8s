#!/bin/sh

set -eu

# Default values
VERBOSE=1

. ./scripts/.cortex.conf
. ./scripts/cmd_deploy.sh
. ./scripts/cmd_minikube.sh
. ./scripts/common_functions.sh
. ./scripts/help.sh


check_requirements

echo

if [ -z "$*" ]; then
  echo_warning "missing command"
  echo
  echo
  exit 1
fi

COMMAND=$1
shift

# Check which command is requested
case $COMMAND in
  start)
    minikube_start
    echo_done "Start done"
    exit 0
  ;;

  stop)
    minikube_stop
    echo_done "Stop done"
    exit 0
  ;;

  delete)
    minikube_delete
    echo_done "Delete done"
    exit 0
  ;;

  deploy)
    deploy
    echo_done "Deploy done"
    exit 0
  ;;

  help)
    show_help
    exit 0
  ;;

  *)
    echo_warning "unknown command: $(echo_yellow "$COMMAND")"
    echo
    echo
    show_help
    exit 1

esac
