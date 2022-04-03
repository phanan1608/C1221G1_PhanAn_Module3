# Task6.	Hiển thị ma_dich_vu, ten_dich_vu, dien_tich, chi_phi_thue, ten_loai_dich_vu của tất cả các loại dịch vụ
# chưa từng được khách hàng thực hiện đặt từ quý 1 của năm 2021 (Quý 1 là tháng 1, 2, 3).
select dv.ma_dich_vu, dv.ten_dich_vu, dv.dien_tich, dv.chi_phi_thue, ldv.ten_loai_dich_vu
from loai_dich_vu ldv
         inner join dich_vu dv on ldv.ma_loai_dich_vu = dv.ma_loai_dich_vu
         right join hop_dong hd on dv.ma_dich_vu = hd.ma_dich_vu
where dv.ma_dich_vu not in (select ma_dich_vu
                            from hop_dong
                            where quarter(ngay_lam_hop_dong) = 1
                              and year(ngay_lam_hop_dong) = 2021)
group by dv.ma_dich_vu
order by chi_phi_thue desc;
