#!/bin/bash

ROOTPATH=~/OpenSource/WaterBolik/docker-demo/helloworld
cd "${ROOTPATH}"

# 编译及执行方法如下:
docker build -t helloworld "${ROOTPATH}"

docker run -it --rm \
    --mount type=bind,source="${ROOTPATH}/src",target=/usr/src,readonly \
    --mount type=tmpfs,destination=/tmpfs \
    helloworld
