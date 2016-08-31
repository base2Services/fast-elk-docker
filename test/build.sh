REPO="base2"
TAG="latest"

#should be at root of repo
START_DIR=$PWD

IMAGE="elasticsearch"
cd $START_DIR/$IMAGE
docker build -t $REPO/$IMAGE:$TAG

IMAGE="logstash"
cd $START_DIR/$IMAGE
docker build -t $REPO/$IMAGE:$TAG

IMAGE="kibana"
cd $START_DIR/$IMAGE
docker build -t $REPO/$IMAGE:$TAG

IMAGE="nginx"
cd $START_DIR/$IMAGE
docker build -t $REPO/$IMAGE:$TAG
