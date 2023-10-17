create database quan_ly_don_hang;

use quan_ly_don_hang;

create table vat_tu(
ma_vtu varchar(20),
ten_vtu varchar(50) not null,
primary key(ma_vtu)
);

create table phieu_xuat(
so_px varchar(20),
ngay_xuat datetime not null,
primary key(so_px)
);

create table chi_tiet_phieu_xuat(
ma_vtu varchar(20),
so_px varchar(20),
dg_xuat int,
sl_xuat int,
foreign key (so_px) references phieu_xuat(so_px),
foreign key (ma_vtu) references vat_tu(ma_vtu)
);

create table phieu_nhap(
so_pn varchar(20),
ngay_nhap datetime not null,
primary key(so_pn)
);

create table chi_tiet_phieu_nhap(
ma_vtu varchar(20),
so_pn varchar(20),
dg_nhap int,
sl_nhap int,
foreign key (so_pn) references phieu_nhap(so_pn),
foreign key (ma_vtu) references vat_tu(ma_vtu)
);

create table don_dh(
so_dh varchar(20),
ngay_dh datetime not null,
primary key(so_dh)
);

create table chi_tiet_don_dat_hang(
ma_vtu varchar(20),
so_dh varchar(20),
foreign key (ma_vtu) references vat_tu(ma_vtu),
foreign key (so_dh) references don_dh(so_dh)
);

create table nha_cc(
ma_ncc varchar(20),
ten_ncc varchar(50) not null,
dia_chi varchar(50) not null,
primary key(ma_ncc)
);

create table nha_cc_sdt(
ma_ncc varchar(20) not null,
sdt varchar(11) check (length(sdt) = 10 or length(sdt) = 11),
primary key(sdt),
foreign key (ma_ncc) references nha_cc(ma_ncc)
);

create table cung_cap(
ma_ncc varchar(20) not null,
so_dh varchar(20),
foreign key (ma_ncc) references nha_cc(ma_ncc),
foreign key (so_dh) references don_dh(so_dh)
);


