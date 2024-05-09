#!bin/sh

sleep 10

if [ ! -e /var/www/html/wp-config.php ]
then
  wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
  chmod +x wp-cli.phar

  ./wp-cli.phar core download \
    --allow-root \
    --path='/var/www/html'

  ./wp-cli.phar config create --allow-root \
    --dbname=${MYSQL_DATABASE} \
    --dbuser=${MYSQL_USER} \
    --dbpass=${MYSQL_PASSWORD}\
    --dbhost=${MYSQL_HOST}\
    --path='/var/www/html'

  sleep 2

  ./wp-cli.phar core install --allow-root \
    --url=${WP_HOME_URL} \
    --title=${WP_BLOG_TITLE} \
    --admin_user=${WP_ADMIN_USER} \
    --admin_password=${WP_ADMIN_PASS} \
    --admin_email=${WP_ADMIN_EMAIL} \
    --skip-email \
    --path='/var/www/html'

  sleep 2

  ./wp-cli.phar user create --allow-root \
    --role=author ${WP_USER} ${WP_USER_EMAIL} \
    --user_pass=${WP_USER_PASS} \
    --path='/var/www/html'

fi

exec php-fpm7.3 -F