#!/bin/bash

echo "Building docker image..."
docker build --no-cache --platform="linux/amd64" -t graphite . &&

echo "Uploading docker image..."
docker save graphite | bzip2 | pv | ssh vps 'bunzip2 | docker load'