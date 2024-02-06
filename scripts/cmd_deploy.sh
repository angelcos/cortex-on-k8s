#!/bin/sh

deploy() {
  minikube_start
  create_namespace
  # clean_helm_deps
  deploy_helm_chart
}

clean_helm_deps() {
  rm -rf helm/cortex/charts/*
  helm dep update helm/cortex
}

create_namespace() {
  echo_info "📚️ Create Namespace if not exist..."
  NS=$(kubectl create ns "${NAMESPACE}" --dry-run=client -o yaml)
  echo "$NS" | kubectl apply > /dev/null -f - 2>&1
}

deploy_helm_chart() {
  echo_info "📦 Applying helm chart..."
	helm upgrade --wait --install --timeout=${TIMEOUT} --namespace ${NAMESPACE} ${RELEASE_NAME} helm/cortex
}
