use case_study;
-- hiển thị thông tin tất cả nhân viên có trong hệ thống có tên bắt đầu là một trong các ký tự H,T hoặc K và có tối đa 15 ký tự;
SELECT
  *
FROM
  nhan_vien
WHERE
  ho_ten LIKE 'H%' OR ho_ten LIKE 'T%' OR ho_ten LIKE 'K%'
  AND length(ho_ten) <= 15;

  