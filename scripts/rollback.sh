#!/bin/bash
echo "Rolling back."

if [ -f "VERSION.backup" ]; then
    cp VERSION.backup VERSION
else
    echo "v1" > VERSION
fi

export VERSION=$(cat VERSION)
docker-compose down
docker-compose up -d --build

sleep 10
echo "Rolled back to version: $(cat VERSION)"


if ./scripts/health-check.sh; then
    echo "Rollback successful!"
else
    echo "Rollback failed."
fi