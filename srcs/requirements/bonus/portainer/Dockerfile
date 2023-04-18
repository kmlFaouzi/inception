FROM debian:stable

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && apt-get update && apt-get -y upgrade && apt-get install -y --no-install-recommends apt-utils && \
    apt-get update && apt-get install -y wget; \
    wget https://github.com/portainer/portainer/releases/download/2.9.0/portainer-2.9.0-linux-amd64.tar.gz; \
    tar -zxvf portainer-2.9.0-linux-amd64.tar.gz; \
    rm portainer-2.9.0-linux-amd64.tar.gz; \
    mv portainer /opt/portainer/

EXPOSE 9000

CMD ["/opt/portainer/portainer"]