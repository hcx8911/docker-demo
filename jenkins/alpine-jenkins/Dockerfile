FROM alpine-openjdk

# https://hub.docker.com/r/jenkins/jenkins/
# To use the latest LTS: docker pull jenkins/jenkins:lts
# To use the latest weekly: docker pull jenkins/jenkins

LABEL MAINTAINER="WaterBolik@163.com"

ENV JENKINS_HOME=/var/jenkins_home \
    JENKINS_SLAVE_AGENT_PORT=50000 \
    JENKINS_UC=https://updates.jenkins.io \
    JENKINS_UC_EXPERIMENTAL=https://updates.jenkins.io/experimental \
    COPY_REFERENCE_FILE_LOG=/var/jenkins_home/copy_reference_file.log

VOLUME /var/jenkins_home

# LTS: 2.89.2
# https://jenkins.io/download/
ENV JENKINS_VERSION=2.89.2

# https://github.com/jenkinsci/docker/blob/master/Dockerfile-alpine
RUN set -euxo pipefail \
    && apk add --no-cache \
        git \
        openssh-client \
        curl \
        unzip \
        bash \
        ttf-dejavu \
        coreutils \
        tini \
    && apk add --update --no-cache --virtual .fetch-deps \
        gnupg \
    \
    && export GNUPGHOME="$(mktemp -d)" \
    &&  for key in \
            150FDE3F7787E7D11EF4E12A9B7D32F2D50582E6 \
        ; do \
            gpg --keyserver-options timeout=10 --keyserver pgp.mit.edu --recv-keys "$key" || \
            gpg --keyserver-options timeout=10 --keyserver keyserver.pgp.com --recv-keys "$key" || \
            gpg --keyserver-options timeout=10 --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys "$key" \
            gpg --keyserver-options timeout=10 --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys "$key" \
            gpg --keyserver-options timeout=10 --keyserver ha.pool.sks-keyservers.net --recv-keys "$key" || \
            false; \
        done \
    \
    && mkdir -p \
        /usr/share/jenkins/ref/init.groovy.d \
        /var/jenkins_home \
    \
    && curl -fsSL https://repo.jenkins-ci.org/public/org/jenkins-ci/main/jenkins-war/${JENKINS_VERSION}/jenkins-war-${JENKINS_VERSION}.war.asc \
        -o /usr/share/jenkins/jenkins.war.asc \
    && curl -fsSL https://repo.jenkins-ci.org/public/org/jenkins-ci/main/jenkins-war/${JENKINS_VERSION}/jenkins-war-${JENKINS_VERSION}.war \
        -o /usr/share/jenkins/jenkins.war \
    && gpg --batch --verify /usr/share/jenkins/jenkins.war.asc /usr/share/jenkins/jenkins.war \
    && rm -f /usr/share/jenkins/jenkins.war.asc\
    \
    && apk del .fetch-deps \
    && rm -rf /var/cache/apk/*

    # && curl -fsSL https://pkg.jenkins.io/debian/jenkins-ci.org.key -o jenkins-ci.org.key \
    # && gpg --import jenkins-ci.org.key \
    # 150FDE3F7787E7D11EF4E12A9B7D32F2D50582E6
    # && echo "${JENKINS_SHA}  /usr/share/jenkins/jenkins.war" | sha256sum -c - \

EXPOSE 8080 50000

COPY init.groovy /usr/share/jenkins/ref/init.groovy.d/tcp-slave-agent-port.groovy
COPY jenkins-support /usr/local/bin/jenkins-support
COPY jenkins.sh /usr/local/bin/jenkins.sh
# from a derived Dockerfile, can use `RUN plugins.sh active.txt` to setup /usr/share/jenkins/ref/plugins from a support bundle
COPY plugins.sh /usr/local/bin/plugins.sh
COPY install-plugins.sh /usr/local/bin/install-plugins.sh

RUN set -euxo pipefail \
     && chmod +x /usr/local/bin/*

ENTRYPOINT ["/sbin/tini", "--", "/usr/local/bin/jenkins.sh"]

# ENTRYPOINT ["/bin/tini", "--", "sh", "/usr/local/bin/jenkins.sh"]

# ENTRYPOINT ["sh", "/usr/local/bin/jenkins.sh"]


# 编译及执行方法如下:
# $ docker build -t alpine-jenkins ~/OpenSource/WaterBolik/docker-demo/jenkins/alpine-jenkins/
# $ docker build -t alpine-jenkins B:\OpenSource\WaterBolik\docker-demo/jenkins/\alpine-jenkins\
# $ docker run --rm --name alpine-jenkins -p 8080:8080 -p 50000:50000 -v jenkins_home:/var/jenkins_home alpine-jenkins
