FROM alpine:edge
MAINTAINER tim@haak.co

ENV LANG="en_US.UTF-8" \
    LC_ALL="en_US.UTF-8" \
    LANGUAGE="en_US.UTF-8" \
    DB_USER="admin" \
    DB_PASS="password" \
    TERM="xterm"

RUN apk -U upgrade && \
    apk --update add \
      mariadb mariadb-client \
      && \
      rm -rf /tmp/src && \
      rm -rf /var/cache/apk/*


ADD ./files/my.cnf /etc/mysql/my.cnf
ADD ./files/start.sh /start.sh

RUN chmod u+x /start.sh

VOLUME ["/data"]
EXPOSE 3306

CMD ["/start.sh"]
