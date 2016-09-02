#!/bin/bash

set -e

REPO="base2"
TAG="latest"

#should be at root of repo
START_DIR=$PWD

IMAGE="elasticsearch"
echo "start $IMAGE"
cd $START_DIR/$IMAGE
docker build -t $REPO/$IMAGE:$TAG .

IMAGE="logstash"
echo "start $IMAGE"
cd $START_DIR/$IMAGE
docker build -t $REPO/$IMAGE:$TAG .

IMAGE="kibana"
echo "start $IMAGE"
cd $START_DIR/$IMAGE
docker build -t $REPO/$IMAGE:$TAG .

IMAGE="nginx"
echo "start $IMAGE"
cd $START_DIR/$IMAGE
docker build -t $REPO/$IMAGE:$TAG .

cd $START_DIR
