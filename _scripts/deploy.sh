#!/usr/bin/env bash
#
# Build and push Docker images to Docker Hub and quay.io.
#

cd "$(dirname "$0")" || exit 1

# push to quay
export IMAGE_PREFIX=arschles
docker login -e="$QUAY_EMAIL" -u="$QUAY_USERNAME" -p="$QUAY_PASSWORD" quay.io
make -C .. docker-build docker-push

# install the kubeconfig file from the env var, then tell helm where to find it 
# (with the KUBECONFIG env var)
echo $KUBECONFIG_DATA_BASE64 | base64 --decode > ./kubeconfig
export KUBECONFIG=./kubeconfig

# download the helm CLI and calling 'helm upgrade'
curl -o helm https://storage.googleapis.com/kubernetes-helm/helm-v2.2.2-darwin-amd64.tar.gz
chmod +x helm
LAST_RELEASE=$(helm list -q)
helm upgrade $LAST_RELEASE ../chart
