drop database if exists case_study;
create database if not exists case_study;
use case_study;
-- tạo bảng vị trí;
CREATE TABLE vi_tri (
    ma_vi_tri INT primary key,
    ten_vi_tri VARCHAR(45)
);
-- tạo bảng trình độ;
CREATE TABLE trinh_do (
    ma_trinh_do INT primary key,
    ten_vi_tri VARCHAR(45)
);
-- tạo bảng bộ phận;
CREATE TABLE bo_phan (
    ma_bo_phan INT primary key,
    ten_bo_phan VARCHAR(45)
);
-- tạo bảng nhân viên;
CREATE TABLE nhan_vien (
    ma_nhan_vien INT primary key not null,
    ho_ten VARCHAR(45),
    ngay_sinh DATE,
    so_cmnd VARCHAR(45),
    luong DOUBLE,
    so_dien_thoai VARCHAR(45),
    email VARCHAR(45),
    dia_chi VARCHAR(45),
    ma_vi_tri INT not null,
    ma_trinh_do INT not null,
    ma_bo_phan INT,
    foreign key(ma_vi_tri)references vi_tri (ma_vi_tri),
    foreign key(ma_trinh_do)references trinh_do (ma_trinh_do),
    foreign key(ma_bo_phan)references bo_phan (ma_bo_phan)
);
-- tạo bảng loại khách;
CREATE TABLE loai_khach (
    ma_loai_khach INT PRIMARY KEY,
    ten_loai_khach_hang VARCHAR(45)
);
-- tạo bảng khách hàng;
CREATE TABLE khach_hang (
    ma_khach_hang INT PRIMARY KEY,
    ma_loai_khach INT,
    ho_ten VARCHAR(45),
    ngay_sinh DATE,
    gioi_tinh BIT(1),
    so_cmnd VARCHAR(45),
    dia_chi VARCHAR(45),
    foreign key(ma_loai_khach)references loai_khach(ma_loai_khach)
);
-- tạo bảng loại dịch vụ;
CREATE TABLE loai_dich_vu (
    ma_loai_dich_vu INT PRIMARY KEY not null,
    ten_loai_dich_vu VARCHAR(45)
);
-- tạo bảng kiểu thuê;
CREATE TABLE kieu_thue (
    ma_kieu_thue INT PRIMARY KEY,
    ten_kieu_thue VARCHAR(45)
);
-- tạo bảng dịch vụ;
CREATE TABLE dich_vu (
    ma_dich_vu INT PRIMARY KEY,
    ten_dich_vu VARCHAR(45),
    dien_tich INT,
    chi_phi_thue DOUBLE,
    so_nguoi_toi_da INT,
    ma_kieu_thue INT,
    ma_loai_dich_vu INT,
    tieu_chuan_phong VARCHAR(45),
    mo_ta_tien_nghi_khac VARCHAR(45),
    dien_tich_ho_boi DOUBLE,
    so_tang INT,
    dich_vu_mien_phi_di_kem TEXT,
    foreign key(ma_loai_dich_vu)references loai_dich_vu(ma_loai_dich_vu),
    foreign key(ma_kieu_thue)references kieu_thue (ma_kieu_thue)
);
-- tạo bảng dịch vụ đi kèm;
CREATE TABLE dich_vu_di_kem (
    ma_dich_vu_di_kem INT PRIMARY KEY NOT NULL,
    ten_dich_vu_di_kem VARCHAR(45),
    gia DOUBLE,
    don_vi VARCHAR(45),
    trang_thai VARCHAR(45)
);
-- tạo bảng hợp đồng chi tiết;
CREATE TABLE hop_dong_chi_tiet (
    ma_hop_dong_chi_tiet INT,
    ma_hop_dong INT primary key NOT NULL,
    ma_dich_vu_di_kem INT,
    so_luong INT,
    foreign key(ma_dich_vu_di_kem) references dich_vu_di_kem (ma_dich_vu_di_kem)
);
-- tạo bảng hợp đồng;
CREATE TABLE hop_dong (
    ma_hop_dong int,
    ngay_lam_hop_dong DATETIME,
    ngay_ket_thuc DATETIME,
    tien_dat_coc DOUBLE,
    ma_nhan_vien INT,
    ma_khach_hang int,
    ma_dich_vu INT,
   foreign key ( ma_nhan_vien) references nhan_vien (ma_nhan_vien),
   foreign key ( ma_khach_hang) references khach_hang (ma_khach_hang),
   foreign key ( ma_hop_dong) references hop_dong_chi_tiet (ma_hop_dong),
   foreign key ( ma_dich_vu) references dich_vu (ma_dich_vu)
);








