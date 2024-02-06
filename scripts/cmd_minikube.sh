MINIKUBE_CHECK=0
minikube_start() {
  if [ "$MINIKUBE_CHECK" = "1" ]; then
    return
  fi

  MINIKUBE_STATUS=$(minikube status -p "$MINIKUBE_PROFILE" | grep apiserver | cut -d ' ' -f 2)

  case $MINIKUBE_STATUS in
    Running)
      echo_check "Minikube already running"
    ;;
    Stopped)
      echo_check "Restarting minikube profile"
      minikube start -p "$MINIKUBE_PROFILE" --kubernetes-version="$MINIKUBE_KUBERNETES_VERSION"
    ;;
    *)
      echo_wait "Creating new minikube profile"
      minikube start -p "$MINIKUBE_PROFILE" \
        --cpus="$MINIKUBE_CPUS" \
        --memory="$MINIKUBE_MEMORY" \
        --kubernetes-version="$MINIKUBE_KUBERNETES_VERSION" \
        --disk-size="$MINIKUBE_DISK_SIZE" \
        --driver="$MINIKUBE_DRIVER"

      minikube addons enable default-storageclass -p "$MINIKUBE_PROFILE" > /dev/null 2>&1
      minikube addons enable storage-provisioner -p "$MINIKUBE_PROFILE" > /dev/null 2>&1
    ;;
  esac
  MINIKUBE_CHECK=1
}

minikube_stop() {
  minikube -p "$MINIKUBE_PROFILE" stop
}

minikube_delete() {
  minikube -p "$MINIKUBE_PROFILE" delete
}
