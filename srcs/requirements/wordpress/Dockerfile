FROM debian:stable
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
RUN apt-get update && apt-get -y upgrade && apt-get install -y --no-install-recommends
