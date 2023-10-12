use hop_dong;
-- tạo bảng hợp đồng;
CREATE TABLE hop_dong (
    ma_hop_dong INT,
    ngay_lam_hop_dong DATETIME,
    ngay_ket_thuc DATETIME,
    tien_dat_coc DOUBLE,
    ma_nhan_vien INT,
    ma_khach_hang INT,
    ma_dich_vu INT
);