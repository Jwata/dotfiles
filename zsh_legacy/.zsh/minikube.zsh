if [ $commands[minikube] ]; then
  minikube() {
    unfunction "$0"
    source <(minikube docker-env)
    $0 "$@"
  }
fi
