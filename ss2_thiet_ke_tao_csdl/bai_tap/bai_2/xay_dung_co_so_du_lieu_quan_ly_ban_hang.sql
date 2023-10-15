create database if not exists xay_dung_co_so_du_lieu_quan_ly_ban_hang;
use  xay_dung_co_so_du_lieu_quan_ly_ban_hang;
-- tạo bảng product;
CREATE TABLE product (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    product_price int
);
-- xây dựng lớp order;
CREATE TABLE `order` (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    order_total_price INT
);
-- tạo lớp orderDetail;
CREATE TABLE order_detail (
    order_order_id INT,
    product_product_id INT,
    order_quality int,
    PRIMARY KEY (order_order_id , product_product_id),
    FOREIGN KEY (order_order_id) REFERENCES `order` (order_id),
    FOREIGN KEY (product_product_id) REFERENCES product (product_id)
);
-- tạo bảng customer
CREATE TABLE customer (
    order_order_id INT,
    customer_id int primary key,
    customer_name VARCHAR(50),
    customer_age INT,
    FOREIGN KEY (order_order_id)REFERENCES `order` (order_id)
);

