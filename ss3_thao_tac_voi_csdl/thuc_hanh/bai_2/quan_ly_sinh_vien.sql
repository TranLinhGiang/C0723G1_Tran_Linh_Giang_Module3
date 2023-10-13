use quan_ly_sinh_vien;
select *
from student;

select *
from student
where Status = true;

select *
from `subject`
where credit < 10;

select S.students_id, S.student_name, C.class_name
from student S join class C on S.class_id = C.class_id;

select S.students_id, S.student_name, C.class_name
from Student S join Class C on S.ClassId = C.ClassID
where C.ClassName = 'A1';

select S.students_id, S.student_name, Sub.class_name, M.mark
from student S join mark M on S.students_id = M.students_id join Subject sub on M.sub_id = Sub.sub_id;

select S.students_id, S.student_name, Sub.sub_name, M.mark
from student S join mark M on S.students_id = M.students_id join Subject sub on M.sub_id = sub.sub_id
where Sub.sub_name = 'CF';