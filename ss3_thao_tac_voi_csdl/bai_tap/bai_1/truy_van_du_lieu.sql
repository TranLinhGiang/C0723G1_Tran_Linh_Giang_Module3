drop database if exists quan_ly_sinh_vien;
create database if not exists quan_ly_sinh_vien;
use quan_ly_sinh_vien;
-- hiển thị tất cả các sinh viên có tên bắt đầu bảng ký tự `h`;
select *from student
where student_name like 'H%'; 
-- Hiển thị các thông tin lớp học có thời gian bắt đầu vào tháng 12.
select * from class
where start_date like '2008-12%';
-- Hiển thị tất cả các thông tin môn học có credit trong khoảng từ 3-5.
select *from subject
where credit between 3 and 5;
-- Thay đổi mã lớp(ClassID) của sinh viên có tên ‘Hung’ là 2.
set sql_safe_updates=0;
update student
set class_id= 2
where student_name = 'Hung';
-- Hiển thị các thông tin: StudentName, SubName, Mark. Dữ liệu sắp xếp theo điểm thi (mark) giảm dần. nếu trùng sắp theo tên tăng dần.
select student_name,sub_name,mark
from student,subject,mark
order by mark DESC, student_name ASC;




