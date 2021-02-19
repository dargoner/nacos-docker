FROM openjdk:8-jdk
MAINTAINER dargoner "dargun@163.com"

# set environment
ENV MODE=cluster \
    PREFER_HOST_MODE=ip\
    BASE_DIR=/home/nacos \
    CLASSPATH=.:/home/nacos/conf:$CLASSPATH \
    CLUSTER_CONF=/home/nacos/conf/cluster.conf \
    FUNCTION_MODE=all \
    NACOS_USER=nacos \
    JAVA=java \
    NACOS_DEBUG=n \
    TOMCAT_ACCESSLOG_ENABLED=false \
    TZ="Asia/Shanghai"

ARG NACOS_VERSION=1.4.1

WORKDIR /$BASE_DIR

RUN apt-get update && apt-get install -y dnsutils
RUN wget --progress=dot:giga https://github.com/alibaba/nacos/releases/download/${NACOS_VERSION}/nacos-server-${NACOS_VERSION}.tar.gz -P /home
RUN tar -xzvf /home/nacos-server-${NACOS_VERSION}.tar.gz -C /home \
    && rm -rf /home/nacos-server-${NACOS_VERSION}.tar.gz /home/nacos/bin/* /home/nacos/conf/*.properties /home/nacos/conf/*.example /home/nacos/conf/nacos-mysql.sql
RUN ln -sf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

ADD bin/docker-startup.sh bin/docker-startup.sh
ADD conf/application.properties conf/application.properties
ADD init.d/custom.properties init.d/custom.properties

# set startup log dir
RUN mkdir -p logs \
	&& cd logs \
	&& touch start.out \
	&& ln -sf /dev/stdout start.out \
	&& ln -sf /dev/stderr start.out
RUN chmod +x bin/docker-startup.sh

EXPOSE 8848
ENTRYPOINT ["bin/docker-startup.sh"]
