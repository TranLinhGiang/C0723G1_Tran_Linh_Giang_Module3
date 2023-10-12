create database if not exists quan_ly_vat_tu;
use quan_ly_vat_tu;
-- tạo bảng nhà cung cấp;
CREATE TABLE nha_cung_cap (
    MaNCC INT PRIMARY KEY AUTO_INCREMENT,
    TenNCC VARCHAR(50),
    DiaChi VARCHAR(50)
);
-- tạo bảng đơn đặt hàng;
CREATE TABLE don_dat_hang (
    SoDH INT PRIMARY KEY AUTO_INCREMENT,
    NgayDH INT
);
-- nối đơn đặt hàng lại với nhà cung cấp;
CREATE TABLE Cung_cap (
    nha_cung_cap_MaNCC INT,
    don_dat_hang_SoDH INT,
    strart_time DATE,
    end_time DATE,
    PRIMARY KEY (nha_cung_cap_MaNCC , don_dat_hang_SoDH),
    FOREIGN KEY (nha_cung_cap_MaNCC)
        REFERENCES nha_cung_cap (MaNCC),
    FOREIGN KEY (don_dat_hang_SoDH)
        REFERENCES don_dat_hang (SoDH)
);
-- ltạo lớp điện thoại liên quan với nhà cung câp;
CREATE TABLE SDT (
nha_cung_cap_MaNCC INT,
    so_dien_thoai INT,
    FOREIGN KEY (nha_cung_cap_MaNCC)
        REFERENCES nha_cung_cap (MaNCC)
);
-- tạo bảng vật tư;
CREATE TABLE vat_tu (
    MaVTU INT PRIMARY KEY AUTO_INCREMENT,
    TenVTU VARCHAR(50)
);
-- tạo bnagr phiếu phập;
CREATE TABLE phieu_nhap (
    SoPN INT PRIMARY KEY AUTO_INCREMENT,
    NgayNhap VARCHAR(50)
);
-- tạo bảng kết nối giữa vật tư với phiếu nhập;
create table chi_tiet_phieu_nhap(
vat_tu_MaVTU int,
phieu_nhap_SoPN int,
DGNhap int,
SLNhap int,
primary key(vat_tu_MaVTU,phieu_nhap_SoPN),
foreign key(vat_tu_MaVTU) references vat_tu (MaVTU),
foreign key(phieu_nhap_SoPN) references phieu_nhap (SoPN)
);
-- kết nối giữa vật tư với đơn đăth hàng;
CREATE TABLE chi_tiet_don_dat_hang (
    vat_tu_MaVTU INT,
    don_dat_hang_SoDH INT,
    PRIMARY KEY (vat_tu_MaVTU , don_dat_hang_SoDH),
    FOREIGN KEY (vat_tu_MaVTU)
        REFERENCES vat_tu (MaVTU),
    FOREIGN KEY (don_dat_hang_SoDH)
        REFERENCES don_dat_hang (SoDH)
);
-- tạo bảng phiếu xuất;
CREATE TABLE phieu_xuat (
    SoPX INT PRIMARY KEY AUTO_INCREMENT,
    NgayXuat INT
);
-- bảo bảng kết nối giữa phiếu xuất với vật tư;
CREATE TABLE chi_tiet_phieu_xuat (
    phieu_xuat_SoPX INT,
    vat_tu_MaVTU INT,
    DGXuat INT,
    SLXuat INT,
    PRIMARY KEY (phieu_xuat_SoPX , vat_tu_MaVTU),
    FOREIGN KEY (phieu_xuat_SoPX)
        REFERENCES phieu_xuat (SoPX),
    FOREIGN KEY (vat_tu_MaVTU)
        REFERENCES vat_tu (MaVTU)
);

