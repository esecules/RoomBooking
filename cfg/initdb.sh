#!/bin/bash

set -e
set -x

mysql_install_db

# Start the MySQL daemon in the background.
/usr/sbin/mysqld &
mysql_pid=$!

until mysqladmin ping &>/dev/null; do
    echo -n "."; sleep 0.2
done

# create the default database from the ADDed file.
mysqladmin --password=roombooking create roombooking
mysql roombooking --password=roombooking < /tmp/new-installation.sql

# Tell the MySQL daemon to shutdown.
mysqladmin --password=roombooking shutdown

# Wait for the MySQL daemon to exit.
wait $mysql_pid

# create a tar file with the database as it currently exists
tar czvf default_mysql.tar.gz /var/lib/mysql
