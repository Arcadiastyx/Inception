FROM    debian:buster

        # Environment variables
ARG     MYSQL_ROOT_PASSWORD
ARG     MYSQL_DATABASE
ARG     MYSQL_USER
ARG     MYSQL_PASSWORD

RUN     apt update -y && apt upgrade -y && apt-get install mariadb-server -y

COPY    conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

COPY    tools/script.sh /tmp/script.sh

RUN     service mysql start && sh /tmp/script.sh

EXPOSE  3306

CMD     ["mysqld"]
