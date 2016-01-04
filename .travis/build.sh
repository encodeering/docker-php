#!/bin/bash

set -ev

TAG="$REPOSITORY/$PROJECT-$ARCH"
TAGSPECIFIER="$VERSION-$VARIANT"

if [ "$ONBUILD" = true ]; then
    docker pull   "$REPOSITORY/debian-$ARCH:jessie"
    docker tag -f "$REPOSITORY/debian-$ARCH:jessie" "debian:jessie"

    patch -p0 --no-backup-if-mismatch --directory=$PROJECT < .patch/$VERSION/$VARIANT/Dockerfile.patch

    docker build -t "$TAG:$TAGSPECIFIER-onbuild" "$PROJECT/$VERSION/$VARIANT"
else
    echo       "FROM $TAG:$TAGSPECIFIER-onbuild" > Dockerfile.onbuild
    docker pull     "$TAG:$TAGSPECIFIER-onbuild"
    docker build -t "$TAG:$TAGSPECIFIER" -f Dockerfile.onbuild .

    docker run --rm "$TAG:$TAGSPECIFIER" php -v
fi
