use case_study;
-- task 6: hiển thị mã dịch vụ,tên dịch vụ,diện tích, chi phí thuê,tên loại dịch vụ của tất cả loại dịch vụ chưa từng được khách hàng thực hiện đặt từ quý 1( quý 1 là tháng 1,2,3)
SELECT 
    dv.ma_dich_vu,
    dv.ten_dich_vu,
    dv.dien_tich,
    dv.chi_phi_thue,
    ldv.ten_loai_dich_vu
FROM
    dich_vu dv
        JOIN
    loai_dich_vu ldv ON dv.ma_loai_dich_vu = ldv.ma_loai_dich_vu
        JOIN
    hop_dong hd ON dv.ma_dich_vu = hd.ma_dich_vu
WHERE
    hd.ngay_lam_hop_dong > '2021-04-01'
GROUP BY dv.ma_dich_vu;
-- tast 7: hiển thị thông tin mã dịch vụ, tên dịch vụ, diện tích, số người tối đa,chi phí thuê,tên loại dịch vụ,
-- của tất cả các loại dịch vụ đã từng được khách hàng đặt phòng trong năm 2020 nhưng chưa từng đặt trong năm 2021;
 SELECT
  dv.ma_dich_vu,
  dv.ten_dich_vu,
  dv.dien_tich,
  dv.chi_phi_thue,
  ldv.ten_loai_dich_vu
FROM
  dich_vu dv
WHERE
  dv.ma_dich_vu NOT IN (
    SELECT
      ma_dich_vu
    FROM
      hop_dong
    WHERE
      year(ngay_lam_hop_dong) = 2021
      AND month(ngay_lam_hop_dong) IN (1, 2, 3)
  );
  -- task 8: hiển thị thông tin họ tên khách hàng có trong hệ thống, yêu cầu với họ tên không trùng nhau;
  -- cách 1:
SELECT 
    kh.ho_ten
FROM
    khach_hang kh
GROUP BY kh.ho_ten
HAVING COUNT(*) = 1;
  -- cách 2:
 SELECT 
    kh.ho_ten
FROM
    khach_hang kh
WHERE
    khach_hang.ho_ten IN (SELECT DISTINCT
            khach_hang.ho_ten
        FROM
            khach_hang);
-- task 9: thực hiện thống kê doanh thu theo tháng, nghĩa là tương ứng với mỗi thnags trong năm 2021 thì sẽ có bao nhiêu khách hàng thực hiện đặt phòng;
SELECT
  thang as tháng,
  COUNT(*) AS số_lượng_khách_hàng
FROM
  (
    SELECT
      month(ngay_lam_hop_dong) AS thang
    FROM
      hop_dong
    WHERE
      year(ngay_lam_hop_dong) = 2021
  ) AS hd_thang
GROUP BY
  thang;
  -- task 10: hiển thị thông tin tương ứng với từng hợp đồng thì đã sử dụng bao nhiêu dịch vụ đi kèm.Kết quả hiển thị bao gồm:
  -- mã hợp đồng, ngày làm hợp đồng, ngày kết thúc, tiền đặt cọc, số lượng dịch vụ đi kèm;
SELECT
  hd.ma_hop_dong as mã_hợp_đồng,
  ngay_lam_hop_dong as ngày_làm_hợp_đồng,
  ngay_ket_thuc as nagyf_kêt_thúc,
  tien_dat_coc as tiền_đặt_cọc,
  COUNT(DISTINCT dvdk.ma_dich_vu_di_kem) AS số_lượng_dịch_vụ_đi_kèm
FROM
  hop_dong hd
LEFT JOIN hop_dong_chi_tiet hdct ON hd.ma_hop_dong = hdct.ma_hop_dong
LEFT JOIN dich_vu_di_kem dvdk ON hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
GROUP BY
  hd.ma_hop_dong;