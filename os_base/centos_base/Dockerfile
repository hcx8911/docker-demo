FROM centos
# FROM centos:7
# FROM centos:7.4.1708

# https://hub.docker.com/_/centos/
# https://store.docker.com/images/centos
# latest, centos7, 7 (docker/Dockerfile)
# centos6, 6 (docker/Dockerfile)
# centos7.4.1708, 7.4.1708 (docker/Dockerfile)
# centos7.3.1611, 7.3.1611 (docker/Dockerfile)
# centos7.2.1511, 7.2.1511 (docker/Dockerfile)
# centos7.1.1503, 7.1.1503 (docker/Dockerfile)
# centos7.0.1406, 7.0.1406 (docker/Dockerfile)
# centos6.9, 6.9 (docker/Dockerfile)
# centos6.8, 6.8 (docker/Dockerfile)
# centos6.7, 6.7 (docker/Dockerfile)
# centos6.6, 6.6 (docker/Dockerfile)

LABEL MAINTAINER="WaterBolik@163.com"

ENV TZ=Asia/Shanghai \
    LANG=zh_CN.utf8 \
    LANGUAGE=zh_CN.utf8:en_US.utf8:C.utf8 \
    SUPPORTED=zh_CN.utf8:en_US.utf8:C.utf8 \
    LC_ALL=zh_CN.utf8

ARG user=docker
ARG group=docker
ARG uid=1000
ARG gid=1000

# 设置时区、中文、镜像源
# ARG YUM_MIRROR=mirrors.ustc.edu.cn
# ARG YUM_MIRROR=mirror.tuna.tsinghua.edu.cn
ARG YUM_MIRROR=mirrors.aliyun.com
RUN set -euxo pipefail \
    && ln -snf /usr/share/zoneinfo/$TZ /etc/localtime \
    && echo $TZ > /etc/timezone \
    \
    && localedef -i zh_CN -c -f UTF-8 -A /usr/share/locale/locale.alias zh_CN.UTF-8 \
    && echo "export LC_ALL=zh_CN.utf8" >> /etc/profile \
    && sed  -i \
            -e 's~^override_install_langs=en_US.utf8~override_install_langs=zh_CN.utf8~g' \
        /etc/yum.conf \
    &&  { \
            echo 'LANG="zh_CN.utf8"'; \
            echo 'LANGUAGE="zh_CN.utf8:en_US.utf8:C.utf8"'; \
            echo 'SUPPORTED="zh_CN.utf8:en_US.utf8:C.utf8"'; \
            echo 'LC_ALL="zh_CN.utf8"'; \
            echo 'SYSFONT="lat0-sun16"'; \
        } \
        > /etc/locale.conf \
    \
    && sed  -i \
            -e "s|^mirrorlist=|#mirrorlist=|g" \
            -e "s|^#baseurl=|baseurl=|g" \
            -e "s|mirror.centos.org|${YUM_MIRROR}|g" \
            -e "s|vault.centos.org|${YUM_MIRROR}|g" \
            -e "s|http:|https:|g" \
        /etc/yum.repos.d/* \
    \
    && yum -y install \
        epel-release \
    && sed  -i \
            -e "s|^mirrorlist=|#mirrorlist=|g" \
            -e "s|^#baseurl=|baseurl=|g" \
            -e "s|download.fedoraproject.org/pub|${YUM_MIRROR}|g" \
            -e "s|http:|https:|g" \
        /etc/yum.repos.d/epel*.repo \
    \
    && addgroup -g ${gid} ${group} \
    && adduser -u ${uid} -G ${group} -s /bin/sh -D ${user} \
    \
    && yum clean all

# USER ${user}
# CMD ["bin/bash"]

# 查看系统版本
# $ rpm -qi centos-release

# $ docker build -t centos_base ~/OpenSource/WaterBolik/docker-demo/os_base/centos_base/
# $ docker build -t centos_base B:/OpenSource/WaterBolik/docker-demo/os_base/centos_base/
# $ docker run -it --rm centos_base
