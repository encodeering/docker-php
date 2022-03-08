#!/usr/bin/env bash

set -e

import com.encodeering.ci.config
import com.encodeering.ci.docker

docker-pull "$REPOSITORY/alpine-$ARCH:3.15" "alpine:3.15"

docker-build "$PROJECT/$VERSION/alpine3.15/$VARIANT"
