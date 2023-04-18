FROM debian:stable

ENV DEBIAN_FRONTEND=noninteractive

COPY requirements/bonus/redis/conf/scriptredis.sh .

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && apt-get update && apt-get -y upgrade && apt-get install -y --no-install-recommends apt-utils && \
    apt-get install redis-server -y

EXPOSE 6379

CMD ["./scriptredis.sh"]