# 12.	Hiển thị thông tin ma_hop_dong, ho_ten (nhân viên), ho_ten (khách hàng), so_dien_thoai (khách hàng), ten_dich_vu,
# so_luong_dich_vu_di_kem (được tính dựa trên việc sum so_luong ở dich_vu_di_kem), tien_dat_coc của tất cả các dịch vụ
# đã từng được khách hàng đặt vào 3 tháng cuối năm 2020 nhưng chưa từng được khách hàng đặt vào 6 tháng đầu năm 2021.
select hd.ma_hop_dong,
       nv.ho_ten,
       kh.ho_ten,
       kh.so_dien_thoai,
       dv.ten_dich_vu,
       coalesce(sum(so_luong), 0) as so_luong_dich_vu_di_kem,
       hd.tien_dat_coc
from nhan_vien nv
         inner join hop_dong hd on nv.ma_nhan_vien = hd.ma_nhan_vien
         inner join khach_hang kh on hd.ma_khach_hang = kh.ma_khach_hang
         left join hop_dong_chi_tiet hdct on hd.ma_hop_dong = hdct.ma_hop_dong
         left join dich_vu_di_kem dvdk on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
         inner join dich_vu dv on hd.ma_dich_vu = dv.ma_dich_vu
where hd.ma_hop_dong in (select ma_hop_dong
                         from hop_dong
                         where ((quarter(ngay_lam_hop_dong) = 4 and year(ngay_lam_hop_dong) = 2020))
                           and not ((quarter(ngay_lam_hop_dong) in (1, 2) and year(ngay_lam_hop_dong) = 2021)))
group by hd.ma_hop_dong;