-- Task 7 --

/*
Hiển thị thông tin ma_dich_vu, ten_dich_vu, dien_tich, so_nguoi_toi_da, chi_phi_thue, ten_loai_dich_vu 
của tất cả các loại dịch vụ đã từng được khách hàng đặt phòng trong năm 2020 
nhưng chưa từng được khách hàng đặt phòng trong năm 2021. 
*/

use furama_resort;

select dv.ma_dich_vu, dv.ten_dich_vu, dv.dien_tich, dv.so_nguoi_toi_da,
       dv.chi_phi_thue, ldv.ten_loai_dich_vu 
from dich_vu dv
join loai_dich_vu ldv on ldv.ma_loai_dich_vu = dv.ma_loai_dich_vu
join hop_dong hd on hd.ma_dich_vu = dv.ma_dich_vu
where year(hd.ngay_lam_hop_dong) = 2020  and  dv.ma_dich_vu not in (select ma_dich_vu from hop_dong where year(ngay_lam_hop_dong) =2021)
-- group by dv.ma_dich_vu;






