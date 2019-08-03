#!/usr/bin/env bash

set -e

import com.encodeering.ci.config
import com.encodeering.ci.docker

docker-pull "$REPOSITORY/alpine-$ARCH:3.10" "alpine:3.10"

docker-build "$PROJECT/$VERSION/alpine3.10/$VARIANT"
