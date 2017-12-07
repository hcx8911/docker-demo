# FROM alpine-python2
# FROM python:2.7.14-alpine3.6
FROM alpine-python3
# FROM python:3.6.3-alpine3.6

LABEL MAINTAINER="WaterBolik@163.com"

VOLUME /usr/src/app

WORKDIR /usr/src/app

COPY requirements.txt ./

# ARG PIP_MIRROR=pypi.tuna.tsinghua.edu.cn
# ARG PIP_MIRROR=mirrors.aliyun.com/pypi
RUN set -euxo pipefail \
    && apk add --update --no-cache \
        postgresql-dev \
        netcat-openbsd \
    && apk add --virtual .fetch-deps \
        build-base \
        python3-dev \
        libffi-dev \
    && pip install --no-cache-dir --upgrade \
        -i https://pypi.tuna.tsinghua.edu.cn/simple \
        -r requirements.txt \
    && apk del .fetch-deps \
    && rm -rf /var/cache/apk/*

EXPOSE 5000

ADD ./entrypoint.sh /entrypoint.sh

CMD ["/entrypoint.sh"]

# CMD [ "python", "./start.py" ]
# CMD python manage.py runserver -h 0.0.0.0

# # install environment dependencies
# RUN apt-get update -yqq \
#   && apt-get install -yqq --no-install-recommends \
#     netcat \
#   && apt-get -q clean

# # set working directory
# RUN mkdir -p /usr/src/app
# WORKDIR /usr/src/app

# # add requirements (to leverage Docker cache)
# ADD ./requirements.txt /usr/src/app/requirements.txt

# # install requirements
# RUN pip install -r requirements.txt

# # add entrypoint.sh
# ADD ./entrypoint.sh /usr/src/app/entrypoint.sh

# # add app
# ADD . /usr/src/app

# # run server
# CMD ["./entrypoint.sh"]


# 编译及执行方法如下:
# docker build -t users-service ~/OpenSource/WaterBolik/docker-demo/flask/flask-microservices-users/users-service/
# docker build -t users-service B:\OpenSource\WaterBolik\docker-demo\flask\flask-microservices-users\users-service\
# docker run -it --rm  -p 8080:5000 -v ~/OpenSource/WaterBolik/docker-demo/flask/flask-microservices-users/app:/usr/src/app users-service
