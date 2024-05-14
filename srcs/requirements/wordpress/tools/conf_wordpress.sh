#!/bin/bash

# pour plus d infor sur l installation et l utilisation de wp-cli :
# https://make.wordpress.org/cli/handbook/guides/installing/

# Attendre que la base de données soit prête
sleep 10

# Chemin vers WordPress
WP_PATH='/var/www/html'

# Vérifier si wp-config.php n'existe pas encore
if [ ! -e ${WP_PATH}/wp-config.php ]; then
  # Télécharger wp-cli
  wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
  chmod +x wp-cli.phar

  # Télécharger WordPress
  ./wp-cli.phar core download --allow-root --path=${WP_PATH}

  # Créer le fichier de configuration wp-config.php
  ./wp-cli.phar config create --allow-root \
    --dbname=${MYSQL_DATABASE} \
    --dbuser=${MYSQL_USER} \
    --dbpass=${MYSQL_PASSWORD} \
    --dbhost=${MYSQL_HOST} \
    --path=${WP_PATH}

  # Attendre un peu pour s'assurer que tout est prêt
  sleep 2

  # Installer WordPress
  ./wp-cli.phar core install --allow-root \
    --url=${WP_HOME_URL} \
    --title=${WP_BLOG_TITLE} \
    --admin_user=${WP_ADMIN_USER} \
    --admin_password=${WP_ADMIN_PASS} \
    --admin_email=${WP_ADMIN_EMAIL} \
    --skip-email \
    --path=${WP_PATH}

  # Attendre un peu pour s'assurer que tout est prêt
  sleep 2

  # Créer un utilisateur WordPress
  ./wp-cli.phar user create --allow-root \
    --role=author ${WP_USER} ${WP_USER_EMAIL} \
    --user_pass=${WP_USER_PASS} \
    --path=${WP_PATH}
fi

# Démarrer PHP-FPM
exec php-fpm7.3 -F
