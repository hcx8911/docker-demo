FROM alpine

# https://hub.docker.com/_/alpine/
# https://github.com/gliderlabs/docker-alpine.git
# https://github.com/gliderlabs/docker-alpine/blob/0450fe826ccdedf63dd70da1ad953f1aaf932225/versions/library-3.6/x86_64/rootfs.tar.xz
# FROM scratch
# ADD rootfs.tar.xz /

LABEL MAINTAINER=WaterBolik@163.com

ENV TZ=Asia/Shanghai \
    LANG=zh_CN.UTF-8 \
    LANGUAGE=zh_CN.UTF-8:en_US.UTF-8:C.UTF-8 \
    SUPPORTED=zh_CN.UTF-8:en_US.UTF-8:C.UTF-8 \
    LC_ALL=zh_CN.UTF-8 

# 设置时区、中文、镜像源
# ARG APK_MIRROR=mirror.tuna.tsinghua.edu.cn 
# ARG APK_MIRROR=mirrors.ustc.edu.cn 
ARG APK_MIRROR=mirrors.aliyun.com 
RUN set -euxo pipefail \
    && sed -i "s/dl-cdn.alpinelinux.org/${APK_MIRROR}/" /etc/apk/repositories \    
    && apk update \
    && apk upgrade \
    && apk add --update --no-cache \
        tzdata \       
		bash \
        curl \	
    && ln -snf /usr/share/zoneinfo/$TZ /etc/localtime \
    && echo $TZ > /etc/timezone \
    && echo "end"
    # && localedef -i zh_CN -c -f UTF-8 -A /usr/share/locale/locale.alias zh_CN.UTF-8 \

CMD ["/bin/bash"]

# 编译及执行方法如下: 
# docker build -t alpine_base /Volumes/Work/OpenSource/WaterBolik/docker-demo/os_base/alpine_base/
# docker build -t alpine_base /Users/Bolik/OpenSource/WaterBolik/docker-demo/os_base/alpine_base/
# docker build -t alpine_base B:\OpenSource\WaterBolik\docker-demo\os_base\alpine_base\
# docker run -it --rm alpine_base 
