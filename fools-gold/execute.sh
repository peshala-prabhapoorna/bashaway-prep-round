#!/bin/bash

# Pull the official MySQL Docker image
docker pull mysql:latest

# Run the MySQL container with port 3307, root password, ace user, and connection limit
docker run -d \
	--name mysql \
	-e MYSQL_ROOT_PASSWORD=fools-gold \
	-e MYSQL_DATABASE=vault \
	-e MYSQL_USER=ace \
	-e MYSQL_PASSWORD=firefist \
	-p 3307:3306 \
	mysql:latest

# Wait for MySQL to initialize
echo "Waiting for MySQL to start..."
sleep 20

# Create the table and insert 5 records
docker exec -i mysql mysql -uroot -pfools-gold vault <<EOF
CREATE TABLE IF NOT EXISTS gold (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    value INT
);

INSERT INTO gold (name, value) VALUES
  ('Treasure Chest', 1000),
  ('Golden Crown', 1500),
  ('Silver Coins', 750),
  ('Diamond Necklace', 5000),
  ('Ruby Ring', 2000);

SET GLOBAL max_connections = 2;
EOF

echo "Database setup complete. MySQL is running on port 3307 with 5 records in the 'gold' table."
