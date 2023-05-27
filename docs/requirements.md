# Requirements

## Flux

To manage the cluster using flux, you need to install flux on the cluster. You can do this by running the following command:

```bash
# flux-system.yaml has been created by the bootstrap command: `flux install --export > cluster/bootstrap/flux-system.yaml`
$ kubectl apply -f cluster/bootstrap/flux-system.yaml
$ kubectl wait --for=condition=available --timeout=600s deploy --all -n flux-system
```

## Gitlab

You'll need a Gitlab account to store the secrets.

**TODO**: Add instructions to create the project and the secrets.

## External Secret Operator

As mentioned above, I use Gitlab to store secrets, then I use the External Secret Operator to retrieve them and store them in the cluster.
It requires a secret to be created in the cluster. You can create it by running the following command:

```bash
$ kubectl create -n kube-system secret generic gitlab --from-literal=token=<token>
```

## k8s-csi-s3

[k8s-csi-s3](https://github.com/yandex-cloud/k8s-csi-s3)

It requires a series of secrets to be created in the cluster. You'll need to create an S3 bucket and an programmatic user with access to that bucket.
Then,

