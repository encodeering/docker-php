#!/bin/bash

set -ev

BRANCH=${BRANCH##master}
BRANCH=${BRANCH:+-${BRANCH}}
TAG="$REPOSITORY/$PROJECT-$ARCH"
TAGSPECIFIER="$VERSION-$VARIANT$BRANCH"

docker login -e "$DOCKER_EMAIL" -u "$DOCKER_USERNAME" -p "$DOCKER_PASSWORD"

if [ "$ONBUILD" = true ]; then
    docker push "$TAG:$TAGSPECIFIER-onbuild"
else
    docker push "$TAG:$TAGSPECIFIER"
fi
