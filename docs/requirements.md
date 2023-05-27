# Requirements

## Flux

To manage the cluster using flux, you need to install flux on the cluster. You can do this by running the following command:

```bash
# flux-system.yaml has been created by the bootstrap command: `flux install --export > cluster/bootstrap/flux-system.yaml`
$ kubectl apply -f cluster/bootstrap/flux-system.yaml
```

## External Secret Operator

I use Gitlab to store secrets, then I use the External Secret Operator to retrieve them and store them in the cluster.

Required secrets to be configured in Gitlab.

- `GITHUB_PAT`: Github Personal Access Token to push to the repository.

