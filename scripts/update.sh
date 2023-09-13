#!/bin/bash

CURRENT=$(cd "$(dirname "$0")" && pwd)
cd "$CURRENT"

set -eu

FLUENT_BIT_VERSION=$(gh api --jq 'last.ref | sub("refs/tags/v"; "")' /repos/fluent/fluent-bit/git/matching-refs/tags/v2.)
export FLUENT_BIT_VERSION

perl -i -pe 's/^FLB_VERSION\s+:=\s*[0-9.]+$/FLB_VERSION := $ENV{FLUENT_BIT_VERSION}/' "$CURRENT/../Makefile"

if [[ -f "${GITHUB_OUTPUT:-}" ]]; then
    cat <<__END_OF_OUTPUT__ >> "$GITHUB_OUTPUT"
latest-version=$FLUENT_BIT_VERSION
__END_OF_OUTPUT__
fi
