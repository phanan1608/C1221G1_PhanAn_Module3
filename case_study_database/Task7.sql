# Task 7.	Hiển thị thông tin ma_dich_vu, ten_dich_vu, dien_tich, so_nguoi_toi_da, chi_phi_thue, ten_loai_dich_vu của tất cả
# các loại dịch vụ đã từng được khách hàng đặt phòng trong năm 2020 nhưng chưa từng được khách hàng đặt phòng trong năm 2021.
select dv.ma_dich_vu, dv.ten_dich_vu, dv.dien_tich, dv.so_nguoi_toi_da, dv.chi_phi_thue, ldv.ten_loai_dich_vu
from loai_dich_vu ldv
         inner join dich_vu dv on ldv.ma_loai_dich_vu = dv.ma_loai_dich_vu
         right join hop_dong hd on dv.ma_dich_vu = hd.ma_dich_vu
where dv.ma_dich_vu not in
      (select ma_dich_vu from hop_dong where year(ngay_lam_hop_dong) != 2020 and year(ngay_lam_hop_dong) = 2021)
group by dv.ma_dich_vu;