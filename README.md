# OpsMx-Crossplane
# Installing Crossplane
Create namespace.

```kubectl create namespace crossplane-system```
## Add Helm Chart.
```helm repo add crossplane-stable https://charts.crossplane.io/stable```
```helm repo update```
## Install crossplane using helm.
```helm install crossplane --namespace crossplane-system crossplane-stable/crossplane```
### Check the status.
```helm list -n crossplane-system ```
```kubectl get all -n crossplane-system```
## Install Crossplane CLI
## Install Crossplane CLI using script.
```curl -sL https://raw.githubusercontent.com/crossplane/crossplane/master/install.sh | sh```
## Install Provider
## Install GCP provider version 0.22.0 (latest) using crossplane CLI.
```kubectl crossplane install provider crossplane/provider-gcp:v0.21.0```
