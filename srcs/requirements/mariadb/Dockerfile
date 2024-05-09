FROM    debian:buster

# Environment variables
ARG     MYSQL_ROOT_PASSWORD
ARG     MYSQL_DATABASE
ARG     MYSQL_USER
ARG     MYSQL_PASSWORD


# Install MariaDB
RUN     apt update -y && apt upgrade -y && apt-get install mariadb-server -y


# Set up MariaDB configuration
COPY    conf/50-server.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf
COPY    ./tools/script.sh /
RUN     chmod +x /script.sh

ENTRYPOINT [ "/script.sh" ]