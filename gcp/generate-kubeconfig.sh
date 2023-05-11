#!/bin/bash
# Authour : OpsMx

SERVICE_ACCOUNT_NAME=opsmx-target   #change required according to usage 
NAMESPACE=default                   #change if required
server=$(kubectl config view --minify --output jsonpath='{.clusters[*].cluster.server}')
context=$(kubectl config current-context)
name=$(kubectl config get-contexts "$context" | awk '{print $3}' | tail -n 1)
user=${SERVICE_ACCOUNT_NAME}-${NAMESPACE}-${name}

kubectl create serviceaccount ${SERVICE_ACCOUNT_NAME}-sa

kubectl create token ${SERVICE_ACCOUNT_NAME}-sa

cat << EOF | kubectl apply -f -
apiVersion: v1
kind: Secret
type: kubernetes.io/service-account-token
metadata:
   name: ${SERVICE_ACCOUNT_NAME}
   annotations:
      kubernetes.io/service-account.name: "${SERVICE_ACCOUNT_NAME}-sa"
EOF

kubectl create clusterrolebinding ${SERVICE_ACCOUNT_NAME}-rolebinding --clusterrole=cluster-admin --serviceaccount=${NAMESPACE}:${SERVICE_ACCOUNT_NAME}-sa

ca=$(kubectl get secret ${SERVICE_ACCOUNT_NAME} -n ${NAMESPACE} -o jsonpath='{.data.ca\.crt}')

token=$(kubectl get secret ${SERVICE_ACCOUNT_NAME}  -n ${NAMESPACE} -o jsonpath='{.data.token}' | base64 --decode)

echo "
apiVersion: v1
kind: Config
clusters:
- name: ${name}
  cluster:
    certificate-authority-data: ${ca}
    server: ${server}
contexts:
- name: ${user}-context
  context:
    cluster: ${name}
    namespace: ${NAMESPACE}
    user: ${user}
current-context: ${user}-context
users:
- name: ${user}
  user:
    token: ${token}
" > ${SERVICE_ACCOUNT_NAME}-kube.config
echo "${SERVICE_ACCOUNT_NAME}-kube.config  generated successfully .."
