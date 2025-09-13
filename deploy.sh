#!/bin/bash
set -x
VERSION=$(cat VERSION)
echo "Deploying version: $VERSION"

if [ -f "VERSION" ]; then
    cp VERSION VERSION.backup
fi

docker compose -f docker-compose.yml down
docker compose -f docker-compose.yml build --build-arg APP_VERSION=$VERSION
docker compose -f docker-compose.yml up -d
sleep 10

if ./health-check.sh; then
    echo "Deployment success."
else
    echo "Deployment failed, rolling back."
    ./rollback.sh
fi