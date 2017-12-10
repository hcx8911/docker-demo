
FROM alpine-python2
# FROM python:2.7.14-alpine3.6
# FROM alpine-python3
# FROM python:3.6.3-alpine3.6

LABEL MAINTAINER="WaterBolik@163.com"

VOLUME /usr/src/app

WORKDIR /usr/src/app

COPY requirements.txt ./

# ARG PIP_MIRROR=https://pypi.tuna.tsinghua.edu.cn/simple
ARG PIP_MIRROR=https://mirrors.aliyun.com/pypi/simple/
RUN set -euxo pipefail \
    && pip install --no-cache-dir \
        -i "${PIP_MIRROR}" \
        -r requirements.txt \
    && pip freeze --all --local \
        | grep -v '^\-e' \
        | cut -d = -f 1 \
        | xargs pip install --no-cache-dir --upgrade \
            -i "${PIP_MIRROR}"

CMD [ "python", "./start.py" ]

# 编译及执行方法如下:
# docker build -t python-demo ~/OpenSource/WaterBolik/docker-demo/python/python-demo/
# docker build -t python-demo B:\OpenSource\WaterBolik\docker-demo\python\python-demo\
# docker run -it --rm -v  ~/OpenSource/WaterBolik/docker-demo/python/python-demo/app:/usr/src/app python-demo
