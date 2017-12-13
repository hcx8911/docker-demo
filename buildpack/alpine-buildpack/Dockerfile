FROM alpine_base

LABEL MAINTAINER="WaterBolik@163.com"

ENV JAVA_HOME=/usr/lib/jvm/java-1.8-openjdk \
    PATH=${PATH}:/usr/lib/jvm/java-1.8-openjdk/jre/bin:/usr/lib/jvm/java-1.8-openjdk/bin

# https://store.docker.com/images/buildpack-deps
# https://github.com/docker-library/buildpack-deps.git
RUN set -euxo pipefail \
    && apk add --update --no-cache \
        autoconf \
		automake \
		bc \
		build-base \
		bzip2 \
        bzr \
		ca-certificates \
		cmake \
		curl \
		curl-dev \
		dpkg-dev \
		file \
		freetype \
        freetype-dev \
		g++ \
		gcc \
		gdbm-dev \
		geoip-dev \
		gfortran \
		glib-dev \
		gnupg \
		go \
		go-tools \
		icu \
        icu-dev \
		imagemagick-dev \
		jpeg-dev \
		krb5-dev \
        lapack-dev \
		libbz2 \
		libc6-compat \
		libcurl \
		libdbi-dev \
		libevent-dev \
        libffi-dev \
		libpng-dev \
		libressl-dev \
		libtool \
		libwebp-dev \
		libxml2-dev \
		libxslt-dev \
		linux-headers \
		make \
		ncurses-dev \
		nodejs-dev \
		mariadb-dev \
		openjdk8 \
		patch \
		postgresql-dev \
		procps \
        python-dev \
		readline-dev \
        ruby-dev \
		sqlite-dev \
		yaml-dev \
		xz \
		xz-dev \
		zlib-dev \
		zziplib-dev \
    && rm -rf /var/cache/apk/*

# 编译及执行方法如下:
# docker build -t alpine-buildpack ~/OpenSource/WaterBolik/docker-demo/buildpack/alpine-buildpack/
# docker build -t alpine-buildpack B:\OpenSource\WaterBolik\docker-demo\buildpack\alpine-buildpack\
# docker run -it --rm alpine-buildpack
