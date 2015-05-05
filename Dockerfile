FROM simplexsys/debian-zulu-jdk:latest
MAINTAINER qsys <kurt.sys@gmail.com>

ENV VERTX_VERSION 2.1.5

RUN (curl -L https://bintray.com/artifact/download/vertx/downloads/vert.x-${VERTX_VERSION}.tar.gz -o /tmp/vertx.tar.gz &&\
     gunzip < /tmp/vertx.tar.gz | tar xvf - -C /opt &&\
     rm /tmp/vertx.tar.gz)
RUN ln -s /opt/vert.x-${VERTX_VERSION} /opt/vertx

VOLUME /opt/vertx/mods
VOLUME /opt/vertx/sys-mods
EXPOSE 8080

ENTRYPOINT ["/opt/vertx/bin/vertx"]
