# FROM python:2.7.14-alpine3.6
FROM alpine_base

# https://store.docker.com/images/python

LABEL MAINTAINER="WaterBolik@163.com"

RUN set -euxo pipefail \   
    && apk add --update --no-cache \
    python2 \   
    py2-pip \    
    && rm -rf /var/cache/apk/* \
    && echo "end"

CMD ["python"]

# 编译及执行方法如下: 
# docker build -t alpine-python2 /Volumes/Work/OpenSource/WaterBolik/docker-demo/python/alpine-python2/
# docker build -t alpine-python2 ~/OpenSource/WaterBolik/docker-demo/python/alpine-python2/
# docker build -t alpine-python2 B:\OpenSource\WaterBolik\docker-demo\python\alpine-python2\
# docker run -it --rm alpine-python2 