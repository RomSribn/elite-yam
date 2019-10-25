#!/usr/bin/env bash

set -e
set -o pipefail
set -v

curl -s -X POST https://api.stackbit.com/project/5db2fbb34f15ca00134bd11c/webhook/build/pull > /dev/null
npx @stackbit/stackbit-pull --stackbit-pull-api-url=https://api.stackbit.com/pull/5db2fbb34f15ca00134bd11c
curl -s -X POST https://api.stackbit.com/project/5db2fbb34f15ca00134bd11c/webhook/build/ssgbuild > /dev/null
gatsby build
curl -s -X POST https://api.stackbit.com/project/5db2fbb34f15ca00134bd11c/webhook/build/publish > /dev/null
