#!/usr/bin/env bash

set -e

import com.encodeering.ci.config
import com.encodeering.ci.docker

docker-pull "$REPOSITORY/debian-$ARCH:bullseye-slim" "debian:bullseye-slim"

docker-build "$PROJECT/$VERSION/bullseye/$VARIANT"
