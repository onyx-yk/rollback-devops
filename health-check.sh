#!/bin/bash
set -x

echo "Checking if app is healthy."

for i in {1..3}; do 
    if curl -f http://localhost:5000/health; then
        echo "App is healthy."
        exit 0
    else
        echo "Waiting."
        sleep 5
    fi
done

echo "Failed."
exit 1
