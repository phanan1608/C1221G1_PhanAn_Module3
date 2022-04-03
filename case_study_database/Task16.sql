# 16.	Xóa những Nhân viên chưa từng lập được hợp đồng nào từ năm 2019 đến năm 2021.
select nv.ma_nhan_vien, nv.ho_ten
from nhan_vien nv
         left join hop_dong hd on nv.ma_nhan_vien = hd.ma_nhan_vien
where hd.ma_nhan_vien is null;

set sql_safe_updates = 0;
delete nv
from nhan_vien nv
         left join hop_dong hd on nv.ma_nhan_vien = hd.ma_nhan_vien
where hd.ma_nhan_vien is null;
set sql_safe_updates = 1;