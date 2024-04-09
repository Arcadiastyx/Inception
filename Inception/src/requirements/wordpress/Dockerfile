FROM    debian:buster

RUN     apt update -y && apt upgrade -y

RUN     apt-get -y install wget

RUN     apt-get install -y php7.3 \
        php-fpm \
	    php-mysql \
	    mariadb-client

# installation de worldpress v6
RUN     wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /var/www

# decompression du fichier + suppression du tar.gz
RUN     cd /var/www && tar -xzf wordpress-6.0-fr_FR.tar.gz && rm wordpress-6.0-fr_FR.tar.gz

# droit d ecriture sur le dossier wordpress
RUN		chown -R root:root /var/www/wordpress

CMD ["php-fpm7.3", "-F"]