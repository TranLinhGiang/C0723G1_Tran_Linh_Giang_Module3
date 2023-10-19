use case_study;
-- 16: Xóa những nhân viên chưa từng lập được hợp đồng nào từ 2019 dến 2021;
-- em làm chưa xóa được, nên em hiển thị ra những người chưa lập được hợp đồng từ 2019 đến 2021
select* from nhan_vien nv
where nv.ma_nhan_vien NOT IN (
select nv.ma_nhan_vien
from nhan_vien nv
join hop_dong hd on nv.ma_nhan_vien= hd.ma_nhan_vien
where year(hd.ngay_lam_hop_dong) between 2019 and 2021
group by nv.ma_nhan_vien);
-- 17: Cập nhật thông tin khách hàng có tên_loại_khách_hàng từ platinum lên diamond, chỉ cập nhật những khách hàng đã từng đặt phòng với 
-- Tổng tiền thanh toán trong năm 2021 là lớn hơn 10000000 vnđ.
select kh.ma_khach_hang, kh.ho_ten as họ_tên,lk.ten_loai_khach_hang as tên_loại_khách_hàng,
sum(dv.chi_phi_thue +ifnull( hdct.so_luong * dvdk.gia,0)) as tong_tien
from khach_hang kh
join loai_khach lk on kh.ma_loai_khach= kh.ma_loai_khach
join hop_dong hd on kh.ma_khach_hang= hd.ma_khach_hang
join dich_vu dv on hd.ma_dich_vu= dv.ma_dich_vu
join hop_dong_chi_tiet hdct on hd.ma_hop_dong= hdct.ma_hop_dong
join dich_vu_di_kem dvdk on hdct.ma_dich_vu_di_kem= dvdk.ma_dich_vu_di_kem
where lk.ma_loai_khach=2 and hd.ngay_lam_hop_dong >'2021-01-01'
group by kh.ma_khach_hang;

-- 18: Xóa những khách hàng có hợp đồng trước năm 2021( chú ý ràng buộc giữa các bảng);
select hd.ma_hop_dong,kh.ho_ten
from hop_dong hd
join khach_hang kh on hd.ma_khach_hang= kh.ma_khach_hang 
where hd.ngay_lam_hop_dong < '2021-01-01'
group by hd.ma_hop_dong;

-- 19: Cập nhật giá cho các dịch vụ đi kèm được sử dụng trên 10 lần trong năm 2020 lên gấp đôi.
select dvdk.gia as giá,
dvdk.ma_dich_vu_di_kem,
dvdk.ten_dich_vu_di_kem,
hd.ngay_lam_hop_dong as ngày_làm_hợp_đồng,
sum(hdct.so_luong) as số_lần_sử_dụng
from hop_dong hd
join hop_dong_chi_tiet hdct on hd.ma_hop_dong= hdct.ma_hop_dong
join dich_vu_di_kem dvdk on hdct.ma_dich_vu_di_kem= dvdk.ma_dich_vu_di_kem
where year(hd.ngay_lam_hop_dong) =2020
group by dvdk.gia,ngay_lam_hop_dong,ma_dich_vu_di_kem
having số_lần_sử_dụng >10;
-- 20: Hiển thị thông tin của tất cả các nhân viên và khách hàng có trong hệ thống, thông tin hiển thị bao gồm id(mã_nhân_viên,mã_khách_hàng),họ_tên, email,số_điện_thoại
-- ngày_sinh,địa_chỉ.
select 
nv.ma_nhan_vien as mã_nhân_viên,
nv.ho_ten as họ_tên_nhân_viên,
nv.email as email_nhân_viên,
nv.so_dien_thoai as số_điện_thoại_nhân_viên,
nv.ngay_sinh as ngày_sinh_nhân_viên,
nv.dia_chi as địa_chỉ_nhân_viên,
kh.ma_khach_hang as mã_khách_hàng,
kh.ho_ten as họ_tên_khách_hàng,
kh.email as email_khách_hàng,
kh.so_dien_thoai as số_điện_thoại_khách_hàng,
kh.ngay_sinh as ngày_sinh_khách_hàng,
kh.dia_chi as địa_chỉ_khách_hàng
from nhan_vien nv, khach_hang kh
group by ma_nhan_vien,ma_khach_hang
order by nv.ma_nhan_vien asc, kh.ma_khach_hang asc;

