use quan_ly_sinh_vien;
-- Hiển thị tất cả các thông tin môn học (bảng subject) có credit lớn nhất.
select max(s.credit) as max_credit
from `subject` s;
-- Hiển thị các thông tin môn học có điểm thi lớn nhất.
select max(mark) max_mark
from mark;
-- Hiển thị các thông tin sinh viên và điểm trung bình của mỗi sinh viên, xếp hạng theo thứ tự điểm giảm dần
select s.student_id,s.student_name,avg (m.mark)as diem_trung_binh
from student s
join mark m on s.student_id= m.mark_id
group by s.student_id
order by m.mark desc;