FROM centos_base

LABEL MAINTAINER="WaterBolik@163.com"

# https://store.docker.com/images/buildpack-deps
# https://github.com/docker-library/buildpack-deps.git
RUN set -euxo pipefail \
    && yum -y install \
		ca-certificates \
		curl \
		wget \
		gnupg \
		dirmngr \
        bzr \
		git \
		mercurial \
		openssh-client \
		subversion \
		procps \
        autoconf \
		automake \
		bzip2 \
		dpkg-dev \
		file \
		g++ \
		gcc \
		imagemagick \
		libbz2-dev \
		libc6-dev \
		libcurl4-openssl-dev \
		libdb-dev \
		libevent-dev \
		libffi-dev \
		libgdbm-dev \
		libgeoip-dev \
		libglib2.0-dev \
		libjpeg-dev \
		libkrb5-dev \
		liblzma-dev \
		libmagickcore-dev \
		libmagickwand-dev \
		libncurses5-dev \
		libncursesw5-dev \
		libpng-dev \
		libpq-dev \
		libreadline-dev \
		libsqlite3-dev \
		libssl-dev \
		libtool \
		libwebp-dev \
		libxml2-dev \
		libxslt-dev \
		libyaml-dev \
		make \
		patch \
		xz-utils \
		zlib1g-dev \
        libmysqlclient-dev \
    && yum clean all

