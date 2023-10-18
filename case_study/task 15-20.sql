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
dv.chi_phi_thue + hdct.so_luong * dvdk.gia as tong_tien
from khach_hang kh
join loai_khach lk on kh.ma_loai_khach= kh.ma_loai_khach
join hop_dong hd on kh.ma_khach_hang= hd.ma_khach_hang
join dich_vu dv on hd.ma_dich_vu= dv.ma_dich_vu
join hop_dong_chi_tiet hdct on hd.ma_hop_dong= hdct.ma_hop_dong
join dich_vu_di_kem dvdk on hdct.ma_dich_vu_di_kem= dvdk.ma_dich_vu_di_kem
where lk.ma_loai_khach=2 and hd.ngay_lam_hop_dong >'2021-01-01'
group by ho_ten;

-- 18: Xóa những khách hàng có hợp đồng trước năm 2021( chú ý ràng buộc giữa các bảng);
select hd.ma_hop_dong,kh.ho_ten
from hop_dong hd
join khach_hang kh on hd.ma_khach_hang= kh.ma_khach_hang 
where hd.ngay_lam_hop_dong < '2021-01-01'
group by hd.ma_hop_dong;


-- 19: Cập nhật giá cho các dịch vụ đi kèm được sử dụng trên 10 lần trong năm 2020 lên gấp đôi.

