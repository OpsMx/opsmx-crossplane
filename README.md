# OpsMx-Crossplane
# Installing Crossplane
Create namespace.
kubectl create namespace crossplane-system
## Clone the repo
git clone https://github.com/OpsMx/opsmx-crossplane.git -b cross-helm

    cd opsmx-crossplane
`helm repo add crossplane-gcp https://opsmx.github.io/opsmx-crossplane/`
## Install crossplane using helm.
`helm install crossplane --namespace crossplane-system gcp/`
### Check the status.
`helm list -n crossplane-system`
`kubectl get all -n crossplane-system`
## Install Crossplane CLI
## Install Crossplane CLI using script.
curl -sL https://raw.githubusercontent.com/crossplane/crossplane/master/install.sh | sh
## Install Provider
## Install GCP provider version 0.22.0 (latest) using crossplane CLI.
kubectl crossplane install provider crossplane/provider-gcp:v0.22.0
