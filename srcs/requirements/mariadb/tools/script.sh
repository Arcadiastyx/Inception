#!/bin/sh

# $MYSQL_USER           représente le nom de l'utilisateur MySQL.
# $MYSQL_PASSWORD       est le mot de passe de l'utilisateur MySQL.
# $MYSQL_ROOT_PASSWORD  est le mot de passe de l'utilisateur root MySQL.
# $MYSQL_DATABASE       est le nom de la base de données, dans ce contexte probablement utilisée pour une application comme WordPress.

service mysql start 

# CREATE USER #
echo "CREATE USER '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';" | mysql

# PRIVILEGES FOR ROOT AND USER FOR ALL IP ADDRESSES #
echo "GRANT ALL PRIVILEGES ON *.* TO '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';" | mysql
echo "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';" | mysql
echo "FLUSH PRIVILEGES;" | mysql

# CREATE WORDPRESS DATABASE #
echo "CREATE DATABASE $MYSQL_DATABASE;" | mysql

kill $(cat /var/run/mysqld/mysqld.pid)

mysqld

#  This script is designed to be used with Docker to set up a MariaDB database.

# # Make sure the MariaDB service is not running before we start our own server
# # Prevent the MariaDB server from starting automatically on container start
# echo "Stopping any existing MariaDB services..."
# service mysql stop
# systemctl disable mysql

# # Initialize the database directory
# echo "Initializing MariaDB data directory..."
# mysql_install_db --user=mysql --ldata=/var/lib/mysql

# # Start the MariaDB server in the background
# echo "Starting MariaDB server..."
# mysqld_safe --user=mysql &

# # Wait for MariaDB server to start (max 30 seconds)
# timeout=30
# echo "Waiting for MariaDB to start..."
# while ! mysqladmin ping --silent; do
#     sleep 1
#     timeout=$((timeout - 1))
#     if [ $timeout -eq 0 ]; then
#         echo "MariaDB failed to start."
#         exit 1
#     fi
# done

# # Secure the installation, especially setting the root password
# echo "Securing MariaDB..."
# mysql_secure_installation <<EOF

# y # Set root password
# $MYSQL_ROOT_PASSWORD
# $MYSQL_ROOT_PASSWORD
# y # Remove anonymous users
# y # Disallow root login remotely
# y # Remove test database and access to it
# y # Reload privilege tables now
# EOF

# # Creating the user and database
# echo "Creating user and database..."
# mysql -u root -p"$MYSQL_ROOT_PASSWORD" <<-EOSQL
#     CREATE USER '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';
#     CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;
#     GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%';
#     FLUSH PRIVILEGES;
# EOSQL

# echo "MariaDB setup completed."
# # Keep the mariadb server running in the foreground
# wait