create database if not exists demo;
use demo;
-- tạo bảng product;
create table products(
id int primary key,
product_code int,
product_name varchar(50),
product_price double,
product_amount int,
product_description varchar(50),
product_status varchar(50));
-- chèn một số dữ liệu mẫu cho bảng:
insert into products (id,product_code,product_name,product_price,product_amount,product_description,product_status)
values
(1,2,'Táo',12000,3,'màu đỏ','còn hàng'),
(2,3,'Thịt bò',30000,4,'tươi','hết hàng'),
(3,4,'chuối',5000,5,'chuối cau','còn hàng'),
(4,5,'thịt heo',20000,6,'tươi','hết hàng'),
(5,6,'đu đủ',9000,7,'đu đủ thái','còn hàng'),
(6,7,'cà phê',13000,8,'cà phê sài gòn','hết hàng'),
(7,8,'dép lào',62000,9,'bền','còn hàng'),
(8,9,'thắt lưng',90000,10,'da bò ','còn hàng');
-- Tạo Unique Index trên bảng Products (sử dụng cột productCode để tạo chỉ mục)
alter table products add index i_index1 (product_code);
-- Tạo Composite Index trên bảng Products (sử dụng 2 cột productName và productPrice)
alter table products add index i_index2(product_name,product_price);
-- Sử dụng câu lệnh EXPLAIN để biết được câu lệnh SQL của bạn thực thi như nào
-- explain select * from products where product_code= 4;
-- sau khi thêm chạy tìm kiếm sẽ nhanh hơn: trước đó thì phải chạy 8 row sau khi thêm còn 1 row.

-- Tạo view lấy về các thông tin: productCode, productName, productPrice, productStatus từ bảng products;
create view product_view as 
select p.product_code,p.product_name,p.product_price,p.product_status
from products p;

-- Tiến hành sửa đổi view
update product_view
set product_code= 19
where product_name='Táo';
-- Tiến hành xoá view
drop view product_view;
-- Tạo store procedure lấy tất cả thông tin của tất cả các sản phẩm trong bảng product
delimiter //
create procedure get_all_products()
begin 
select *
from products;
end //
delimiter ;
-- Tạo store procedure thêm một sản phẩm mới
delimiter //
create procedure add_product(
id int,
product_code int,
product_name varchar(50),
product_price double,
product_amount int,
product_description varchar(50),
product_status varchar(50))
begin 
insert into products
(id,product_code,product_name,product_price,product_amount,product_description,product_status)
values
(id,product_code,product_name,product_price,product_amount,product_description,product_status);
end //
delimiter ;

-- sử dụng sp;
call add_product(89,12,'Táo',12000,12,'màu xám','hết hàng');

select *
from products;


-- Tạo store procedure sửa thông tin sản phẩm theo id


delimiter //
create procedure update_product_name(
`name` varchar(50),id int)
begin 
update products
set product_name = `name`
where products.id= id;
end //
delimiter ;
call delete_products_id('chuối',8);

-- Tạo store procedure xoá sản phẩm theo id
delimiter //
create procedure delete_products_id(
id int )
begin
delete from products
where products.id=id;
end //
delimiter ;                                                                                                                   
call delete_products_id(1);


