CREATE DATABASE IF NOT EXISTS test_db;
GRANT ALL PRIVILEGES ON *.* TO 'fqsqsfqsdfqsfqef'@'%' IDENTIFIED BY 'fqsdj56153maqsdqs854/83143sqdff' WITH GRANT OPTION;
FLUSH PRIVILEGES;
USE test_db;

CREATE TABLE Articles (
    id      int,
    title   varchar(100),
    article blob
);