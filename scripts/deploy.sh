#!/bin/bash
set -x
VERSION=$(cat VERSION)
echo "Deploying version: $VERSION"

if [ -f "VERSION" ]; then
    cp VERSION VERSION.backup
fi

docker-compose down
export VERSION=$VERSION
docker-compose up -d --build
sleep 10

if ./scripts/health-check.sh; then
    echo "Deployment success."
else
    echo "Deployment failed, rolling back."
    ./scripts/rollback.sh
fi