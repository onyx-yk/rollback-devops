#!/bin/bash
set -x
echo "Rolling back."

if [ -f "VERSION.backup" ]; then
    cp VERSION.backup VERSION
else
    echo "v1" > VERSION
fi

export VERSION=$(cat VERSION)
docker-compose -f docker-compose.yml down
docker-compose -f docker-compose.yml up -d --build

sleep 10
echo "Rolled back to version: $(cat VERSION)"


if ./scripts/health-check.sh; then
    echo "Rollback successful!"
else
    echo "Rollback failed."
fi