
use quan_ly_diem_thi;
-- tạo bảng:
CREAte tabLe hocSinh (
    MaHS VARChar(20) priMary key,
    TenHS VARChar(50),
    NgaySinh DATEtime,
    Lop VARChar(20),
    GT VARChar(20)
);
CrEAte tabLe monHoc (
    MaMH VARChar(20) priMary key,
    TenMH VARChar(50),
    MaGV VARChar(20)
);
CrEAte tabLe bangDiem(
 MaHS VARChar(20),
 maMH VARChar(20),
 diemThi INT,
 ngayKT DATEtime,
 prIMary key (maHs, MamH),
 foREign key (maHs) REfErences hocSinh(MaHs),
 foREign key (maMh) REfErences monHoc(MaMh)
);
CrEAte tabLe giaoVien(
 MaGV VARChar(20) priMary key,
 tenGV VARChar(20),
 sdT VARChar(10)
);
AlTEr tabLe monHoc ADD conStraint fk_MaGV FOREign key (maGv) REfErences giaoVien(MaGv);
