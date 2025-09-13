#!/bin/bash
set -x
VERSION=$(cat VERSION)
echo "Deploying version: $VERSION"

export VERSION=$VERSION

docker compose -f docker-compose.yml down
docker compose -f docker-compose.yml build --build-arg VERSION=$VERSION
docker compose -f docker-compose.yml up -d
sleep 10

if ./health-check.sh; then
    echo "Deployment success."
    echo $VERSION > success_ver.txt
else
    echo "Deployment failed, rolling back."
    ./rollback.sh
fi