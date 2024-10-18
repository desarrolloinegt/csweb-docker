# Dockerfile
ARG MYSQL_VERSION=latest
FROM mysql:${MYSQL_VERSION}
COPY ./docker.cnf /etc/mysql/conf.d
RUN chmod 644 /etc/mysql/conf.d/docker.cnf