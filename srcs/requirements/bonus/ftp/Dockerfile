FROM debian:stable

ENV DEBIAN_FRONTEND=noninteractive

COPY ./requirements/bonus/ftp/conf/criptftp.sh .

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && apt-get update && apt-get -y upgrade && apt-get install -y --no-install-recommends apt-utils &&\
    apt-get install -y vsftpd && cp /etc/vsftpd.conf /etc/vsftpd.conf.orig; \
    chmod +x criptftp.sh

EXPOSE 21 20 40000-40005

CMD ["./criptftp.sh"]