FROM centos_base
# https://hub.docker.com/_/centos/

LABEL MAINTAINER=WaterBolik@163.com

# use systemd
ENV container docker
RUN set -euxo pipefail \
    && ( \
            cd /lib/systemd/system/sysinit.target.wants/; \
            for i in *; do \
                [ $i == systemd-tmpfiles-setup.service ] \
                || rm -f $i; \
            done \
        ); \
    rm -f /lib/systemd/system/multi-user.target.wants/*;\
    rm -f /etc/systemd/system/*.wants/*;\
    rm -f /lib/systemd/system/local-fs.target.wants/*; \
    rm -f /lib/systemd/system/sockets.target.wants/*udev*; \
    rm -f /lib/systemd/system/sockets.target.wants/*initctl*; \
    rm -f /lib/systemd/system/basic.target.wants/*;\
    rm -f /lib/systemd/system/anaconda.target.wants/*;

VOLUME [ "/sys/fs/cgroup" ]

# 启用SystemCtl必须采用该方式
CMD ["/usr/sbin/init"]

# $ docker build -t centos_systemd /Volumes/Work/OpenSource/WaterBolik/docker-demo/os_base/centos_systemd/
# $ docker build -t centos_systemd ~/OpenSource/WaterBolik/docker-demo/os_base/centos_systemd/
# $ docker build -t centos_systemd B:/OpenSource/WaterBolik/docker-demo/os_base/centos_systemd/
# $ docker run -it --rm --name centos_systemd --privileged=true -d centos_systemd 
# $ docker exec -it centos_systemd bash
# $ docker stop centos_systemd
