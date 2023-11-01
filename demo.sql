create database demo;
use demo;
CREATE TABLE users (
    id INT(3) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(120) NOT NULL,
    email VARCHAR(220) NOT NULL,
    country VARCHAR(120)
);
      insert into users(name, email, country)
      values('Minh','minh@codegym.vn','Viet Nam');
insert into users(name, email, country)
 values('Kante','kante@che.uk','Kenia');
 insert into users(name, email, country)
 values('Giang','giang@che.uk','Viet Nam');insert into users(name, email, country)
 values('Hung','hung@che.uk','Viet Nam');