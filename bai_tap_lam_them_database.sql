create database if not exists bai_tap_lam_them;
use bai_tap_lam_them;
-- tạo bảng máy tính;
create table may_tinh(
ma_may_tinh int ,
hang_san_xuat varchar(45),
vi_tri_dat_may varchar(45));
-- tạo bảng loại khách hàng;
create table loai_khach(
ma_loai_khach int,
ten_loai_khach varchar(45));
-- tạo bảng dịch vụ đi kèm;
create table dich_vu_di_kem(
