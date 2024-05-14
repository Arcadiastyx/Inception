#!/bin/bash

# # Start MariaDB service
# service mysql start

# # Wait for MariaDB to be fully up and running
# while ! mysqladmin ping --silent; do
#     sleep 1
# done

# # Set up the database and user
# if [ -n "$MYSQL_ROOT_PASSWORD" ]; then
#     mysql -e "SET PASSWORD FOR 'root'@'localhost' = PASSWORD('${MYSQL_ROOT_PASSWORD}');"
#     mysql -e "DELETE FROM mysql.user WHERE User='';"
#     mysql -e "DROP DATABASE IF EXISTS test;"
#     mysql -e "DELETE FROM mysql.db WHERE Db='test' OR Db='test\_%';"
#     mysql -e "FLUSH PRIVILEGES;"
# fi

# if [ -n "$MYSQL_DATABASE" ]; then
#     mysql -u root -p"${MYSQL_ROOT_PASSWORD}" -e "CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE};"
# fi

# if [ -n "$MYSQL_USER" ] && [ -n "$MYSQL_PASSWORD" ]; then
#     mysql -u root -p"${MYSQL_ROOT_PASSWORD}" -e "CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"
#     mysql -u root -p"${MYSQL_ROOT_PASSWORD}" -e "GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO '${MYSQL_USER}'@'%';"
#     mysql -u root -p"${MYSQL_ROOT_PASSWORD}" -e "FLUSH PRIVILEGES;"
# fi

# # Allow any host to connect (for simplicity, restrict to specific IPs for production)
# mysql -u root -p"${MYSQL_ROOT_PASSWORD}" -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}' WITH GRANT OPTION;"
# mysql -u root -p"${MYSQL_ROOT_PASSWORD}" -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'wordpress.inception_network' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}' WITH GRANT OPTION;"
# mysql -u root -p"${MYSQL_ROOT_PASSWORD}" -e "FLUSH PRIVILEGES;"

# # Keep the container running
# tail -f /dev/null


cat << EOF > /tmp/db_config.sql
CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE; 
CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';
GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%';
ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';
FLUSH PRIVILEGES;
EOF

mysql -h localhost < /tmp/db_config.sql