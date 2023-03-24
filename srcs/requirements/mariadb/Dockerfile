FROM debian:stable
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
RUN apt-get update && apt-get -y upgrade && apt-get install -y --no-install-recommends apt-utils && apt-get update && apt-get install -y mariadb-server
RUN sed -i "s|bind-address            = 127.0.0.1|bind-address            = 0.0.0.0|g" /etc/mysql/mariadb.conf.d/50-server.cnf
COPY conf/create_db.sh /tmp/create_db.sh
RUN mkdir /var/run/mysqld;chmod 777 /var/run/mysqld;chmod +x /tmp/create_db.sh
EXPOSE 3306
ENTRYPOINT ["/tmp/create_db.sh"]