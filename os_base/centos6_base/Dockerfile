FROM centos:6
# FROM centos:6.9
# https://hub.docker.com/_/centos/
# https://store.docker.com/images/centos

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

# 设置时区、中文、镜像源
ARG YUM_MIRROR=mirrors.ustc.edu.cn
# ARG YUM_MIRROR=mirror.tuna.tsinghua.edu.cn
ARG YUM_MIRROR=mirrors.aliyun.com
RUN set -euxo pipefail \
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
    && echo "export LC_ALL=zh_CN.UTF-8" >> /etc/profile \
    && sed  -i \
            -e 's~^LANG="en_US.UTF-8"~LANG="zh_CN.UTF-8"~g' \
        /etc/sysconfig/i18n \
    && sed  -i \
            -e 's~^override_install_langs=en_US.UTF-8~override_install_langs=zh_CN.UTF-8~g' \
        /etc/yum.conf \
    &&  { \
            echo 'LANG="zh_CN.UTF-8"'; \
            echo 'LANGUAGE="zh_CN.UTF-8:en_US.UTF-8:C.UTF-8"'; \
            echo 'SUPPORTED="zh_CN.UTF-8:en_US.UTF-8:C.UTF-8"'; \
            echo 'LC_ALL="zh_CN.UTF-8"'; \
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
        kde-l10n-Chinese \
    && yum -y reinstall \
        glibc-common \
    && sed  -i \
            -e "s|^mirrorlist=|#mirrorlist=|g" \
            -e "s|^#baseurl=|baseurl=|g" \
            -e "s|download.fedoraproject.org/pub|${YUM_MIRROR}|g" \
            -e "s|http:|https:|g" \
        /etc/yum.repos.d/epel*.repo \
    \
    && groupadd -g ${gid} ${group} \
    && useradd -u ${uid} -g ${gid} -m -s /bin/bash ${user} \
    \
    && yum clean all

# USER ${user}
# CMD ["bin/bash"]

# 查看系统版本
# $ rpm -qi centos-release

# $ docker build -t centos6_base ~/OpenSource/WaterBolik/docker-demo/os_base/centos6_base/
# docker build -t centos6_base B:/OpenSource/WaterBolik/docker-demo/os_base/centos6_base/
# docker run -it --rm centos6_base
