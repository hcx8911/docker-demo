#!/bin/bash

ROOTPATH=~/OpenSource/WaterBolik/docker-demo/golang/golang-demo/

# docker build -t alpine-golang ${ROOTPATH}/alpine-golang/
# docker run -it --rm arg

docker build -t golang-demo ${ROOTPATH}
docker run -it --rm \
    --mount type=bind,source="${ROOTPATH}/src",target=/usr/src,readonly \
    golang-demo

# # 查看Docker的磁盘使用情况
# docker system df

# # 清理临时镜像和容器（删除所有已停止容器，清除所有没有打标签的非引用镜像）
# docker system prune -f
# # 清理数据卷（没有与容器关联的数据卷）
# docker volume prune -f

# # 查看Docker的磁盘使用情况
# docker system df

# # 列出所有本地镜像
# docker images
