FROM alpine_base

# https://hub.docker.com/_/nginx/

LABEL MAINTAINER="WaterBolik@163.com"

# apk 安装 nginx-1.12.2-r1
# RUN set -euxo pipefail \
#     && apk add --update --no-cache \
# 	    nginx \
#     && rm -rf /var/cache/apk/*

# https://github.com/nginxinc/docker-nginx/blob/master/mainline/alpine/Dockerfile
RUN set -euxo pipefail \
    && apk add --update --no-cache --virtual .build-deps \
        gcc \
        libc-dev \
        make \
        openssl-dev \
        pcre-dev \
        zlib-dev \
        linux-headers \
        curl \
        gnupg \
        libxslt-dev \
        gd-dev \
        geoip-dev \
    \
    && export GNUPGHOME="$(mktemp -d)" \
    &&  for key in \
            B0F4253373F8F6F510D42178520A9993A1C052F8 \
        ; do \
            gpg --keyserver-options timeout=10 --keyserver pgp.mit.edu --recv-keys "$key" || \
            gpg --keyserver-options timeout=10 --keyserver keyserver.pgp.com --recv-keys "$key" || \
            gpg --keyserver-options timeout=10 --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys "$key" \
            gpg --keyserver-options timeout=10 --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys "$key" \
            gpg --keyserver-options timeout=10 --keyserver ha.pool.sks-keyservers.net --recv-keys "$key" || \
            false; \
        done \
    \
    && apk del .build-deps \
    && rm -rf /var/cache/apk/*

COPY nginx.conf /etc/nginx/nginx.conf
COPY nginx.vh.default.conf /etc/nginx/conf.d/default.conf

EXPOSE 80

STOPSIGNAL SIGTERM

CMD ["nginx", "-g", "daemon off;"]

# 编译及执行方法如下:
# docker build -t alpine-nginx ~/OpenSource/WaterBolik/docker-demo/nginx/alpine-nginx/
# docker build -t alpine-nginx B:\OpenSource\WaterBolik\docker-demo\nginx\alpine-nginx\
# docker run -it --rm -p 80:80 -v ./www:/usr/share/nginx/html:ro -d alpine-nginx
