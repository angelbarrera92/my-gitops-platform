# my-gitops-platform

## Quick Start

```bash
$ kind create cluster
$ kubectl apply -f https://raw.githubusercontent.com/angelbarrera92/my-gitops-platform/main/cluster/bootstrap/flux-system.yaml
$ kubectl wait --for=condition=available --timeout=600s deploy --all -n flux-system
# Do not forget to create the right secret to use the ExternalSecretOperator. Secret at kube-system/gitlab. It must contain the `token` with the value of the gitlab token with the `api` scope.
# $ kubectl create -n kube-system secret generic gitlab --from-literal=token=<token>
$ kubectl apply -f https://raw.githubusercontent.com/angelbarrera92/my-gitops-platform/main/cluster/bootstrap/config/bootstrap.yaml
```
