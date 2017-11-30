# FROM python:2.7.14-alpine3.6
FROM alpine_base
# FROM node:alpine

# https://store.docker.com/images/node

LABEL MAINTAINER="WaterBolik@163.com"

# https://github.com/nodejs/docker-node/blob/master/9/alpine/Dockerfile
ARG NODE_VERSION=9.2.0
ARG YARN_VERSION=1.3.2
# gpg keys listed at https://github.com/nodejs/node#release-team
RUN set -euxo pipefail \
    && apk add --update --no-cache \
        libstdc++ \
    && apk add --no-cache --virtual .build-deps \
        binutils-gold \
        curl \
        g++ \
        gcc \
        gnupg \
        libgcc \
        linux-headers \
        make \
        python \
        tar \
    \
    && export GNUPGHOME="$(mktemp -d)" \
    &&  for key in \
            94AE36675C464D64BAFA68DD7434390BDBE9B9C5 \
            FD3A5288F042B6850C66B31F09FE44734EB7990E \
            71DCFD284A79C3B38668286BC97EC7A07EDE3FC1 \
            DD8F2338BAE7501E3DD5AC78C273792F7D83545D \
            C4F0DFFF4E8C1A8236409D08E73BC641CC11F4C8 \
            B9AE9905FFD7803F25714661B63B535A4C206CA9 \
            56730D5401028683275BD23C23EFEFE93C4CFFFE \
            77984A986EBC2AA786BC0F66B01FBB92821C587A \
            6A010C5166006599AA17F08146C2130DFD2497F5 \
        ; do \
            gpg --keyserver-options timeout=10 --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys "$key" \
            gpg --keyserver-options timeout=10 --keyserver ha.pool.sks-keyservers.net --recv-keys "$key" || \
            gpg --keyserver-options timeout=10 --keyserver pgp.mit.edu --recv-keys "$key" || \
            gpg --keyserver-options timeout=10 --keyserver keyserver.pgp.com --recv-keys "$key" || \
            gpg --keyserver-options timeout=10 --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys "$key" \
            false; \
        done \
    \
    && curl -SLO "https://nodejs.org/dist/v$NODE_VERSION/SHASUMS256.txt" \
    && curl -SLO "https://nodejs.org/dist/v$NODE_VERSION/SHASUMS256.txt.sig" \
    && curl -SLO "https://nodejs.org/dist/v$NODE_VERSION/node-v$NODE_VERSION.tar.xz" \
    \
    && gpg --verify SHASUMS256.txt.sig SHASUMS256.txt \
    && grep "node-v$NODE_VERSION.tar.xz" SHASUMS256.txt | sha256sum -c - \
    \
    && tar -xf "node-v$NODE_VERSION.tar.xz" \
    \
    && rm -f "node-v$NODE_VERSION.tar.xz" \
    && rm -f SHASUMS256.txt.asc \
    && rm -f SHASUMS256.txt \
    \
    && cd "node-v$NODE_VERSION" \
    && ./configure \
    && make -j$(getconf _NPROCESSORS_ONLN) \
    && make install \
    && cd .. \
    && rm -rf "node-v$NODE_VERSION" \
    \
    && curl -fSLO --compressed "https://yarnpkg.com/downloads/$YARN_VERSION/yarn-v$YARN_VERSION.tar.gz" \
    && curl -fSLO --compressed "https://yarnpkg.com/downloads/$YARN_VERSION/yarn-v$YARN_VERSION.tar.gz.asc" \
    \
    && gpg --batch --verify yarn-v$YARN_VERSION.tar.gz.asc yarn-v$YARN_VERSION.tar.gz \
    \
    && mkdir -p /opt/yarn \
    && tar -xzf yarn-v$YARN_VERSION.tar.gz -C /opt/yarn --strip-components=1 \
    \
    && rm -f yarn-v$YARN_VERSION.tar.gz.asc \
    && rm -f yarn-v$YARN_VERSION.tar.gz \
    \
    && ln -s /opt/yarn/bin/yarn /usr/local/bin/yarn \
    && ln -s /opt/yarn/bin/yarn /usr/local/bin/yarnpkg \
    \
    && rm -rf "$GNUPGHOME" \
    && apk del .build-deps \
    && rm -rf /var/cache/apk/*

CMD [ "node" ]

# 编译及执行方法如下:
# $ docker build -t alpine-nodejs ~/OpenSource/WaterBolik/docker-demo/nodejs/alpine-nodejs/
# $ docker build -t alpine-nodejs B:\OpenSource\WaterBolik\docker-demo\nodejs\alpine-nodejs\
# $ docker run -it --rm alpine-nodejs

# $ docker run -it --rm --name my-running-script -v "$PWD":/usr/src/app -w /usr/src/app node:4 node your-daemon-or-script.js
