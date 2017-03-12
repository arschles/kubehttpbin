#!/usr/bin/env bash
#
# Build and push Docker images to Docker Hub and quay.io.
#

cd "$(dirname "$0")" || exit 1

curl -o helm https://storage.googleapis.com/kubernetes-helm/helm-v2.2.2-darwin-amd64.tar.gz
chmod +x helm

export IMAGE_PREFIX=arschles
docker login -e="$QUAY_EMAIL" -u="$QUAY_USERNAME" -p="$QUAY_PASSWORD" quay.io
make -C .. docker-build docker-push
LAST_RELEASE=$(helm list -q)
helm upgrade $LAST_RELEASE ../chart
