FROM alpine_base
# FROM centos_base
# FROM centos6_base
# FROM debian_base
# FROM ubuntu_base

LABEL MAINTAINER="WaterBolik@163.com"

VOLUME /usr/src

WORKDIR /usr/src

RUN set -euxo pipefail \
    && apk add --update --no-cache \
        psmisc \
        htop \
        procps \
        glances \
        iotop \
    && rm -rf /var/cache/apk/*

EXPOSE 61209

# CMD ["/bin/sh"]
