# 18.	Xóa những khách hàng có hợp đồng trước năm 2021 (chú ý ràng buộc giữa các bảng).

create view khach_hang_can_xoa as
select kh.ma_khach_hang,kh.ho_ten
from khach_hang kh
         inner join hop_dong hd on kh.ma_khach_hang = hd.ma_khach_hang
where (year(ngay_lam_hop_dong) != 2021)
  and (year(ngay_lam_hop_dong) = 2020);

select *
from khach_hang_can_xoa;

set sql_safe_updates = 0;
-- Do not check foreign key constraints
set foreign_key_checks = 0;

delete kh
from khach_hang kh
         inner join hop_dong hd on kh.ma_khach_hang = hd.ma_khach_hang
where (year(ngay_lam_hop_dong) != 2021)
  and (year(ngay_lam_hop_dong) = 2020);

-- Specify to check foreign key constraints (this is the default)
set foreign_key_checks = 1;
set sql_safe_updates = 1;