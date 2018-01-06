#!/usr/bin/env bash
# configuration
#   env.ARCH
#   env.PROJECT
#   env.VERSION
#   env.VARIANT
#   env.REPOSITORY

set -e

import com.encodeering.docker.config
import com.encodeering.docker.docker

case "$VERSION" in
    7.2) FROM=stretch; TO=stretch-slim ;;
      *) FROM=jessie ; TO=jessie       ;;
esac

docker-pull "$REPOSITORY/debian-$ARCH:$FROM" "debian:$TO"

docker build -t "$DOCKER_IMAGE" "$PROJECT/$VERSION/$FROM/$VARIANT"

docker run --rm "$DOCKER_IMAGE" php -v
