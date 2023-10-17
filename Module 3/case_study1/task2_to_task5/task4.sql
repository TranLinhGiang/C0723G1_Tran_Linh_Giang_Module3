-- Task 4 --

/* Đếm xem tương ứng với mỗi khách hàng đã từng đặt phòng bao nhiêu lần.
 Kết quả hiển thị được sắp xếp tăng dần theo số lần đặt phòng của khách hàng.
 Chỉ đếm những khách hàng nào có Tên loại khách hàng là “Diamond”. */

use furama_resort;

select kh.ho_ten, count(hd.ma_khach_hang) as so_lan_dat_phong
from khach_hang kh
left join hop_dong hd on kh.ma_khach_hang = hd.ma_khach_hang
left join loai_khach lk on kh.ma_loai_khach = lk.ma_loai_khach
where lk.ten_loai_khach = 'Diamond'
group by kh.ho_ten
order by so_lan_dat_phong ASC;
