
FROM alpine-python2
# FROM python:2.7.14-alpine3.6
# FROM alpine-python3
# FROM python:3.6.3-alpine3.6

LABEL MAINTAINER="WaterBolik@163.com"

VOLUME /usr/src/app

WORKDIR /usr/src/app

COPY requirements.txt ./

RUN pip install --no-cache-dir -r requirements.txt

CMD [ "python", "./start.py" ]

# 编译及执行方法如下: 
# docker build -t python-demo /Volumes/Work/OpenSource/WaterBolik/docker-demo/python/python-demo/
# docker build -t python-demo ~/OpenSource/WaterBolik/docker-demo/python/python-demo/
# docker build -t python-demo B:\OpenSource\WaterBolik\docker-demo\python\python-demo\
# docker run -it --rm -v  ~/OpenSource/WaterBolik/docker-demo/python/python-demo/app:/usr/src/app python-demo 