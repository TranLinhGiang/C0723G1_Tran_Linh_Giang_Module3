use case_study;
  -- đếm xem tương ứng với mỗi khách hàng đã từng đặt phòng bao nhiêu lần. kết quả hiển thị được sắp xếp tăng dần theo số lần đặt phòng bao nhiêu lần 
  -- Kết quả hiển thị được tăng dần theo số lần đặt phòng của khách hàng. chỉ đếm những khách nào có tên loại khách hàng là diamond;

SELECT 
    k.ho_ten, COUNT(h.ma_khach_hang) AS so_lan_dat_phong
FROM
    khach_hang k
        LEFT JOIN
    hop_dong h ON k.ma_khach_hang = h.ma_khach_hang
    join 
    loai_khach lk on k.ma_loai_khach = lk.ma_loai_khach
WHERE
    lk.ten_loai_khach_hang = 'Diamond'
GROUP BY k.ho_ten
ORDER BY so_lan_dat_phong ASC;
