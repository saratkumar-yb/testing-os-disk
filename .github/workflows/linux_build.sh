#!/usr/bin/env bash

set -euo pipefail

df -H
checkout_dir=$PWD
docker run -t \
  --cap-add=SYS_PTRACE \
  "--mount=type=bind,src=$checkout_dir,dst=/opt/yb-build/thirdparty/checkout" \
  "$YB_DOCKER_IMAGE" \
  bash -c '
    df -H
  '