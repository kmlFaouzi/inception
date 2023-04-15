FROM debian:stable

ENV DEBIAN_FRONTEND=noninteractive

RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && apt-get clean && apt-get update && apt-get -y upgrade && apt-get install -y --no-install-recommends apt-utils &&\
    apt-get update && apt-get -y upgrade && apt-get install -y nginx curl ca-certificates &&\
    cp /var/www/html/index.nginx-debian.html /var/www/index.html; \
    mkdir /etc/nginx/ssl; \
    curl -LO https://github.com/FiloSottile/mkcert/releases/download/v1.4.4/mkcert-v1.4.4-linux-amd64 \
    && chmod +x mkcert-v1.4.4-linux-amd64 && mv mkcert-v1.4.4-linux-amd64 mkcert \
    && mv mkcert /usr/local/bin/ && mkcert -key-file /etc/nginx/ssl/kfaouzi.42.fr.key -cert-file /etc/nginx/ssl/kfaouzi.42.fr.crt kfaouzi.42.fr;

EXPOSE 443

COPY ./requirements/nginx/conf/nginx.conf /etc/nginx/http.d/

COPY ./requirements/nginx/conf/nginx.conf /etc/nginx/conf.d/

CMD ["nginx", "-g", "daemon off;"]
