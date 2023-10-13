create database if not exists quan_ly_sinh_vien;
use quan_ly_sinh_vien;
-- tạo bảng class;
CREATE TABLE class (
    ClassID INT not null,
    ClassName VARCHAR(45),
    StartDate DATETIME,
    `Status` INT
);
-- thêm mới vô bảng class
INSERT INTO Class
VALUES (1, 'A1', '2008-12-20', 1);
INSERT INTO Class
VALUES (2, 'A2', '2008-12-22', 1);
INSERT INTO Class
VALUES (3, 'B3', current_date, 0);

-- tạo bảng Student;
CREATE TABLE student (
    StudentID INT,
    StudentName VARCHAR(45),
    Address VARCHAR(45),
    Phone VARCHAR(45),
    `status` INT,
    ClassID INT
);
-- thêm mới vào bảng student;
INSERT INTO Student (StudentName, Address, Phone, Status, ClassId)
VALUES ('Hung', 'Ha Noi', '0912113113', 1, 1);
INSERT INTO Student (StudentName, Address, Status, ClassId)
VALUES ('Hoa', 'Hai phong', 1, 1);
INSERT INTO Student (StudentName, Address, Phone, Status, ClassId)
VALUES ('Manh', 'HCM', '0123123123', 0, 2);
-- tạo bảng subject;
CREATE TABLE `Subject` (
    SubID INT NOT NULL,
    SubName VARCHAR(45),
    Credit INT NOT NULL,
    `Status` INT NOT NULL
);
-- thêm mới vào bảng subject;
INSERT INTO Subject
VALUES (1, 'CF', 5, 1),
 (2, 'C', 6, 1),
 (3, 'HDJ', 5, 1),
 (4, 'RDBMS', 10, 1);
 -- tạo bảng Mark;
 CREATE TABLE Mark (
    MarkID INT,
    SubID INT NOT NULL,
    StudentID INT NOT NULL,
    Mark INT NOT NULL,
    ExamTimes INT NOT NULL
);
-- thêm mới vào bảng mark;
INSERT INTO Mark (SubId, StudentId, Mark, ExamTimes)
VALUES (1, 1, 8, 1);
INSERT INTO Mark (SubId, StudentId, Mark, ExamTimes)
VALUES (1, 2, 10, 2);
INSERT INTO Mark (SubId, StudentId, Mark, ExamTimes)
VALUES (2, 1, 12, 1);







