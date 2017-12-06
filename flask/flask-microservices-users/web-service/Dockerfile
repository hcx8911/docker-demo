FROM alpine-nodejs
# FROM node:alpine

LABEL MAINTAINER="WaterBolik@163.com"

VOLUME /usr/src/app

WORKDIR /usr/src/app

ARG REACT_APP_USERS_SERVICE_URL
ARG NODE_ENV
ENV NODE_ENV $NODE_ENV
ENV REACT_APP_USERS_SERVICE_URL $REACT_APP_USERS_SERVICE_URL

RUN set -euxo pipefail \
    && npm install --global --registry=https://registry.npm.taobao.org \
        create-react-app \
        react-scripts \
        pushstate-server

# add `/usr/src/app/node_modules/.bin` to $PATH
# ENV PATH /usr/src/app/node_modules/.bin:$PATH

# install and cache app dependencies
# ADD package.json /usr/src/app/package.json
# RUN npm install --silent
# RUN npm install react-scripts@0.9.5 -g --silent

# add app
# ADD . /usr/src/app

# EXPOSE 3000

# start app
# CMD ["npm", "start"]
# CMD yarn start

# start app
CMD ["pushstate-server", "build"]
# CMD sh

# 编译及执行方法如下:
# $ docker build -t web-service ~/OpenSource/WaterBolik/docker-demo/flask/flask-microservices-users/web-service/
# $ docker build -t web-service B:\OpenSource\WaterBolik\docker-demo\flask\flask-microservices-users\web-service\
# $ docker run -it --rm -p 3000:3000 -v ~/OpenSource/WaterBolik/docker-demo/flask/flask-microservices-users/web-service/app:/usr/src/app web-service

# --registry=https://registry.npm.taobao.org
# $ npm install --global create-react-app
# 创建 react 项目
# $ create-react-app .
# 安装 Axios to manage the AJAX call
# $ npm install axios --save
# $ yarn add axios
