# FROM python:2.7.14-alpine3.6
FROM alpine_base

# https://store.docker.com/images/python

LABEL MAINTAINER="WaterBolik@163.com"

# apk 安装
#   python 2.7.13
#   pip 9.0.1
#   alpine-python2 53.1MB
# RUN set -euxo pipefail \
#     && apk add --update --no-cache \
#     python2 \
#     py2-pip \
#     && rm -rf /var/cache/apk/* \
#     && echo "end"

# 编译安装
# https://github.com/docker-library/python/blob/master/2.7/alpine3.6/Dockerfile
ARG PYTHON_VERSION=2.7.14
ARG PYTHON_PIP_VERSION=9.0.1
RUN set -euxo pipefail \
    && apk add --update --no-cache --virtual .fetch-deps \
        ca-certificates \
        gnupg \
        libressl \
        curl \
        tar \
        xz \
    \
    && export GNUPGHOME="$(mktemp -d)" \
    &&  for key in \
            C01E1CAD5EA2C4F0B8E3571504C367C218ADD4FF \
        ; do \
            gpg --keyserver-options timeout=10 --keyserver pgp.mit.edu --recv-keys "$key" || \
            gpg --keyserver-options timeout=10 --keyserver keyserver.pgp.com --recv-keys "$key" || \
            gpg --keyserver-options timeout=10 --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys "$key" \
            gpg --keyserver-options timeout=10 --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys "$key" \
            gpg --keyserver-options timeout=10 --keyserver ha.pool.sks-keyservers.net --recv-keys "$key" || \
            break; \
        done \
    \
    && curl -fSL -o python.tar.xz.asc "https://www.python.org/ftp/python/${PYTHON_VERSION%%[a-z]*}/Python-$PYTHON_VERSION.tar.xz.asc" \
    && curl -fSL -o python.tar.xz "https://www.python.org/ftp/python/${PYTHON_VERSION%%[a-z]*}/Python-$PYTHON_VERSION.tar.xz" \
    && gpg --batch --verify python.tar.xz.asc python.tar.xz \
    && mkdir -p /usr/src/python \
    && tar -xJC /usr/src/python --strip-components=1 -f python.tar.xz \
    && rm -f python.tar.xz \
    && rm -f python.tar.xz.asc \
    && rm -rf "$GNUPGHOME" \
    \
    && apk add --no-cache --virtual .build-deps \
        bzip2-dev \
        coreutils \
        dpkg-dev dpkg \
        gcc \
        gdbm-dev \
        libc-dev \
        linux-headers \
        make \
        ncurses-dev \
        libressl \
        libressl-dev \
        pax-utils \
        readline-dev \
        sqlite-dev \
        tcl-dev \
        tk \
        tk-dev \
        zlib-dev \
    \
    && cd /usr/src/python \
    && gnuArch="$(dpkg-architecture --query DEB_BUILD_GNU_TYPE)" \
    && ./configure \
        --build="$gnuArch" \
        --enable-shared \
        --enable-unicode=ucs4 \
    && make -j "$(nproc)" \
    && make install \
    \
    && runDeps="$( \
        scanelf --needed --nobanner --format '%n#p' --recursive /usr/local \
        | tr ',' '\n' \
        | sort -u \
        | awk 'system("[ -e /usr/local/lib/" $1 " ]") == 0 { next } { print "so:" $1 }' \
    )" \
    && apk add --virtual .python-rundeps \
        $runDeps \
    && cd ~ \
    && rm -rf /usr/src/python \
    \
    && curl -fSL -o get-pip.py "https://bootstrap.pypa.io/get-pip.py" \
    && python get-pip.py \
        --disable-pip-version-check \
        --no-cache-dir \
        "pip==$PYTHON_PIP_VERSION" \
    && pip --version \
    && rm -f get-pip.py \
    \
    && find /usr/local -depth \
        \( \
            \( -type d -a \( -name test -o -name tests \) \) \
            -o \
            \( -type f -a \( -name '*.pyc' -o -name '*.pyo' \) \) \
        \) -exec rm -rf '{}' + \
    \
    && apk del .build-deps \
    && apk del .fetch-deps \
    && rm -rf /var/cache/apk/*

CMD ["python"]

# 编译及执行方法如下:
# docker build -t alpine-python2 ~/OpenSource/WaterBolik/docker-demo/python/alpine-python2/
# docker build -t alpine-python2 B:\OpenSource\WaterBolik\docker-demo\python\alpine-python2\
# docker run -it --rm alpine-python2
