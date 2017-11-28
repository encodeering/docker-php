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

if [ "$ONBUILD" = true ]; then
    docker-pull "$REPOSITORY/debian-$ARCH:jessie" "debian:jessie"

    patch -p1 --no-backup-if-mismatch --directory=$PROJECT < patch/$VERSION/$VARIANT/Dockerfile.patch

    docker build -t "$DOCKER_IMAGE-onbuild" "$PROJECT/$VERSION/$VARIANT"
else
    echo       "FROM $DOCKER_IMAGE-onbuild" > Dockerfile.onbuild
    docker build -t "$DOCKER_IMAGE" -f Dockerfile.onbuild .

    docker run --rm "$DOCKER_IMAGE" php -v
fi
