#!/bin/bash


echo "Rolling back to previous version..."

if [ -f "VERSION.backup" ]; then
    cp VERSION.backup VERSION
else
    echo "v1" > VERSION
fi

export VERSION=$(cat VERSION)
docker-compose down
docker-compose up -d --build

echo "✅ Rolled back to version: $(cat VERSION)"