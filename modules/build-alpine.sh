#!/usr/bin/env bash

set -e

import com.encodeering.docker.config
import com.encodeering.docker.docker

docker-pull "$REPOSITORY/alpine-$ARCH:3.7" "alpine:3.7"

docker build -t "$DOCKER_IMAGE" "$PROJECT/$VERSION/alpine3.7/$VARIANT"
