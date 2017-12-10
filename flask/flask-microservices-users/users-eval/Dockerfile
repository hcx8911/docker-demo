# FROM alpine-python2
# FROM python:2.7.14-alpine3.6
FROM alpine-python3
# FROM python:3.6.3-alpine3.6

LABEL MAINTAINER="WaterBolik@163.com"

VOLUME /usr/src/app

WORKDIR /usr/src/app

COPY requirements.txt ./

# ARG PIP_MIRROR=https://pypi.tuna.tsinghua.edu.cn/simple
ARG PIP_MIRROR=https://mirrors.aliyun.com/pypi/simple/
RUN set -euxo pipefail \
    && apk add --update --no-cache \
        postgresql-dev \
        netcat-openbsd \
    && apk add --virtual .fetch-deps \
        build-base \
        python3-dev \
        libffi-dev \
    && pip install --no-cache-dir \
        -i "${PIP_MIRROR}" \
        -r requirements.txt \
    && pip freeze --all --local \
        | grep -v '^\-e' \
        | cut -d = -f 1 \
        | xargs pip install --no-cache-dir --upgrade \
            -i "${PIP_MIRROR}" \
    && apk del .fetch-deps \
    && rm -rf /var/cache/apk/*

EXPOSE 5000

ADD ./entrypoint.sh /entrypoint.sh

CMD ["/entrypoint.sh"]
# CMD python manage.py runserver -h 0.0.0.0
# CMD gunicorn -b 0.0.0.0:5000 manage:app

# 编译及执行方法如下:
# docker build -t users-eval ~/OpenSource/WaterBolik/docker-demo/flask/flask-microservices-users/users-eval/
# docker build -t users-eval B:\OpenSource\WaterBolik\docker-demo\flask\flask-microservices-users\users-eval\
# docker run -it --rm  -p 8080:5000 -v ~/OpenSource/WaterBolik/docker-demo/flask/flask-microservices-users/app:/usr/src/app users-eval
