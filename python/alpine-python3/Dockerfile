
FROM alpine-base

LABEL MAINTAINER="WaterBolik@163.com"

# https://store.docker.com/images/python
# FROM python:3.6.3-alpine3.6
ARG PYTHON_VERSION=3.6.1-r3
ARG PYTHON_PIP_VERSION=9.0.1
RUN set -euxo pipefail \   
    && apk add --update --no-cache \
        python3=$PYTHON_VERSION \   
    && apk add --no-cache --virtual .fetch-deps \
        libressl \
    && rm -rf /var/cache/apk/* \
	&& wget -O get-pip.py 'https://bootstrap.pypa.io/get-pip.py' \
	&& apk del .fetch-deps \
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
    && echo "end"

CMD ["python"]

# 编译及执行方法如下: 
# docker build -t alpine-python3 /Volumes/Work/OpenSource/WaterBolik/docker-demo/python/alpine-python3/
# docker build -t alpine-python3 ~/OpenSource/WaterBolik/docker-demo/python/alpine-python3/
# docker build -t alpine-python3 B:\OpenSource\WaterBolik\docker-demo\python\alpine-python3\
# docker run -it --rm alpine-python3 