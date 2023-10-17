create database QuanLyDiemThi;
use QuanLyDiemThi;
create table HocSinh(
MaHS varchar(20) primary key,
TenHS varchar(50),
NgaySinh datetime,
Lop varchar(20),
GioiTinh varchar(20)
);
create table GiaoVien(
MaGV varchar(20) primary key,
TenGV varchar(50),
SDT varchar(10)
);
create table MonHoc(
MaMH varchar(20) primary key,
TenMH varchar(50),
MaGV varchar(20),
constraint FK_MaGV foreign key (MaGV) references GiaoVien(MaGV)
);
create table BangDiem(
MaHS varchar(20),
MaMH varchar(20),
DiemThi int,
NgayKT datetime,
primary key(MaHS,MaMH),
constraint FK_MaHS foreign key (MaHS) references HocSinh(MaHS),
constraint FK_MaMH foreign key (MaMH) references MonHoc(MaMH)
);