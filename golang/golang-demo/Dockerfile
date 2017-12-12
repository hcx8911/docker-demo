# FROM golang
FROM golang:alpine as builder
# FROM alpine_base

LABEL MAINTAINER="WaterBolik@163.com"

WORKDIR /usr/src

COPY /src/* .

RUN go build -o myhttpserver ./httpserver.go

FROM alpine-base

WORKDIR /root/

COPY --from=builder /go/src/myhttpserver .

RUN chmod +x /root/myhttpserver

ENTRYPOINT ["/root/myhttpserver"]