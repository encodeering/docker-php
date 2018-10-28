#!/usr/bin/env bash

set -e

import com.encodeering.ci.config
import com.encodeering.ci.docker

case "$VERSION" in
    7.2) FROM=3.8; TO=3.8 ;;
      *) FROM=3.7; TO=3.7 ;;
esac

docker-pull "$REPOSITORY/alpine-$ARCH:$FROM" "alpine:$FROM"

docker-build "$PROJECT/$VERSION/alpine$FROM/$VARIANT"
