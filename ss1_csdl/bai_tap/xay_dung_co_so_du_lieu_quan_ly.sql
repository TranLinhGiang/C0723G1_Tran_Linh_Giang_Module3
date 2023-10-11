-- tạo bảng 
create table class (
id int primary key auto_increment,`name` varchar (50));
create table student(
id int primary key auto_increment,`name` varchar (50));
create table teacher(
id int primary key auto_increment,`name` varchar (50),age int ,country int);

-- thêm mới dữ liệu
insert into class(name)value("Giang");
insert into student(name)value("Hai");
insert into student(name)value("Tinh");
insert into teacher (name, age,country)value("Quang",45,123);
insert into teacher (name, age,country)value("Toại",19,190);

-- hiển thị dữ liệu 
select * from class;
select * from student;
select * from teacher;
-- xóa dữ liệu 
delete from teacher where id= 2;