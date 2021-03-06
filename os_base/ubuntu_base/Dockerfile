FROM ubuntu
# FROM ubuntu:16.04

# https://hub.docker.com/_/ubuntu/
# # https://store.docker.com/images/ubuntu
# 17.10, artful-20171116, artful, rolling (artful/Dockerfile)
# 18.04, bionic-20171114, bionic, devel (bionic/Dockerfile)
# 14.04, trusty-20171117, trusty (trusty/Dockerfile)
# 16.04, xenial-20171114, xenial, latest (xenial/Dockerfile)
# 17.04, zesty-20171114, zesty (zesty/Dockerfile)

LABEL MAINTAINER="WaterBolik@163.com"

ENV TZ=Asia/Shanghai \
    LANG=zh_CN.UTF-8 \
    LANGUAGE=zh_CN.UTF-8:en_US.UTF-8:C.UTF-8 \
    SUPPORTED=zh_CN.UTF-8:en_US.UTF-8:C.UTF-8 \
    LC_ALL=zh_CN.UTF-8

ARG user=docker
ARG group=docker
ARG uid=1000
ARG gid=1000

# 使用镜像源、时区、中文
# ARG APT_MIRROR=mirrors.ustc.edu.cn
# ARG APT_MIRROR=mirrors.tuna.tsinghua.edu.cn
ARG APT_MIRROR=mirrors.aliyun.com
RUN set -eux \
    &&  sed -i \
            -e "s|archive.ubuntu.com|${APT_MIRROR}|g" \
            -e "s|security.ubuntu.com|${APT_MIRROR}|g" \
        /etc/apt/sources.list \
    \
    && apt-get update -y --fix-missing \
    && apt-get install -y --no-install-recommends \
        apt-utils \
        tzdata \
        language-pack-zh-hans \
        locales \
    \
    && ln -snf /usr/share/zoneinfo/$TZ /etc/localtime \
    && echo $TZ > /etc/timezone \
    \
    && localedef \
        -i zh_CN \
        -c \
        -f UTF-8 \
        -A /usr/share/locale/locale.alias \
        zh_CN.UTF-8 \
    \
    && groupadd -g ${gid} ${group} \
    && useradd -u ${uid} -g ${gid} -m -s /bin/bash ${user} \
    \
    && apt-get clean && apt-get autoclean && apt-get autoremove \
    && rm -rf /var/lib/apt/lists/*

# USER ${user}
# CMD ["bin/bash"]

# $ docker build -t ubuntu_base ~/OpenSource/WaterBolik/docker-demo/os_base/ubuntu_base/
# $ docker build -t ubuntu_base B:/OpenSource/WaterBolik/docker-demo/os_base/ubuntu_base/
# $ docker run -it --rm ubuntu_base
