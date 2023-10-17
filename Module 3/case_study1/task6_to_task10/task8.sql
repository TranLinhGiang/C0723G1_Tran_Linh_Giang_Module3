-- Task 8 --
/*
Hiển thị thông tin ho_ten khách hàng có trong hệ thống, với yêu cầu ho_ten không trùng nhau.
Học viên sử dụng theo 3 cách khác nhau để thực hiện yêu cầu trên. 
*/

use furama_resort;
-- C1
select distinct ho_ten
from khach_hang;

-- C2
select ho_ten
from khach_hang 
union select ho_ten
from khach_hang; 
    
-- C3
select ho_ten
from khach_hang 
group by ho_ten;