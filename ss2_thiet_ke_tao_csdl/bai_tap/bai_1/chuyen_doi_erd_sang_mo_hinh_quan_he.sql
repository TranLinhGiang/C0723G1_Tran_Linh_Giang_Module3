create database if not exists quan_ly_vat_tu;
use quan_ly_vat_tu;
-- tạo bảng nhà cung cấp;
CREATE TABLE nha_cung_cap (
    ma_nha_cung_cap INT PRIMARY KEY AUTO_INCREMENT,
    ten_nha_cung_cap VARCHAR(50),
    dia_chi VARCHAR(50)
);
-- tạo bảng đơn đặt hàng;
CREATE TABLE don_dat_hang (
    so_don_hang INT PRIMARY KEY AUTO_INCREMENT,
    ngay_dat_hang INT
);
-- nối đơn đặt hàng lại với nhà cung cấp;
CREATE TABLE cung_cap (
    nha_cung_cap_ma_nha_cung_cap INT,
    don_dat_hang_so_don_hang INT,
    strart_time DATE,
    end_time DATE,
    PRIMARY KEY (nha_cung_cap_ma_nha_cung_cap , don_dat_hang_so_don_hang),
    FOREIGN KEY (nha_cung_cap_ma_nha_cung_cap)
        REFERENCES nha_cung_cap (ma_nha_cung_cap),
    FOREIGN KEY (don_dat_hang_so_don_hang)
        REFERENCES don_dat_hang (so_don_hang)
);
-- ltạo lớp điện thoại liên quan với nhà cung câp;
CREATE TABLE so_dien_thoai (
nha_cung_cap_ma_nha_cung_cap INT,
    so_dien_thoai INT,
    FOREIGN KEY (nha_cung_cap_ma_nha_cung_cap)
        REFERENCES nha_cung_cap (ma_nha_cung_cap)
);
-- tạo bảng vật tư;
CREATE TABLE vat_tu (
    ma_vat_tu INT PRIMARY KEY AUTO_INCREMENT,
    ten_vat_tu VARCHAR(50)
);
-- tạo bnagr phiếu phập;
CREATE TABLE phieu_nhap (
    so_phieu_nhap INT PRIMARY KEY AUTO_INCREMENT,
    ngay_nhap VARCHAR(50)
);
-- tạo bảng kết nối giữa vật tư với phiếu nhập;
create table chi_tiet_phieu_nhap(
vat_tu_ma_vat_tu int,
phieu_nhap_so_phieu_nhap int,
don_gia_nhap int,
so_luong_nhap int,
primary key(vat_tu_ma_vat_tu,phieu_nhap_so_phieu_nhap),
foreign key(vat_tu_ma_vat_tu) references vat_tu (ma_vat_tu),
foreign key(phieu_nhap_so_phieu_nhap) references phieu_nhap (so_phieu_nhap)
);
-- kết nối giữa vật tư với đơn đăth hàng;
CREATE TABLE chi_tiet_don_dat_hang (
    vat_tu_ma_vat_tu INT,
    don_dat_hang_so_don_hang INT,
    PRIMARY KEY (vat_tu_ma_vat_tu , don_dat_hang_so_don_hang),
    FOREIGN KEY (vat_tu_ma_vat_tu)
        REFERENCES vat_tu (ma_vat_tu),
    FOREIGN KEY (don_dat_hang_so_don_hang)
        REFERENCES don_dat_hang (so_don_hang)
);
-- tạo bảng phiếu xuất;
CREATE TABLE phieu_xuat (
    so_phieu_xuat INT PRIMARY KEY AUTO_INCREMENT,
    ngay_xuat INT
);
-- bảo bảng kết nối giữa phiếu xuất với vật tư;
CREATE TABLE chi_tiet_phieu_xuat (
    phieu_xuat_so_phieu_xuat INT,
    vat_tu_ma_vat_tu INT,
    don_gia_xuat INT,
    so_luong_xuat INT,
    PRIMARY KEY (phieu_xuat_so_phieu_xuat , vat_tu_ma_vat_tu),
    FOREIGN KEY (phieu_xuat_so_phieu_xuat)
        REFERENCES phieu_xuat (so_phieu_xuat),
    FOREIGN KEY (vat_tu_ma_vat_tu)
        REFERENCES vat_tu (ma_vat_tu)
);

