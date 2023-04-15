FROM debian:stable

ENV DEBIAN_FRONTEND=noninteractive

RUN mkdir /run/php/; mkdir -p /var/www/; \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && apt-get update && apt-get -y upgrade && apt-get install -y --no-install-recommends apt-utils
    
COPY ./requirements/wordpress/conf/wp-config-create.sh .

RUN apt-get install -y php7.4 \
    php7.4-fpm \
    php7.4-mysql \
    # php7.4-json \
    # php7.4-curl \
    # php7.4-dom \
    # php7.4-exif \
    # php7.4-fileinfo \
    # php$7.4-mbstring \
    # php$7.4-openssl \
    # php$7.4-xml \
    # php$7.4-zip \
    # php$7.4-redis \
    curl && \
    curl -o wp https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar; \
    mv wp /usr/local/bin/ && chmod +x /usr/local/bin/wp && wp cli update --nightly --yes; \
    wp core download --path=/var/www/ --allow-root && cat /var/www/wp-config-sample.php > /var/www/wp-config.php; \
    sed -i 's/listen = \/run\/php\/php7.4-fpm.sock/listen = 9000/g' /etc/php/7.4/fpm/pool.d/www.conf; \
    chmod +x wp-config-create.sh

EXPOSE 9000

CMD ["bash", "./wp-config-create.sh"]