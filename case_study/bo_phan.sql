use bo_phan;
-- tạo bảng bộ phận;
CREATE TABLE bo_phan (
    ma_bo_phan INT,
    ten_bo_phan VARCHAR(45)
);
-- thêm mới 
insert into bo_phan( ma_bo_phan,ten_bo_phan)value(1,"giám đốc");
insert into bo_phan( ma_bo_phan,ten_bo_phan)value(2,"lễ tân");
insert into bo_phan( ma_bo_phan,ten_bo_phan)value(3,"phục vụ");
insert into bo_phan( ma_bo_phan,ten_bo_phan)value(4,"lao công");
insert into bo_phan( ma_bo_phan,ten_bo_phan)value(5,"trợ lý");
insert into bo_phan( ma_bo_phan,ten_bo_phan)value(6,"thư ký");
-- hiển thị 
select *from bo_phan;
-- xóa
delete from bo_phan where ma_bo_phan= 1;