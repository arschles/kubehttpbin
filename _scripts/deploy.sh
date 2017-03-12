#!/usr/bin/env bash
#
# Build and push Docker images to Docker Hub and quay.io.
#

cd "$(dirname "$0")" || exit 1

# push to quay
export IMAGE_PREFIX=arschles
docker login -e="$QUAY_EMAIL" -u="$QUAY_USERNAME" -p="$QUAY_PASSWORD" quay.io
make -C .. docker-build docker-push

# tell helm where to find the kubeconfig file. note that travis will decrypt the kubeconfig
# file to this location. See the 'before_install' step in the .travis.yml file
export KUBECONFIG=./kubeconfig

# download the helm CLI and calling 'helm upgrade'
curl -o helm https://storage.googleapis.com/kubernetes-helm/helm-v2.2.2-darwin-amd64.tar.gz
chmod +x helm
LAST_RELEASE=$(helm list -q)
helm upgrade $LAST_RELEASE ../chart
