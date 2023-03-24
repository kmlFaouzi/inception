FROM debian:stable
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* 
RUN apt-get update
RUN apt-get -y upgrade
RUN apt-get install -y --no-install-recommends apt-utils
RUN apt-get update && apt-get -y upgrade && apt-get install -y nginx
# RUN apt-get update && apt-get -y install curl
# RUN apt-get update && apt-get -y install ca-certificates
# RUN curl -LO https://github.com/FiloSottile/mkcert/releases/download/v1.4.3/mkcert-v1.4.3-linux-amd64
EXPOSE 443
COPY conf/nginx.conf /etc/nginx/http.d/
COPY conf/nginx.conf /etc/nginx/conf.d/
COPY tools/kfaouzi.42.fr.key /etc/nginx/ssl/
COPY tools/kfaouzi.42.fr.crt /etc/nginx/ssl/
CMD ["nginx", "-g", "daemon off;"]
