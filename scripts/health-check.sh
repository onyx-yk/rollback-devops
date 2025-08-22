#!/bin/bash
# health-check.sh

echo "Checking if app is healthy..."

if curl -f http://localhost:8080 > /dev/null 2>&1; then
    echo "Healthy!"
    exit 0
else
    echo "Not responding"
    exit 1
fi