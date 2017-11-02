#!/bin/bash
docker push johannweging/mongodb:${MONGODB_VERSION}

if [[ "${MONGODB_VERSION}" == "${LATEST}" ]]; then
    docker tag johannweging/mongodb:${MONGODB_VERSION} johannweging/mongodb:latest
    docker push johannweging/mongodb:latest
fi
