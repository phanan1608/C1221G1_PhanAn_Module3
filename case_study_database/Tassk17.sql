# 17.	Cập nhật thông tin những khách hàng có ten_loai_khach từ Platinum lên Diamond, chỉ cập nhật những khách hàng đã
# từng đặt phòng với Tổng Tiền thanh toán trong năm 2021 là lớn hơn 10.000.000 VNĐ.

create view khach_hang_can_cap_nhat as
select kh.ma_khach_hang,
       kh.ho_ten,
       kh.ma_loai_khach,
       sum(dv.chi_phi_thue + coalesce(hdct.so_luong * dvdk.gia, 0)) as tong
from hop_dong hd
         right join khach_hang kh on hd.ma_khach_hang = kh.ma_khach_hang
         left join loai_khach lk on kh.ma_loai_khach = lk.ma_loai_khach
         left join hop_dong_chi_tiet hdct on hd.ma_hop_dong = hdct.ma_hop_dong
         left join dich_vu dv on hd.ma_dich_vu = dv.ma_dich_vu
         left join dich_vu_di_kem dvdk on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
where hd.ma_khach_hang not in
      (select ma_dich_vu from hop_dong where year(ngay_lam_hop_dong) = 2020 and year(ngay_lam_hop_dong) != 2021)
  and kh.ma_loai_khach = 2
group by kh.ma_khach_hang
having tong > 10000000;

select *
from khach_hang_can_cap_nhat;

set sql_safe_updates = 0;
update khach_hang
set khach_hang.ma_loai_khach =1
where ma_khach_hang in (select ma_khach_hang from khach_hang_can_cap_nhat);
set sql_safe_updates = 1;