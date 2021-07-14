#!/bin/bash

set -exu

FLB_DISTRO=$1
IMAGE=$(perl -ne 'print $1 if /FROM\s+(.*)/' "Dockerfile.$FLB_DISTRO")
ROOT=$(cd "$(dirname "$0")/../" && pwd)
: "${PLATFORM:=linux/amd64}"

docker run \
    --rm \
    -v "$ROOT/$FLB_DISTRO.build:/build" \
    --platform "$PLATFORM" \
    "$IMAGE" \
    sh -c "yum update -y && yum install -y /build/*.rpm"
