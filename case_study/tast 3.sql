use case_study;
-- hiển thị thông tin của tất cả khách hàng có độ tuổi từ 18-50 tuổi và có địa chỉ ở đà nẵng hoặc quảng trị;
SELECT
  *
FROM
  khach_hang
WHERE
  dia_chi LIKE '%Đà Nẵng%'
  or dia_chi LIKE '%Quảng Trị';
  
  SELECT
  *
FROM
  khach_hang
WHERE
  DATE_DIFF(DATE(), STR_TO_DATE(ngay_sinh, '%Y-%m-%d'), DAY) BETWEEN 365 * 18 AND 365 * 50;