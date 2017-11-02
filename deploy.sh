#!/bin/bash
source env.sh

docker push johannweging/mongodb:${VERSION}

if [[ "${MONGODB_VERSION}" == "${LATEST}" ]]; then
    docker tag johannweging/mongodb:${VERSION} johannweging/mongodb:latest
    docker push johannweging/mongodb:latest
fi
