# FROM golang
FROM golang:alpine
# FROM alpine_base

LABEL MAINTAINER="WaterBolik@163.com"

WORKDIR /go/src
VOLUME /go/src

COPY httpserver.go .

RUN go build -o myhttpserver ./httpserver.go