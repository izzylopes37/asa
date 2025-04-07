FROM ubuntu:latest

RUN apt-get update -y

RUN apt-get install bind9 dnsutils -y

COPY named.conf.local /etc/bind/named.conf.local
COPY db.werllison37.com /etc/bind/db.werllison37.com

EXPOSE 53/TCP
EXPOSE 53/UDP

CMD ["/usr/sbin/named", "-g", "-c", "/etc/bind/named.conf", "-u", "bind"]