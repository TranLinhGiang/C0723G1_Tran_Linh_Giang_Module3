create database if not exists Student;
use student;
-- tạo bảng student
create table student(
id int primary key auto_increment,
`name` varchar (50),
age int );
-- thêm dữ liệu
insert into student(name,age)value("Giang",23);
insert into student(name,age)value("Toại",24);
insert into student(name,age)value("Thuận",28);
insert into student(name,age)value("Đạt",28);
insert into student(name,age)value("Kiệt",14);
-- hiển thị dữ liệu
select * from student;
select id, name,age;
-- xóa dữ liệu
delete from student where id= 7;
