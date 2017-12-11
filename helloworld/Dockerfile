# 此镜像是从白手起家，从 0 开始构建。
FROM scratch

# https://hub.docker.com/_/hello-world/
# https://github.com/docker-library/hello-world.git

LABEL MAINTAINER="WaterBolik@163.com"

# 将文件“hello”复制到镜像的根目录。
COPY hello /

# 容器启动时，执行 /hello
CMD ["/hello"]

