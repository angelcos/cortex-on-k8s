show_help() {
  echo "  $(echo_green "./cortex.sh") -- a tool to manage Cortex environment during development.

    commands:
      start   starts minikube cortex profile.
      stop    stops minikube cortex profile.
      delete  delete minikube resources (containers) for cortex profile.
      deploy  calls helm to install/upgrade a Cortex release on minikube.
"
}