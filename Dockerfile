FROM ubuntu:jammy

ENV LC_ALL C.UTF-8

# Install add-apt-repository command
RUN apt update -y && apt upgrade -y

RUN apt install bind9 bind9utils bind9-doc -y

VOLUME ["/etc/bind", "/var/cache/bind", "/var/lib/bind", "/var/log"]

EXPOSE 53/udp 53/tcp 953/tcp

CMD ["/usr/sbin/named", "-f", "-c", "/etc/bind/named.conf", "-u", "bind"]