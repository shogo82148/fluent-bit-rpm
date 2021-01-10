#!/bin/bash

set -uex

USER=shogo82148
BINTRAY_API=https://api.bintray.com
FLB_VERSION=$1
FLB_DISTRO=$2
FLB_RELEASE=1
SUBJECT=shogo82148
REPO=fluent-bit-rpm
PACKAGE=fluent-bit
ROOT=$(cd "$(dirname "$0")/../" && pwd)

: create a new version
curl -u "$USER:$BINTRAY_API_KEY" \
    "$BINTRAY_API/packages/$SUBJECT/$REPO/$PACKAGE/versions" \
    -H 'Content-Type: application/json' \
    -d "$(
        jq -nc \
            --arg version "$FLB_VERSION-$FLB_RELEASE" \
            --arg desc "Automated release from main" \
            --arg released "$(date '+%Y-%m-%dT%H:%M:%S%z')" \
            '{ name: $version, released: $released }'
        )"

: upload RPM files

for RPM in "$ROOT/$FLB_DISTRO.build/$PACKAGE-$FLB_VERSION-$FLB_RELEASE".*.rpm
do
    curl -u "$USER:$BINTRAY_API_KEY" \
        "$BINTRAY_API/content/$SUBJECT/$REPO/$FLB_DISTRO/2/x86_64/$(basename "$RPM")" \
        -H "X-Bintray-Package: $PACKAGE" \
        -H "X-Bintray-Version: $FLB_VERSION-$FLB_RELEASE" \
        -H "X-Bintray-Publish: 1" \
        -H "X-Bintray-Override: 1" \
        -H "Content-Type: application/octet-stream" \
        -XPUT \
        --data-binary "@$RPM"
done
