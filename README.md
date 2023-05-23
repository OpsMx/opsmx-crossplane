# OpsMx-Crossplane
# Installing Crossplane
Create namespace.
kubectl create namespace crossplane-system

```console
helm repo add crossplane-gcp https://opsmx.github.io/opsmx-crossplane/
```
## Install crossplane using helm.

```console
helm install crossplane-gcp/crossplane-gcp -n crossplane-system
```

### Check the status.
```console
helm list -n crossplane-system
```

```console
kubectl get all -n crossplane-system
```


## Install Crossplane CLI
## Install Crossplane CLI using script.
curl -sL https://raw.githubusercontent.com/crossplane/crossplane/master/install.sh | sh
## Install Provider
## Install GCP provider version 0.22.0 (latest) using crossplane CLI.
kubectl crossplane install provider crossplane/provider-gcp:v0.22.0
