#!/bin/bash

set -exu

ROOT=$(cd "$(dirname "$0")/../" && pwd)

FLB_VERSION=$1
FLB_DISTRO=$2
FLB_RELEASE=1

if [[ -d "$ROOT/$FLB_DISTRO.build.bak" ]]; then
    rm -rf "$ROOT/$FLB_DISTRO.build.bak"
fi
if [[ -d "$ROOT/$FLB_DISTRO.build" ]]; then
    mv "$ROOT/$FLB_DISTRO.build" "$ROOT/$FLB_DISTRO.build.bak"
fi

mkdir "$ROOT/$FLB_DISTRO.build"

docker build \
    --build-arg FLB_VERSION="$FLB_VERSION" \
    --build-arg FLB_PREFIX=v \
    --build-arg FLB_RELEASE="$FLB_RELEASE" \
    -t "flb-$FLB_DISTRO-$FLB_VERSION" \
    -f "$ROOT/Dockerfile.$FLB_DISTRO" "$ROOT/$FLB_DISTRO.build"

docker run \
    --rm \
    -v "$ROOT/$FLB_DISTRO.build:/output" \
    "flb-$FLB_DISTRO-$FLB_VERSION"


TEMPLATE_FILE="$ROOT/scripts/bintray.json.tmpl"
DST_DIR="$ROOT/bintray"


PKG_VERSION="${FLB_VERSION}-${FLB_RELEASE}"
DATE=$(date +%Y-%m-%d)

mkdir -p "$DST_DIR"

PKG_NAME="fluent-bit"
DST_FILE="bintray-${PKG_NAME}.json"

sed -e "s/@PKG_NAME@/${PKG_NAME}/g" \
    -e "s/@PKG_VERSION@/${PKG_VERSION}/g" \
    -e "s/@DATE@/${DATE}/g" \
    "$TEMPLATE_FILE" > "${DST_DIR}/${DST_FILE}"
