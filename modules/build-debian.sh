#!/usr/bin/env bash

set -e

import com.encodeering.ci.config
import com.encodeering.ci.docker

case "$VERSION" in
    7.2) FROM=stretch; TO=stretch-slim ;;
      *) FROM=jessie ; TO=jessie       ;;
esac

docker-pull "$REPOSITORY/debian-$ARCH:$FROM" "debian:$TO"

docker-build "$PROJECT/$VERSION/$FROM/$VARIANT"
