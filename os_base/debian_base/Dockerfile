FROM debian
# FROM debian:9.2

# https://hub.docker.com/_/debian/
# https://store.docker.com/images/debian
# buster, buster-20171009 (buster/Dockerfile)
# buster-slim (buster/slim/Dockerfile)
# experimental, experimental-20171009 (experimental/Dockerfile)
# jessie, jessie-20171009, 8.9, 8 (jessie/Dockerfile)
# jessie-backports (jessie/backports/Dockerfile)
# jessie-slim (jessie/slim/Dockerfile)
# oldoldstable, oldoldstable-20171009 (oldoldstable/Dockerfile)
# oldoldstable-backports (oldoldstable/backports/Dockerfile)
# oldoldstable-slim (oldoldstable/slim/Dockerfile)
# oldstable, oldstable-20171009 (oldstable/Dockerfile)
# oldstable-backports (oldstable/backports/Dockerfile)
# oldstable-slim (oldstable/slim/Dockerfile)
# rc-buggy, rc-buggy-20171009 (rc-buggy/Dockerfile)
# sid, sid-20171009 (sid/Dockerfile)
# sid-slim (sid/slim/Dockerfile)
# stable, stable-20171009 (stable/Dockerfile)
# stable-backports (stable/backports/Dockerfile)
# stable-slim (stable/slim/Dockerfile)
# stretch, stretch-20171009, 9.2, 9, latest (stretch/Dockerfile)
# stretch-backports (stretch/backports/Dockerfile)
# stretch-slim (stretch/slim/Dockerfile)
# testing, testing-20171009 (testing/Dockerfile)
# testing-slim (testing/slim/Dockerfile)
# unstable, unstable-20171009 (unstable/Dockerfile)
# unstable-slim (unstable/slim/Dockerfile)
# wheezy, wheezy-20171009, 7.11, 7 (wheezy/Dockerfile)
# wheezy-backports (wheezy/backports/Dockerfile)
# wheezy-slim (wheezy/slim/Dockerfile)

LABEL MAINTAINER="WaterBolik@163.com"

ENV TZ=Asia/Shanghai \
    LANG=zh_CN.UTF-8 \
    LANGUAGE=zh_CN.UTF-8:en_US.UTF-8:C.UTF-8 \
    SUPPORTED=zh_CN.UTF-8:en_US.UTF-8:C.UTF-8 \
    LC_ALL=zh_CN.UTF-8

# 设置镜像源、时区、中文
# ARG APT_MIRROR=mirrors.ustc.edu.cn
# ARG APT_MIRROR=mirrors.tuna.tsinghua.edu.cn
ARG APT_MIRROR=mirrors.aliyun.com
RUN set -eux \
    &&  sed -i \
            -e "s|deb.debian.org|${APT_MIRROR}|g" \
            -e "s|security.debian.org|${APT_MIRROR}/debian-security|g" \
        /etc/apt/sources.list \
    \
    && apt-get update -y --fix-missing \
    && apt-get install -y --no-install-recommends --fix-missing \
        apt-utils \
        locales \
        tzdata \
    \
    && ln -snf /usr/share/zoneinfo/$TZ /etc/localtime \
    && echo $TZ > /etc/timezone \
    \
    && localedef -i zh_CN -c -f UTF-8 -A /usr/share/locale/locale.alias zh_CN.UTF-8 \
    \
    && apt-get clean && apt-get autoclean && apt-get autoremove \
    && rm -rf /var/lib/apt/lists/*

CMD ["bin/bash"]

# 查看系统版本
# $ cat /etc/issue

# $ docker build -t debian_base ~/OpenSource/WaterBolik/docker-demo/os_base/debian_base/
# docker build -t debian_base B:/OpenSource/WaterBolik/docker-demo/os_base/debian_base/
# docker run -it --rm debian_base
