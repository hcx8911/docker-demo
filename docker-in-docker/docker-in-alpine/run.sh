#!/bin/bash

# 启动 Docker Daemon
docker run --rm -d\
    --privileged \
    -v var-lib-docker:/var/lib/docker \
    --name docker-dind \
    docker:dind

# 启动客户端连接 Docker Daemon
docker run -t -i --rm \
    --link docker-dind:docker \
    docker:latest

# 停止 Docker Daemon
docker stop docker-dind
# docker rm docker-dind

# 启动客户端连接 Docker Daemon
docker run -t -i --rm \
    -v /var/run/docker.sock:/var/run/docker.sock \
    docker