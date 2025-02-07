#!/bin/bash
set -e

MAX_RETRIES=5
COUNT=0
BACKOFF_SECOND=2

echo "Waiting for MySQL to be ready..."
while ! mysqladmin ping -h template-api-server-mysql -u root -p"$MYSQL_ROOT_PASSWORD" --silent; do
   COUNT=$((COUNT+1))
   if [ $COUNT -ge $MAX_RETRIES ]; then
     echo "MySQL is not available after $((MAX_RETRIES * BACKOFF_SECOND / 2)) seconds. Exiting."
     exit 1
   fi
   echo "MySQL is not ready yet. Waiting ($COUNT/$MAX_RETRIES)..."
   sleep $BACKOFF_SECOND

   BACKOFF_SECOND=$((BACKOFF_SECOND * 2))
done

echo "Creating external_db and external_user..."
mysql -h template-api-server-mysql -u root -p"$MYSQL_ROOT_PASSWORD" <<EOF
CREATE DATABASE IF NOT EXISTS external_server;
CREATE USER IF NOT EXISTS 'external_server'@'%' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON external_server.* TO 'external_server'@'%';
GRANT SELECT, REFERENCES ON template_api_server.* TO 'external_server'@'%';
FLUSH PRIVILEGES;

CREATE DATABASE IF NOT EXISTS external_server_test;
GRANT ALL PRIVILEGES ON external_server_test.* TO 'external_server'@'%';
GRANT SELECT, REFERENCES ON template_api_server_test.* TO 'external_server'@'%';
FLUSH PRIVILEGES;
EOF

echo "Database and user created successfully."
