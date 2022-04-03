# 19.	Cập nhật giá cho các dịch vụ đi kèm được sử dụng trên 10 lần trong năm 2020 lên gấp đôi.

create view dich_vu_can_tang_gia as
select dvdk.ma_dich_vu_di_kem, ten_dich_vu_di_kem, sum(so_luong) as so_lan_su_dung
from hop_dong hd
         inner join hop_dong_chi_tiet hdct on hd.ma_hop_dong = hdct.ma_hop_dong
         inner join dich_vu_di_kem dvdk on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
where year(ngay_lam_hop_dong) = 2020
  and not year(ngay_lam_hop_dong) = 2021
group by dvdk.ma_dich_vu_di_kem
having so_lan_su_dung >= 10;

select *
from dich_vu_can_tang_gia;

set sql_safe_updates = 0;
update dich_vu_di_kem
set gia=gia * 2
where ma_dich_vu_di_kem in (select ma_dich_vu_di_kem from dich_vu_can_tang_gia);
set sql_safe_updates = 1;