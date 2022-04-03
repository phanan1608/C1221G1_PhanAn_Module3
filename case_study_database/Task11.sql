# 11.	Hiển thị thông tin các dịch vụ đi kèm đã được sử dụng bởi những khách hàng có ten_loai_khach là “Diamond”
# và có dia_chi ở “Vinh” hoặc “Quảng Ngãi”.
select dvdk.ma_dich_vu_di_kem, dvdk.ten_dich_vu_di_kem
from khach_hang kh
         inner join hop_dong hd on kh.ma_khach_hang = hd.ma_khach_hang
         inner join hop_dong_chi_tiet hdct on hd.ma_hop_dong = hdct.ma_hop_dong
         inner join dich_vu_di_kem dvdk on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
where kh.ma_loai_khach = 1
  and (kh.dia_chi like '%Vinh' or kh.dia_chi like '&Quảng Ngãi');