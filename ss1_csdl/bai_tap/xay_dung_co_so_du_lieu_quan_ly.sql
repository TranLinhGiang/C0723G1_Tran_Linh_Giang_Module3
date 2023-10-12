-- lưu ở đâu 
use student_management;
-- tạo bảng
CREATE TABLE class (
    id_class INT PRIMARY KEY AUTO_INCREMENT,
    class_name VARCHAR(50)
);
CREATE TABLE teacher (
    id_teach INT PRIMARY KEY AUTO_INCREMENT,
    name_teach VARCHAR(50),
    age_teach INT,
    country_teach VARCHAR(50)
);
CREATE TABLE student (
    id_student INT PRIMARY KEY AUTO_INCREMENT,
    name_student VARCHAR(50),
    age_student INT,
    country_student VARCHAR(50)
);
-- thêm mới
insert into class(class_name)value
("C0623G1"),
("C0723G1"),
("C0823G1");

insert into teacher(name_teach,age_teach,country_teach)value
("Nguyễn Thị Thu",21,"việt Nam"),
("Nguyễn Thị Hằng",40,"Việt Nam"),
("Đinh Tống Giang",34,"Việt Nam");

insert into student(name_student,age_student,country_student)value
("Trần Linh Giang",21,"Việt Nam"),
("Alex",18,"USA"),
("Melody Mark",19,"USA"); 
