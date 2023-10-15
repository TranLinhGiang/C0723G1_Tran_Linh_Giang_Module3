use case_study;
-- hiển thị mã khách hàng , họ tên, tên loại khách, mã hợp đồng, tên dịch vụ, ngày làm hợp đồng, ngày kết thúc, tổng tiền;
-- công thức tinsg tổng số tiền: chi phí thuê + số lượng * giá 
SELECT 
    khach_hang.ma_khach_hang,
    khach_hang.ho_ten,
    loai_khach.ten_loai_khach_hang,
    dich_vu.ten_dich_vu,
    hop_dong.ma_hop_dong,
    hop_dong.ngay_lam_hop_dong,
    hop_dong.ngay_ket_thuc,
    SUM(dich_vu_di_kem.gia * hop_dong_chi_tiet.so_luong) AS tong_tien
FROM
    khach_hang
        JOIN
    loai_khach ON khach_hang.ma_loai_khach = loai_khach.ten_loai_khach_hang
        LEFT JOIN
    hop_dong ON hop_dong.ma_hop_dong
        AND hop_dong.ngay_lam_hop_dong
        AND hop_dong.ngay_ket_thuc
        LEFT JOIN
    dich_vu ON dich_vu.ten_dich_vu
    left join 
    hop_dong_chi_tiet on hop_dong_chi_tiet.so_luong
    left join 
    dich_vu_di_kem on dich_vu_di_kem.gia;
    
    
 
    


