use case_study;
-- task 11: hiển thị thông tin dịch vụ đi kèm đã được sử dụng bởi những khách hàng có: tên loại khách hàng là diamod và có địa chỉ ở Vinh hoặc Quảng Ngãi;
SELECT 
    kh.ma_khach_hang as mã_khách_hàng,
    dvdk.ma_dich_vu_di_kem as mã_dịch_vụ_đi_kèm,
    dvdk.ten_dich_vu_di_kem as tên_dịch_vụ_đi_kèm,
    dvdk.gia as giá,
    dvdk.don_vi as đơn_vị,
    dvdk.trang_thai as trạng_thái,
    kh.dia_chi as địa_chỉ,
    lk.ten_loai_khach_hang as tên_loại_khách_hàng,
    lk.ma_loai_khach as mã_loại_khách
FROM
    khach_hang kh
        JOIN
    hop_dong hd ON kh.ma_khach_hang = hd.ma_khach_hang
        JOIN
    hop_dong_chi_tiet hdct ON hd.ma_hop_dong = hdct.ma_hop_dong
       inner JOIN
    dich_vu_di_kem dvdk ON hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
      AND  (kh.dia_chi like '%Vinh'or kh.dia_chi like '%Quảng Ngãi')
        JOIN
    loai_khach lk ON kh.ma_loai_khach = lk.ma_loai_khach
        AND lk.ten_loai_khach_hang = 'Diamond';
-- task 12: hiển thị thông tin mã_hợp_đồng, họ_tên(nhân viên), họ_tên( khách hàng), số_điện_thoại (khách hàng), tên_dịch_vụ, 
-- số_lượng_dịch_vụ_đi_kèm(được tính dựa trên sum số_lượng ở dịch_vụ_đi_kèm), tiền_đặt_cọc của tất cả các dịch vụ đã từng được 
-- khách hàng đặt vào 3 tháng cuối cùng của năm 2020 nhưng chưa được khách hàng đặt vào 6 tháng đầu năm 2021;
select 
hd.ma_hop_dong as mã_hợp_đồng,
nv.ho_ten as họ_tên_nhân_viên,
kh.ho_ten as họ_tên_khách_hàng,
kh.so_dien_thoai as số_điện_thoại_khách_hàng,
dv.ten_dich_vu as tên_dịch_vụ,
sum(hdct.so_luong) As số_lượng_dịch_vụ_đi_kèm
from hop_dong hd
join nhan_vien nv on nv.ma_nhan_vien= hd.ma_nhan_vien
join khach_hang kh on kh.ma_khach_hang= hd.ma_khach_hang
join dich_vu dv on hd.ma_dich_vu= dv.ma_dich_vu
join hop_dong_chi_tiet hdct on hd.ma_hop_dong= hdct.ma_hop_dong
where
hd.ma_dich_vu not in ( select hd.ma_dich_vu
from hop_dong hd
where year(hd.ngay_lam_hop_dong) = '2021'
and (quarter(hd.ngay_lam_hop_dong) = '1' 
or quarter(hd.ngay_lam_hop_dong) = '2'))
group by hd.ma_hop_dong
order by hd.ma_hop_dong asc 
;

-- task 13: Hiển thị thông tin dịch vụ đi kèm được sử dụng nhiều nhất bởi các khách hàng đặt đã đặt phòng.(Lưu ý: là có thể có nhiều dịch vụ có số lần sử dụng nhiều như nhau);
select 
hdct.ma_dich_vu_di_kem,
dvdk.ten_dich_vu_di_kem,
sum(hdct.so_luong) as so_luong_dich_vu_di_kem
from hop_dong_chi_tiet hdct
join dich_vu_di_kem dvdk on hdct.ma_dich_vu_di_kem=dvdk.ma_dich_vu_di_kem
group by hdct.ma_dich_vu_di_kem;

-- task 14: Hiển thị thông tin tất cả dịch vụ đi kèm chỉ mới được sử dụng một lần duy nhất. Thông tin hiển thị bao gồm, mã_hợp_đồng, tên_loại_dịch_vụ, tên_dịch_vụ_đi_kèm,số_lần_sử_dụng
-- (được tính dựa trên việc count các mã_dịch_vụ_đi_kèm );
SELECT 
    hd.ma_hop_dong AS mã_hợp_đồng,
    dvdk.ten_dich_vu_di_kem AS tên_dịch_vụ_đi_kèm,
    ldv.ten_loai_dich_vu AS tên_loại_dịch_vụ,
count(hdct.ma_dich_vu_di_kem) as số_lần_sử_dụng
from hop_dong hd
join hop_dong_chi_tiet hdct on hd.ma_hop_dong= hdct.ma_hop_dong
join dich_vu_di_kem dvdk on hdct.ma_dich_vu_di_kem= dvdk.ma_dich_vu_di_kem
join dich_vu dv on hd.ma_dich_vu= dv.ma_dich_vu
left join loai_dich_vu ldv on dv.ma_loai_dich_vu= ldv.ma_loai_dich_vu
group by hd.ma_hop_dong, ten_dich_vu_di_kem;
 -- tast 15: Hiển thị thông tin tất cả nhân viên bao gồm mã_nhân_viên, họ_tên,  tên_trình_độ, tên_bộ_phận, số_điện_thoại, địa_chỉ mới chỉ lập được tối đa 3 hợp đồng từ năm 2020 đến 2021;
select
nv.ma_nhan_vien as mã_nhân_viên,
nv.ho_ten as họ_tên,
td.ten_trinh_do as tên_trình_độ,
bp.ten_bo_phan as tên_bộ_phận,
nv.so_dien_thoai as số_điện_thoại,
nv.dia_chi as địa_chỉ 
from hop_dong hd
join nhan_vien nv on hd.ma_nhan_vien= nv.ma_nhan_vien
join trinh_do td on nv.ma_trinh_do= td.ma_trinh_do
join bo_phan bp on nv.ma_bo_phan= bp.ma_bo_phan;



