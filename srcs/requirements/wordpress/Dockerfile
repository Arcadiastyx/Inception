FROM    debian:buster

RUN     apt update -y && apt upgrade -y

RUN		apt install wget -y && apt install vim -y

RUN     apt-get install -y php7.3 \
        php-fpm \
	    php-mysql \
	    mariadb-client

COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf

COPY ./tools/conf_wordpress.sh /tmp/conf_wordpress.sh

EXPOSE 9000

RUN mkdir -p /run/php

RUN chmod +x /tmp/conf_wordpress.sh

ENTRYPOINT ["/tmp/conf_wordpress.sh"]