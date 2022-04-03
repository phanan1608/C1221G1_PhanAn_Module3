# 15.	Hiển thi thông tin của tất cả nhân viên bao gồm ma_nhan_vien, ho_ten, ten_trinh_do, ten_bo_phan, so_dien_thoai,
# dia_chi mới chỉ lập được tối đa 3 hợp đồng từ năm 2020 đến 2021.
select nv.ma_nhan_vien, nv.ho_ten, td.ten_trinh_do, bp.ten_bo_phan, nv.so_dien_thoai, nv.dia_chi
from nhan_vien nv
         left join trinh_do td on nv.ma_trinh_do = td.ma_trinh_do
         left join bo_phan bp on nv.ma_bo_phan = bp.ma_bo_phan
         left join hop_dong hd on nv.ma_nhan_vien = hd.ma_nhan_vien
where year(ngay_lam_hop_dong) = 2021
   or year(ngay_lam_hop_dong) = 2020
   or year(ngay_lam_hop_dong) = 2019
group by hd.ma_nhan_vien
having count(ma_hop_dong) <= 3
order by ma_nhan_vien;