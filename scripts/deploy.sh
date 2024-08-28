#!/bin/bash

echo "Building docker image..."
docker build -t graphite . &&

echo "Uploading docker image..."
docker save graphite | bzip2 | pv | ssh vps 'bunzip2 | docker load'