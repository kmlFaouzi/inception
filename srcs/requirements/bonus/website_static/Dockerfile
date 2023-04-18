FROM debian:stable

ENV DEBIAN_FRONTEND=noninteractive

RUN mkdir -p /var/www/; \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && apt-get update && apt-get -y upgrade && apt-get install -y --no-install-recommends apt-utils && \
    apt-get install -y nginx

COPY ./requirements/bonus/website_static/conf/nginx.conf /etc/nginx/conf.d/
COPY ./requirements/bonus/website_static/tools/index.html /var/www/


EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]