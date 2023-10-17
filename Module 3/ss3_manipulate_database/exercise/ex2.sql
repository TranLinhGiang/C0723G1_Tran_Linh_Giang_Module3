use quan_ly_ban_hang;
/*-----------[Bài tập] Thao tác với CSDL Quản lý bán hàng----------*/
-- thêm dữ liệu cho các bảng
insert into customers (customer_id, customer_name, customer_age) 
values	(1, 'Minh quan', 10),
		(2, 'Ngoc oanh', 20),
		(3, 'Hong ha', 50);

insert into products (product_id, product_name, product_price) 
values 	(1, 'May giat', 3),
		(2, 'Tu Lanh', 5),
		(3, 'Dieu hoa', 7),
		(4, 'Quat', 1),
		(5, 'Bep dien', 2);

insert into orders (order_date, customer_id) 
values 	("2006-03-21", 1),
		("2006-03-23", 2),
		("2006-03-16", 1);

insert into order_detail (order_id, product_id, order_quantity) 
values 	(1, 1, 3),
		(1, 3, 7),
		(1, 4, 2),
		(2, 1, 1),
		(3, 1, 8),
		(2, 5, 4),
		(2, 3, 3);

-- truy vấn dữ liệu
-- Hiển thị các thông tin  gồm order_id, order_date, oPrice của tất cả các hóa đơn trong bảng Order
-- Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách
-- Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào
-- Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn (giá một hóa đơn được tính bằng tổng giá bán của từng loại mặt hàng xuất hiện trong hóa đơn. Giá bán của từng loại được tính = order_quantity*product_price)

#Hiển thị các thông tin  gồm order_id, order_date, oPrice của tất cả các hóa đơn trong bảng Order
select order_id, order_date, order_total_price from orders;

#Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách
select distinct C.customer_name, P.product_name
from customers C
join orders O on C.customer_id = O.customer_id
join order_detail OD on OD.order_id = O.order_id
join products P on P.product_id = OD.product_id;

#Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào
select C.customer_name, c.customer_id
from customers C
left join orders o on c.customer_id = O.customer_id
where O.customer_id is null;

#Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn (giá một hóa đơn được tính bằng tổng giá bán của từng loại mặt hàng xuất hiện trong hóa đơn. Giá bán của từng loại được tính = order_quantity*product_price)
select o.order_id, O.order_date, sum(OD.order_quantity*P.product_price) as total_cost_by_order
from orders O
join order_detail OD on O.order_id = OD.order_id
join products P on P.product_id = OD.product_id
group by O.order_id, O.order_date;