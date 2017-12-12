# FROM golang
FROM golang:alpine as gobuilder
# FROM alpine_base

LABEL MAINTAINER="WaterBolik@163.com"

WORKDIR /usr/src

# COPY /src/* .
COPY /src/go/hello.go .

# 在主流编程语言中，Go的移植性已经是数一数二的了，
# 尤其是Go 1.5之后，Go将runtime中的C代码都用Go重写了，
# 对libc的依赖已经降到最低了，但仍有一些feature提供了两个版本的实现：C实现和Go实现。
# 并且默认情况下，即在CGO_ENABLED=1的情况下，程序和预编译的标准库都采用了C的实现。
# 关于这方面的详细论述请参见我之前写的《也谈Go的可移植性》一文，这里就不赘述了。
# http://tonybai.com/2017/06/27/an-intro-about-go-portability/
RUN CGO_ENABLED=0 go build -o hello ./hello.go

FROM alpine-base

WORKDIR /root/

COPY --from=gobuilder /usr/src/hello .

RUN chmod +x /root/hello

ENTRYPOINT ["/root/hello"]