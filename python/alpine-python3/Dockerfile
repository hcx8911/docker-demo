
FROM alpine_base

LABEL MAINTAINER="WaterBolik@163.com"

# https://store.docker.com/images/python
# FROM python:3.6.3-alpine3.6
# https://www.python.org/
# https://github.com/docker-library/python/blob/master/3.6/alpine3.6/Dockerfile
ARG PYTHON_KEY=0D96DF4D4110E5C43FBFB17F2D347EA6AA65421D
ARG PYTHON_VERSION=3.6.3
ARG PYTHON_PIP_VERSION=9.0.1
# ARG PIP_MIRROR=https://pypi.tuna.tsinghua.edu.cn/simple
ARG PIP_MIRROR=https://mirrors.aliyun.com/pypi/simple/
RUN set -euxo pipefail \
    && apk add --update --no-cache --virtual .fetch-deps \
        ca-certificates \
        gnupg \
        curl \
        tar \
        xz \
    \
    && export GNUPGHOME="$(mktemp -d)" \
    &&  for key in \
            0D96DF4D4110E5C43FBFB17F2D347EA6AA65421D \
        ; do \
            gpg --keyserver-options timeout=10 --keyserver pgp.mit.edu --recv-keys "$key" || \
            gpg --keyserver-options timeout=10 --keyserver keyserver.pgp.com --recv-keys "$key" || \
            gpg --keyserver-options timeout=10 --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys "$key" \
            gpg --keyserver-options timeout=10 --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys "$key" \
            gpg --keyserver-options timeout=10 --keyserver ha.pool.sks-keyservers.net --recv-keys "$key" || \
            false; \
        done \
    \
    && curl -fSL -o python.tar.xz.asc "https://www.python.org/ftp/python/${PYTHON_VERSION%%[a-z]*}/Python-$PYTHON_VERSION.tar.xz.asc" \
    && curl -fSL -o python.tar.xz "https://www.python.org/ftp/python/${PYTHON_VERSION%%[a-z]*}/Python-$PYTHON_VERSION.tar.xz" \
    && gpg --batch --verify python.tar.xz.asc python.tar.xz \
    \
    && mkdir -p /usr/src/python \
    && tar -xJC /usr/src/python --strip-components=1 -f python.tar.xz \
    \
    && rm -f python.tar.xz.asc \
    && rm -f python.tar.xz \
    && rm -rf "$GNUPGHOME" \
    \
    && apk add --no-cache --virtual .build-deps  \
        bzip2-dev \
        coreutils \
        dpkg-dev dpkg \
        expat-dev \
        gcc \
        gdbm-dev \
        libc-dev \
        libffi-dev \
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
        xz-dev \
        zlib-dev \
    \
    && cd /usr/src/python \
    && gnuArch="$(dpkg-architecture --query DEB_BUILD_GNU_TYPE)" \
    && ./configure \
        --build="$gnuArch" \
        --enable-loadable-sqlite-extensions \
        --enable-shared \
        --with-system-expat \
        --with-system-ffi \
        --without-ensurepip \
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
    && python3 get-pip.py \
        --disable-pip-version-check \
        --no-cache-dir \
        "pip==$PYTHON_PIP_VERSION" \
    && rm -f get-pip.py \
    && pip3 --version \
    \
    && python3_path="$(which python3)" \
    && cd "${python3_path%/*}" \
    && ln -s idle3 idle \
    && ln -s pydoc3 pydoc \
    && ln -s python3 python \
    && ln -s python3-config python-config \
    \
    && mkdir -p ${HOME}/.pip \
    &&  { \
            echo "[global]"; \
            echo "index-url = ${PIP_MIRROR}"; \
        } \
    && pip freeze --all --local \
        | grep -v '^\-e' \
        | cut -d = -f 1 \
        | xargs pip install --no-cache-dir --upgrade \
            -i "${PIP_MIRROR}" \
    \
    && find /usr/local -depth \
        \( \
            \( -type d -a \( -name test -o -name tests \) \) \
            -o \
            \( -type f -a \( -name '*.pyc' -o -name '*.pyo' \) \) \
        \) -exec rm -rf '{}' + \
    \
    && apk del .fetch-deps \
    && apk del .build-deps \
    && rm -rf /var/cache/apk/*

CMD ["python"]

# 编译及执行方法如下:
# docker build -t alpine-python3 ~/OpenSource/WaterBolik/docker-demo/python/alpine-python3/
# docker build -t alpine-python3 B:\OpenSource\WaterBolik\docker-demo\python\alpine-python3\
# docker run -it --rm alpine-python3
