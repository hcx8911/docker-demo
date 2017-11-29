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
ARG GPG_KEY=C01E1CAD5EA2C4F0B8E3571504C367C218ADD4FF
ARG PYTHON_VERSION=2.7.14
ARG PYTHON_PIP_VERSION=9.0.1
RUN set -euxo pipefail \
    && apk add --update --no-cache --virtual .fetch-deps \
    ca-certificates \
    gnupg \
    libressl \
    tar \
    xz \
    \
    && export GNUPGHOME="$(mktemp -d)" \
    && gpg --keyserver ha.pool.sks-keyservers.net --recv-keys "$GPG_KEY" \
    && wget -O -l python.tar.xz.asc "https://www.python.org/ftp/python/${PYTHON_VERSION%%[a-z]*}/Python-$PYTHON_VERSION.tar.xz.asc" \
    && wget -O -l python.tar.xz "https://www.python.org/ftp/python/${PYTHON_VERSION%%[a-z]*}/Python-$PYTHON_VERSION.tar.xz" \
    && gpg --batch --verify python.tar.xz.asc python.tar.xz \
    && rm -rf "$GNUPGHOME" python.tar.xz.asc \
    && mkdir -p /usr/src/python \
    && tar -xJC /usr/src/python --strip-components=1 -f python.tar.xz \
    && rm python.tar.xz \
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
    && apk add --virtual .python-rundeps $runDeps \
    \
    && find /usr/local -depth \
    \( \
    \( -type d -a \( -name test -o -name tests \) \) \
    -o \
    \( -type f -a \( -name '*.pyc' -o -name '*.pyo' \) \) \
    \) -exec rm -rf '{}' + \
    && rm -rf /usr/src/python \
    && wget -O get-pip.py 'https://bootstrap.pypa.io/get-pip.py' \
    && python get-pip.py \
    --disable-pip-version-check \
    --no-cache-dir \
    "pip==$PYTHON_PIP_VERSION" \
    \
    && pip --version \
    && find /usr/local -depth \
    \( \
    \( -type d -a \( -name test -o -name tests \) \) \
    -o \
    \( -type f -a \( -name '*.pyc' -o -name '*.pyo' \) \) \
    \) -exec rm -rf '{}' + \
    \
    && rm -f get-pip.py \
    && apk del .build-deps \
    && apk del .fetch-deps \
    && rm -rf /var/cache/apk/* \
    && echo "end"

CMD ["python"]

# 编译及执行方法如下:
# docker build -t alpine-python2 /Volumes/Work/OpenSource/WaterBolik/docker-demo/python/alpine-python2/
# docker build -t alpine-python2 ~/OpenSource/WaterBolik/docker-demo/python/alpine-python2/
# docker build -t alpine-python2 B:\OpenSource\WaterBolik\docker-demo\python\alpine-python2\
# docker run -it --rm alpine-python2
