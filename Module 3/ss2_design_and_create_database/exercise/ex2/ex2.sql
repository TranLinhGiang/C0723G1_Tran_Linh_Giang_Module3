drop database if exists quan_ly_ban_hang;

create database if not exists quan_ly_ban_hang;

use quan_ly_ban_hang;

create table customers(
customer_id int auto_increment,
customer_name varchar(50) not null,
customer_age int not null,
primary key(customer_id),
check (customer_age >= 3 && customer_age < 120)
);

create table orders(
customer_id int,
order_id int auto_increment,
order_date datetime not null, 
order_total_price int,
check (order_total_price >= 0),
primary key(order_id),
foreign key (customer_id) references customers(customer_id)
);

create table products(
product_id int auto_increment,
product_name varchar(50) not null,
product_price int not null,
check (product_price >= 0),
primary key(product_id)
);

create table order_detail(
order_id int not null,
product_id int not null,
order_quantity varchar(50) not null,
check (order_quantity > 0),
primary key(order_id,product_id),
foreign key (order_id) references orders(order_id),
foreign key (product_id) references products(product_id)
);

