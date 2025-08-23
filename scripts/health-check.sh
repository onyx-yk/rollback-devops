#!/bin/bash
# health-check.sh
set -x
echo "Checking if app is healthy..."

for i in {1..12}; do  # try for 60 seconds
    if curl -f http://localhost:8080; then
        echo "App is healthy."
        break
    else
        echo "Waiting."
        sleep 5
    fi
done#!/bin/bash
# health-check.sh
set -x

echo "Checking if app is healthy..."

for i in {1..12}; do  # try for 60 seconds
    if curl -f http://localhost:8080; then
        echo "App is healthy."
        exit 0
    else
        echo "Waiting."
        sleep 5
    fi
done

echo "Failed."
exit 1
