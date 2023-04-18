FROM debian:stable
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    apt-get update && apt-get -y upgrade && apt-get install -y --no-install-recommends apt-utils

COPY ./requirements/mariadb/conf/create_db.sh /tmp/create_db.sh

RUN apt-get update && apt-get install -y mariadb-server && \
    sed -i "s|bind-address            = 127.0.0.1|bind-address            = 0.0.0.0|g" /etc/mysql/mariadb.conf.d/50-server.cnf; \
    mkdir /var/run/mysqld;chmod 777 /var/run/mysqld; \
    chmod +x /tmp/create_db.sh

EXPOSE 3306

CMD ["bash", "/tmp/create_db.sh"]