create database if not exists xay_dung_co_so_du_lieu_quan_ly_ban_hang;
use xay_dung_co_so_du_lieu_quan_ly_ban_hang;
-- thêm mới vào bảng customer
insert into customer(customer_id,customer_name,customer_age)
values
(1,'Minh Quan',10),
(2,'Ngoc Oanh',20),
(3,'Hong Ha',50);


-- thêm mới order
insert into `order`
value
(1,1,'2006-3-21',null),
(2,2,'2006-3-23',null),
(3,1,'2006-3-16',null);
-- thêm mới product
insert into product(product_id,product_name,product_price)
value 
(1,'May Giat',3),
(2,'Tu Lanh',5),
(3,'Dieu Hoa',7),
(4,'Quat',1),
(5,'Bep Dien',2);
-- thêm mới orderdetail;
insert into  order_detail
value
(1,1,3),
(1,3,7),
(1,4,2),
(2,1,1),
(3,1,8),
(2,5,4),
(2,3,3);
-- Hiển thị các thông tin  gồm oID, oDate, oPrice của tất cả các hóa đơn trong bảng Order;
select  order_id,order_date,order_total_price
from `order`;
-- Hiển thị danh sách các khách hàng đã mua hàng
select c.customer_name
from customer c
join `order` o on o.customer_id= c.customer_id;
-- danh sách sản phẩm được mua bởi các khách
select product_name
from product;
-- Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào;
select c.customer_name
from customer c
left join `order` o on o.customer_id= c.customer_id
where o.customer_id is null;
-- Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn (giá một hóa đơn được tính bằng tổng giá bán của từng loại mặt hàng xuất hiện trong hóa đơn. Giá bán của từng loại được tính = odQTY*pPrice)
-- select oID,oDate,pPice
-- from `order`o,product p;
select
order_order_id,
order_date,
product_price  ,
order_detail.order_quality * product.product_price AS mouse
from order_detail,`order`,product;










