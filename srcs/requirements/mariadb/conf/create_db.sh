#!/bin/sh
service mariadb start
mysql_install_db
cat << END > create_db.sql
CREATE USER ${DB_USER}@'%' IDENTIFIED BY '${USER_PASSWORD}';
CREATE DATABASE ${DB_NAME};
GRANT ALL ON ${DB_NAME}.* TO '${DB_USER}'@'%';
FLUSH PRIVILEGES;
ALTER USER 'root'@'localhost' IDENTIFIED BY '${ROOT_PASSWORD}';
END
mysql -u root < create_db.sql
kill `cat /var/run/mysqld/mysqld.pid`
rm -rf create_db.sql
mysqld