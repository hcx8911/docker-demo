#!/bin/bash

ROOTPATH=~/OpenSource/WaterBolik/docker-demo/linux-shell
cd "${ROOTPATH}"

# 编译及执行方法如下:
docker build -t linux-shell "${ROOTPATH}"

docker run -it --rm \
    --mount type=bind,source="${ROOTPATH}/src",target=/usr/src,readonly \
    --mount type=tmpfs,destination=/tmpfs \
    linux-shell
