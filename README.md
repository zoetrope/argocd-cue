# Argo CD with CUE

* Argo CD: https://argoproj.github.io/argo-cd/
* CUE: https://cuelang.org/

## Setup

### Install kind.

```console
go get -u sigs.k8s.io/kind@v0.6.0
```

https://kind.sigs.k8s.io/docs/user/quick-start/

### Install kubectl

https://kubernetes.io/docs/tasks/tools/install-kubectl/

### Install argocd cli

https://github.com/argoproj/argo-cd/blob/master/docs/getting_started.md

## Demo

Create a Kubernetes cluster.

```console
kind create cluster --name argocd-cue
```

Build the Docker container image.

```console
docker build -t argocd-cue:v1 .
```

Load the container image on the kind cluster.

```console
kind load docker-image argocd-cue:v1 --name argocd-cue
```

Deploy ArgoCD.

```console
kubectl create ns argocd
kubectl apply -f install.yaml -n argocd
```

Login to Argo CD

```
kubectl port-forward -n argocd svc/argocd-server 8080:443
kubectl get pods -n argocd -l app.kubernetes.io/name=argocd-server -o name | cut -d'/' -f 2
<ADMIN PASSWORD>
argocd login --insecure localhost:8080
Username: admin
Password: <ADMIN PASSWORD>
```

Create an application

```console
argocd app create test \
    --repo https://github.com/zoetrope/argocd-cue.git \
    --path sample \
    --dest-server https://kubernetes.default.svc \
    --dest-namespace default \
    --config-management-plugin cue
```

Sync

```console
argocd app sync test
```
