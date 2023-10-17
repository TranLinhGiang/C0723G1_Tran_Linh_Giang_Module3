use quan_ly_sinh_vien;
/*-----------[Bài tập] Truy vấn dữ liệu với CSDL Quản lý sinh viên----------*/
 
 /* Hiển thị tất cả các sinh viên có tên bắt đầu bảng ký tự ‘h’
Hiển thị các thông tin lớp học có thời gian bắt đầu vào tháng 12.
Hiển thị tất cả các thông tin môn học có credit trong khoảng từ 3-5.
Thay đổi mã lớp(ClassID) của sinh viên có tên ‘Hung’ là 2.
Hiển thị các thông tin: StudentName, SubName, Mark. Dữ liệu sắp xếp theo điểm thi (mark) giảm dần. nếu trùng sắp theo tên tăng dần.*/

-- Hiển thị tất cả các sinh viên có tên bắt đầu bảng ký tự ‘h’
select * from student where student_name like 'H%';
-- Hiển thị các thông tin lớp học có thời gian bắt đầu vào tháng 12.
select * from class where month(start_date) = 12;
-- Hiển thị tất cả các thông tin môn học có credit trong khoảng từ 3-5.
select * from subject where credit between 3 and 5;
-- Thay đổi mã lớp(ClassID) của sinh viên có tên ‘Hung’ là 2.
set sql_safe_updates = 0;
update student set class_id = 2 where student_name = 'Hung';
-- Hiển thị các thông tin: StudentName, SubName, Mark. Dữ liệu sắp xếp theo điểm thi (mark) giảm dần. nếu trùng sắp theo tên tăng dần.
select s.student_name as StudentName, sub.sub_name as SubName, m.mark as Mark
from mark m
join student s on m.student_id = s.student_id
join subject sub on m.sub_id = sub.sub_id
order by m.mark desc, s.student_name asc;

