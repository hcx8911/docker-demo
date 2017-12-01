FROM alpine-nodejs
# FROM node:alpine

LABEL MAINTAINER="WaterBolik@163.com"

VOLUME /usr/src/app

WORKDIR /usr/src/app

RUN set -euxo pipefail \
    && npm install --global --registry=https://registry.npm.taobao.org \
        create-react-app

# add `/usr/src/app/node_modules/.bin` to $PATH
# ENV PATH /usr/src/app/node_modules/.bin:$PATH

# install and cache app dependencies
# ADD package.json /usr/src/app/package.json
# RUN npm install --silent
# RUN npm install react-scripts@0.9.5 -g --silent

# add app
# ADD . /usr/src/app

EXPOSE 3000

# start app
CMD ["npm", "start"]

# CMD sh

# 编译及执行方法如下:
# docker build -t web-service ~/OpenSource/WaterBolik/docker-demo/flask/flask-microservices-users/web-service/
# docker build -t web-service B:\OpenSource\WaterBolik\docker-demo\flask\flask-microservices-users\web-service\
# docker run -it --rm -p 3000:3000 -v ~/OpenSource/WaterBolik/docker-demo/flask/flask-microservices-users/web-service/app:/usr/src/app web-service
