USE nhan_vien;
-- tạo bảng nhân viên;
CREATE TABLE NHAN_vien (
    Ma_nhan_vien INT,
    Ho_ten VARCHAR(45),
    Ngay_sinh DATE,
    So_cmnd VARCHAR(45),
    Luong DOUBLE,
    So_dien_thoai VARCHAR(45),
    Email VARCHAR(45),
    Dia_chi VARCHAR(45),
    Ma_vi_tri INT,
    Ma_trinh_do INT,
    Ma_bo_phan INT
);
-- Thêm mới;

INSERT INTO NHAn_VIEn(ma_nhan_Vien,ho_ten,nGay_sinH,so_cmnd,Luong,so_dien_Thoai,email,diA_chi,Ma_vi_trI,ma_trinh_do,ma_bo_phAn)VALUE
(1,"TRẦN LINh Giang",01,"044202002337",15000,"0814742505","Gt07839@gMail.com",73,12,12),
(2,"TRẦN ChÍ Linh",02,"099787664553",10000,"0874655737","cl07838@gmaiL.com",73,13,13),
(3,"KHÁNH HUYềN",03,"099787664554",19000,"0874698736","KH07838@gmail.cOm",93,08,20);

-- hiển thị tất cả thông tin nhân viên có trong hệ thống có tên bắt đầu là một trong các ký tự "H","T",hoặc "K"và có tối đa 15 ký tự;
SELECT 
    *
FROM
    nhan_vien
WHERE
    ho_ten LIKE 'H%' OR `ten` LIKE 'T%'
        OR `TEN` LIKE 'K%' AND LENGTH(`Ten`) <= 15;