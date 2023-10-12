use khach_hang;
-- tạo bảng khách hàng;
CREATE TABLE khach_hang (
    ma_khach_hang INT,
    ma_loai_khach_hang INT,
    ho_ten VARCHAR(45),
    ngay_sinh DATE,
    gioi_tinh BIT(1),
    so_cmnd VARCHAR(45),
    so_dien_thoai VARCHAR(45),
    email VARCHAR(45),
    dia_chi VARCHAR(45)
);