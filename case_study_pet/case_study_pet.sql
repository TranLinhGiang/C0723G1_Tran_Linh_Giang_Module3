drop database if exists pet_store;
create database if not exists pet_store;
use pet_store;
-- tạo bảng nhân viên;
create table if not exists employees(
employee_id int not null,
username varchar(50) not null,
employee_password varchar(50) not null,
roles varchar(20) not null,
employee_name varchar(50),
birthday date,
phone_number varchar(10) not null,
address varchar(50) not null,
identification_card varchar(12) not null,
salary int,
unique(username,roles,phone_number,identification_card),
primary key(employee_id),
check (username in ('ADMIN' and 'EMPLOYEE'))
);
-- tạo bảng loại pet;
create table pet_type(
pet_type_id int primary key,
pet_name_type varchar(50) not null);
-- tạo bảng pet;
create table pet(
id_pet int primary key,
pet_name varchar(50) not null,
pet_species varchar(50) not null,
pet_weight double not null,
pet_type_id int,
foreign key(pet_type_id) references pet_type(pet_type_id));
-- tạo bảng loại khách;
create table customer_type(
customer_type_id int primary key,
name_customer_type varchar(50));
-- tạo bảng khách hàng;
create table customer(
customer_id int primary key,
customer_name varchar(50) not null,
number_phone varchar(20) not null,
address varchar(50) not null,
customer_type varchar(50),
customer_type_id int,
id_pet int not null,
foreign key (id_pet)references pet(id_pet),
foreign key (customer_type_id)references customer_type(customer_type_id));


-- tạo bảng dịch vụ;
create table service(
service_id int not null primary key,
service_name varchar(50) not null,
price double);
-- tạo bảng dịch vụ chi tiết;
create table detailed_service(
detailed_service_id int not null primary key,
service_id int,
employee_id int,
customer_id int ,
foreign key(service_id) references service(service_id));
-- tạo bảng hóa đơn;
create table bill(
id_bill int not null,
employee_id int,
detailed_service_id int,
customer_id int,
start_time time not null,
end_time time not null,
foreign key(detailed_service_id) references detailed_service(detailed_service_id),
foreign key(customer_id) references customer(customer_id),
foreign key(employee_id) references employees(employee_id));













