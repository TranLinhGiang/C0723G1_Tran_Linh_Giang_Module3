create database if not exists xay_dung_co_so_du_lieu_quan_ly_ban_hang;
use  xay_dung_co_so_du_lieu_quan_ly_ban_hang;
-- tạo bảng product;
CREATE TABLE Product (
    pID INT PRIMARY KEY AUTO_INCREMENT,
    pName VARCHAR(50),
    pPice int
);
-- xây dựng lớp order;
CREATE TABLE `order` (
    oID INT PRIMARY KEY AUTO_INCREMENT,
    cID INT,
    oDate DATE,
    oTotalPrice INT
);
-- tạo lớp orderDetail;
CREATE TABLE OrderDetail (
    order_oID INT,
    Product_pID INT,
    PRIMARY KEY (order_oID , Product_pID),
    FOREIGN KEY (order_oID) REFERENCES `order` (oID),
    FOREIGN KEY (Product_pID) REFERENCES Product (pID)
);
-- tạo bảng customer
CREATE TABLE customer (
    order_oID INT,
    cName VARCHAR(50),
    cAge INT,
    FOREIGN KEY (order_oID)REFERENCES `order` (oID)
);

