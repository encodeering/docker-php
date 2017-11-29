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

docker-pull "$REPOSITORY/debian-$ARCH:jessie" "debian:jessie"

docker build -t "$DOCKER_IMAGE" "$PROJECT/$VERSION/$VARIANT"

docker run --rm "$DOCKER_IMAGE" php -v
