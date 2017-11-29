
FROM alpine_base

LABEL MAINTAINER="WaterBolik@163.com"

# https://store.docker.com/images/python
# FROM python:3.6.3-alpine3.6
# https://github.com/docker-library/python/blob/master/3.6/alpine3.6/Dockerfile
ARG GPG_KEY=0D96DF4D4110E5C43FBFB17F2D347EA6AA65421D
ARG PYTHON_VERSION=3.6.3
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
	&& apk add --virtual .python-rundeps $runDeps \
	\
	&& find /usr/local -depth \
	\( \
	\( -type d -a \( -name test -o -name tests \) \) \
	-o \
	\( -type f -a \( -name '*.pyc' -o -name '*.pyo' \) \) \
	\) -exec rm -rf '{}' + \
	&& rm -rf /usr/src/python \
	\
	&& wget -O get-pip.py 'https://bootstrap.pypa.io/get-pip.py' \
	&& python3 get-pip.py \
	--disable-pip-version-check \
	--no-cache-dir \
	"pip==$PYTHON_PIP_VERSION" \
	&& pip3 --version \
	&& find /usr/local -depth \
	\( \
	\( -type d -a \( -name test -o -name tests \) \) \
	-o \
	\( -type f -a \( -name '*.pyc' -o -name '*.pyo' \) \) \
	\) -exec rm -rf '{}' + \
	&& rm -f get-pip.py \
	&& cd /usr/bin \
	&& ln -s idle3 idle \
	&& ln -s pydoc3 pydoc \
	&& ln -s python3 python \
	&& ln -s python3-config python-config \
	&& ln -s pip3 pip \
	&& apk del .fetch-deps \
	&& apk del .build-deps \
	&& rm -rf /var/cache/apk/* \
	&& echo "end"

CMD ["python"]

# 编译及执行方法如下:
# docker build -t alpine-python3 /Volumes/Work/OpenSource/WaterBolik/docker-demo/python/alpine-python3/
# docker build -t alpine-python3 ~/OpenSource/WaterBolik/docker-demo/python/alpine-python3/
# docker build -t alpine-python3 B:\OpenSource\WaterBolik\docker-demo\python\alpine-python3\
# docker run -it --rm alpine-python3
