# Get GCP Account Json or Keyfile
Run the script.
./sa-gcp.sh
Note: Change the PROJECT_ID and SA_NAME according to usage

# Create a Provider Secret
  1 .Use the following command to create kubernetes secret from service account JSON file.
   kubectl create secret generic gcp-creds -n crossplane-system --from-file=creds=./creds.json

# Configure the Provider
1. We will create the ProviderConfig object to configure credentials for GCP Provider.
2 . Run the provider.sh script
./gpc-provider.sh
Note: Change the PROJECT_ID according to usage

# Provision Infrastructure
1. Create VPC Network
kubectl apply -f network.yaml
# Create subnetwork
1. kubectl apply -f subnetwork.yaml
# Create GKE Cluster
1. kubectl apply -f cluster.yaml
# ADD Nodepool of Cluster 
kubectl apply -f nodepool.yaml
# Generate kubeconfig file 
