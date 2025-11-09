#!/bin/bash
set -euo pipefail

cd /opt/microservices/shixHappens-microservices-playground

# Reset any local changes to match the remote branch before rebuilding
git fetch origin main
git reset --hard origin/main
git clean -fd

docker-compose -f docker-compose.dev.yml pull
docker-compose -f docker-compose.dev.yml up -d --build
docker image prune -f
