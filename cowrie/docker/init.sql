CREATE DATABASE cowrie;
CREATE USER 'cowrie'@'%' IDENTIFIED BY 'cowri3_king';
GRANT ALL PRIVILEGES ON *.* TO 'cowrie';
FLUSH PRIVILEGES;