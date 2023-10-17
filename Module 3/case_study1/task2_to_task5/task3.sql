-- Task 3 --
/* Hiển thị thông tin của tất cả khách hàng có độ tuổi từ 18 đến 50 tuổi và có địa chỉ ở “Đà Nẵng” hoặc “Quảng Trị”. */

use furama_resort;

select * from khach_hang
where (timestampdiff(year, ngay_sinh, current_date()) between 18 and 50)
and (dia_chi like '%Đà Nẵng%' or dia_chi like '%Quảng Trị%');