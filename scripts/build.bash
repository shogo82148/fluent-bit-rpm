#!/bin/bash

set -exu

ROOT=$(cd "$(dirname "$0")/../" && pwd)

FLB_VERSION=$1
FLB_RELEASE=$2
FLB_DISTRO=$3
: "${PLATFORM:=linux/amd64}"

if [[ -d "$ROOT/$FLB_DISTRO.build.bak" ]]; then
    rm -rf "$ROOT/$FLB_DISTRO.build.bak"
fi
if [[ -d "$ROOT/$FLB_DISTRO.build" ]]; then
    mv "$ROOT/$FLB_DISTRO.build" "$ROOT/$FLB_DISTRO.build.bak"
fi

mkdir "$ROOT/$FLB_DISTRO.build"

docker buildx build \
    --load \
    --platform "$PLATFORM" \
    --build-arg FLB_VERSION="$FLB_VERSION" \
    --build-arg FLB_PREFIX=v \
    --build-arg FLB_RELEASE="$FLB_RELEASE" \
    -t "flb-$FLB_DISTRO-$FLB_VERSION" \
    -f "$ROOT/Dockerfile.$FLB_DISTRO" "$ROOT/$FLB_DISTRO.build"

docker run \
    --rm \
    -v "$ROOT/$FLB_DISTRO.build:/output" \
    --platform "$PLATFORM" \
    "flb-$FLB_DISTRO-$FLB_VERSION"
