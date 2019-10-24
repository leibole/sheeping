#!/usr/bin/env bash

set -e
set -o pipefail
set -v

curl -s -X POST https://api.stackbit.com/project/5db206b5ab6cd90019affd3a/webhook/build/pull > /dev/null
npx @stackbit/stackbit-pull --stackbit-pull-api-url=https://api.stackbit.com/pull/5db206b5ab6cd90019affd3a
curl -s -X POST https://api.stackbit.com/project/5db206b5ab6cd90019affd3a/webhook/build/ssgbuild > /dev/null
gatsby build
curl -s -X POST https://api.stackbit.com/project/5db206b5ab6cd90019affd3a/webhook/build/publish > /dev/null
