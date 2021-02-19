FROM nacos/nacos-server:1.4.1
MAINTAINER dargoner "dargun@163.com"

# set environment
ENV MODE=cluster \
    PREFER_HOST_MODE=hostname\
    NACOS_USER=nacos \
    NACOS_DEBUG=n \
    TZ="Asia/Shanghai" \
    MYSQL_SERVICE_HOST=mysql \
    MYSQL_SERVICE_DB_NAME=nacos_devtest \
    MYSQL_SERVICE_PORT=3306 \
    MYSQL_SERVICE_USER=nacos \
    MYSQL_SERVICE_PASSWORD=nacos

WORKDIR /$BASE_DIR

ADD docker-entrypoint.sh /docker-entrypoint.sh

RUN chmod +x /docker-entrypoint.sh

EXPOSE 8848

ENTRYPOINT ["/docker-entrypoint.sh"]