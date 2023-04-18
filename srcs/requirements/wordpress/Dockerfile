FROM debian:stable

ENV DEBIAN_FRONTEND=noninteractive

RUN mkdir /run/php/; mkdir -p /var/www/; \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && apt-get update && apt-get -y upgrade && apt-get install -y --no-install-recommends apt-utils

COPY ./requirements/wordpress/conf/wp-config-create.sh .

RUN apt-get install -y php7.4 php7.4-fpm php7.4-mysql php-redis curl

RUN curl -o wp https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    mv wp /usr/local/bin/ && chmod +x /usr/local/bin/wp && wp cli update --nightly --yes

RUN chmod +x wp-config-create.sh

EXPOSE 9000

CMD ["bash", "./wp-config-create.sh"]