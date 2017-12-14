# FROM golang
# FROM golang:alpine
FROM alpine_base

# https://store.docker.com/images/golang
# http://en.wikipedia.org/wiki/Go_%28programming_language%29
#

# RUN apk add --update --no-cache ca-certificates

# ENV GOLANG_VERSION 1.9.2

# no-pic.patch: https://golang.org/issue/14851 (Go 1.8 & 1.7)
# COPY *.patch /go-alpine-patches/

RUN set -euxo pipefail \
	&& apk add --update --no-cache \
		musl-dev \
		go \
    && rm -rf /var/cache/apk/*

# ENV GOPATH /go
# ENV PATH $GOPATH/bin:/usr/local/go/bin:$PATH

# RUN mkdir -p "$GOPATH/src" "$GOPATH/bin" && chmod -R 777 "$GOPATH"
# WORKDIR $GOPATH

# COPY go-wrapper /usr/local/bin/
