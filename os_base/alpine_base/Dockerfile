FROM alpine
# FROM alpine:3.6

# https://hub.docker.com/_/alpine/
# https://store.docker.com/images/alpine
# 3.6, latest (versions/library-3.6/x86_64/Dockerfile)
# edge (versions/library-edge/x86_64/Dockerfile)
# 3.1 (versions/library-3.1/Dockerfile)
# 3.2 (versions/library-3.2/Dockerfile)
# 3.3 (versions/library-3.3/Dockerfile)
# 3.4 (versions/library-3.4/Dockerfile)
# 3.5 (versions/library-3.5/Dockerfile)

# https://github.com/gliderlabs/docker-alpine.git
# https://github.com/gliderlabs/docker-alpine/blob/0450fe826ccdedf63dd70da1ad953f1aaf932225/versions/library-3.6/x86_64/rootfs.tar.xz
# FROM scratch
# ADD rootfs.tar.xz /

LABEL MAINTAINER="WaterBolik@163.com"

ENV TZ=Asia/Shanghai \
    LANG=zh_CN.UTF-8 \
    LANGUAGE=zh_CN.UTF-8:en_US.UTF-8:C.UTF-8 \
    SUPPORTED=zh_CN.UTF-8:en_US.UTF-8:C.UTF-8 \
    LC_ALL=C.UTF-8

ARG user=docker
ARG group=docker
ARG uid=1000
ARG gid=1000

# 设置时区、中文、镜像源
# ARG APK_MIRROR=mirrors.ustc.edu.cn
# ARG APK_MIRROR=mirror.tuna.tsinghua.edu.cn
ARG APK_MIRROR=mirrors.aliyun.com
RUN set -euxo pipefail \
    && sed -i "s/dl-cdn.alpinelinux.org/${APK_MIRROR}/" /etc/apk/repositories \
    && apk add --update --no-cache \
        tzdata \
    && ln -snf /usr/share/zoneinfo/$TZ /etc/localtime \
    && echo $TZ > /etc/timezone \
    \
    && addgroup -g ${gid} ${group} \
    && adduser -u ${uid} -G ${group} -s /bin/sh -D ${user} \
    \
    && rm -rf /var/cache/apk/*
# && localedef -i zh_CN -c -f UTF-8 -A /usr/share/locale/locale.alias zh_CN.UTF-8 \
# localedef: not found

# USER ${user}

CMD /bin/sh
# CMD su docker; /bin/sh

# 编译及执行方法如下:
# docker build -t alpine_base ~/OpenSource/WaterBolik/docker-demo/os_base/alpine_base/
# docker build -t alpine_base B:\OpenSource\WaterBolik\docker-demo\os_base\alpine_base\
# docker run -it --rm alpine_base
