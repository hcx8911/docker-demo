FROM debian

# https://hub.docker.com/_/debian/
# 9.2, 9, stretch, latest 
# 8.9, 8, jessie, latest 
# 7.11, 7, wheezy 

LABEL MAINTAINER=WaterBolik@163.com

ENV TZ=Asia/Shanghai \
    LANG=zh_CN.UTF-8 \
    LANGUAGE=zh_CN.UTF-8:en_US.UTF-8:C.UTF-8 \
    SUPPORTED=zh_CN.UTF-8:en_US.UTF-8:C.UTF-8 \
    LC_ALL=zh_CN.UTF-8 

# 使用apt镜像
# ARG APT_MIRROR=mirrors.ustc.edu.cn
# ARG APT_MIRROR=mirrors.tuna.tsinghua.edu.cn
ARG APT_MIRROR=mirrors.aliyun.com
RUN set -eux \
    && sed -i \
            -e "s|deb.debian.org|${APT_MIRROR}|g" \
            -e "s|security.debian.org|${APT_MIRROR}/debian-security|g" \   
        /etc/apt/sources.list \
    && echo "end"

# 设置时区和中文语言环境
RUN set -eux \
    && apt-get update -y --fix-missing \
    && apt-get install -y --no-install-recommends \
        apt-utils \
        locales \
        tzdata \  
    && apt-get upgrade -y \      
    && ln -snf /usr/share/zoneinfo/$TZ /etc/localtime \
    && echo $TZ > /etc/timezone \
    && localedef -i zh_CN -c -f UTF-8 -A /usr/share/locale/locale.alias zh_CN.UTF-8 \
    && apt-get autoclean  \
    && apt-get autoremove  \
    && rm -rf /var/lib/apt/lists/* 

CMD ["bin/bash"]  

# 查看系统版本
# $ cat /etc/issue

# $ docker build -t debian_base /Volumes/Work/OpenSource/WaterBolik/docker-demo/os_base/debian_base/
# $ docker build -t debian_base ~/OpenSource/WaterBolik/docker-demo/os_base/debian_base/
# docker build -t debian_base B:/OpenSource/WaterBolik/docker-demo/os_base/debian_base/
# docker run -it --rm debian_base 