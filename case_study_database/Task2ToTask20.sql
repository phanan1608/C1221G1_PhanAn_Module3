use furama_database;

-- Task2.	Hiển thị thông tin của tất cả nhân viên có trong hệ thống có tên bắt đầu là một trong các ký tự “H”, “T” hoặc “K” và có tối đa 15 kí tự. 
select ma_nhan_vien, ho_ten
from nhan_vien
where ho_ten regexp '^[HKT]\.'
  and length(ho_ten) <= 16;
-- where (ho_ten like 'H%' or ho_ten like 'K%' or ho_ten like 'T%') 

-- Task3.	Hiển thị thông tin của tất cả khách hàng có độ tuổi từ 18 đến 50 tuổi và có địa chỉ ở “Đà Nẵng” hoặc “Quảng Trị”.
select ma_khach_hang, ho_ten
from khach_hang
where ((year(now()) - year(ngay_sinh)) between 18 and 50)
  and (dia_chi like '%Đà Nẵng%' or dia_chi like '%Quảng Trị%');

-- Task4.	Đếm xem tương ứng với mỗi khách hàng đã từng đặt phòng bao nhiêu lần. Kết quả hiển thị được sắp xếp tăng dần theo số lần đặt phòng của khách hàng. 
-- Chỉ đếm những khách hàng nào có Tên loại khách hàng là “Diamond”.
select khach_hang.ma_khach_hang, khach_hang.ho_ten, count(hop_dong.ma_hop_dong) as so_lan_dat_phong
from khach_hang
         inner join hop_dong on khach_hang.ma_khach_hang = hop_dong.ma_khach_hang
where khach_hang.ma_loai_khach = 1
group by hop_dong.ma_khach_hang
order by so_lan_dat_phong;

-- Task5.	Hiển thị ma_khach_hang, ho_ten, ten_loai_khach, ma_hop_dong, ten_dich_vu, ngay_lam_hop_dong, ngay_ket_thuc, tong_tien
-- (Với tổng tiền được tính theo công thức như sau: Chi Phí Thuê + Số Lượng * Giá, với Số Lượng và Giá là từ bảng dich_vu_di_kem, hop_dong_chi_tiet)
-- cho tất cả các khách hàng đã từng đặt phòng. (những khách hàng nào chưa từng đặt phòng cũng phải hiển thị ra).

select kh.ma_khach_hang,
       kh.ho_ten,
       lk.ten_loai_khach,
       hd.ma_hop_dong,
       dv.ten_dich_vu,
       hd.ngay_lam_hop_dong,
       hd.ngay_ket_thuc,
       sum(dv.chi_phi_thue + coalesce(hdct.so_luong * dvdk.gia, 0)) as tong
from hop_dong hd
         right join khach_hang kh on hd.ma_khach_hang = kh.ma_khach_hang
         left join loai_khach lk on kh.ma_loai_khach = lk.ma_loai_khach
         left join hop_dong_chi_tiet hdct on hd.ma_hop_dong = hdct.ma_hop_dong
         left join dich_vu dv on hd.ma_dich_vu = dv.ma_dich_vu
         left join dich_vu_di_kem dvdk on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
group by hd.ma_hop_dong, kh.ma_khach_hang
order by ma_khach_hang, ma_hop_dong desc;

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


# Task 7.	Hiển thị thông tin ma_dich_vu, ten_dich_vu, dien_tich, so_nguoi_toi_da, chi_phi_thue, ten_loai_dich_vu của tất cả
# các loại dịch vụ đã từng được khách hàng đặt phòng trong năm 2020 nhưng chưa từng được khách hàng đặt phòng trong năm 2021.
select dv.ma_dich_vu, dv.ten_dich_vu, dv.dien_tich, dv.so_nguoi_toi_da, dv.chi_phi_thue, ldv.ten_loai_dich_vu
from loai_dich_vu ldv
         inner join dich_vu dv on ldv.ma_loai_dich_vu = dv.ma_loai_dich_vu
         right join hop_dong hd on dv.ma_dich_vu = hd.ma_dich_vu
where dv.ma_dich_vu not in
      (select ma_dich_vu from hop_dong where year(ngay_lam_hop_dong) != 2020 and year(ngay_lam_hop_dong) = 2021)
group by dv.ma_dich_vu;

# 8.	Hiển thị thông tin ho_ten khách hàng có trong hệ thống, với yêu cầu ho_ten không trùng nhau.
select ho_ten
from khach_hang
union
select ho_ten
from khach_hang;

select distinct ho_ten
from khach_hang;

select ho_ten
from khach_hang
group by ho_ten;

# 9.	Thực hiện thống kê doanh thu theo tháng, nghĩa là tương ứng với mỗi tháng trong năm 2021
# thì sẽ có bao nhiêu khách hàng thực hiện đặt phòng.
select month(ngay_lam_hop_dong) as thang, count(ma_dich_vu) as so_luong_khach_hang
from hop_dong
where year(ngay_lam_hop_dong) = 2021
group by month(ngay_lam_hop_dong)
order by thang;

# 10.	Hiển thị thông tin tương ứng với từng hợp đồng thì đã sử dụng bao nhiêu dịch vụ đi kèm. Kết quả hiển thị bao gồm
# ma_hop_dong, ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc, so_luong_dich_vu_di_kem (được tính dựa trên việc
# sum so_luong ở dich_vu_di_kem).
select hd.ma_hop_dong,
       hd.ngay_lam_hop_dong,
       hd.ngay_ket_thuc,
       hd.tien_dat_coc,
       coalesce(sum(so_luong), 0) as so_luong_dich_vu_di_kem
from hop_dong hd
         left join hop_dong_chi_tiet hdct on hd.ma_hop_dong = hdct.ma_hop_dong
group by hd.ma_hop_dong;

# 11.	Hiển thị thông tin các dịch vụ đi kèm đã được sử dụng bởi những khách hàng có ten_loai_khach là “Diamond”
# và có dia_chi ở “Vinh” hoặc “Quảng Ngãi”.
select dvdk.ma_dich_vu_di_kem, dvdk.ten_dich_vu_di_kem
from khach_hang kh
         inner join hop_dong hd on kh.ma_khach_hang = hd.ma_khach_hang
         inner join hop_dong_chi_tiet hdct on hd.ma_hop_dong = hdct.ma_hop_dong
         inner join dich_vu_di_kem dvdk on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
where kh.ma_loai_khach = 1
  and (kh.dia_chi like '%Vinh' or kh.dia_chi like '&Quảng Ngãi');

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

# 13.	Hiển thị thông tin các Dịch vụ đi kèm được sử dụng nhiều nhất bởi các Khách hàng đã đặt phòng. (Lưu ý là có thể có
# nhiều dịch vụ có số lần sử dụng nhiều như nhau).
select hd.ma_hop_dong, dvdk.ten_dich_vu_di_kem, sum(hdct.so_luong) as so_luong_dich_vu_di_kem
from hop_dong hd
         inner join hop_dong_chi_tiet hdct on hd.ma_hop_dong = hdct.ma_hop_dong
         inner join dich_vu_di_kem dvdk on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
group by hdct.ma_dich_vu_di_kem
having so_luong_dich_vu_di_kem = (select sum(so_luong)
                                   from hop_dong_chi_tiet
                                   group by ma_dich_vu_di_kem
                                   order by sum(so_luong) desc
                                   limit 1);
# 14.	Hiển thị thông tin tất cả các Dịch vụ đi kèm chỉ mới được sử dụng một lần duy nhất. Thông tin hiển thị bao gồm
# ma_hop_dong, ten_loai_dich_vu, ten_dich_vu_di_kem, so_lan_su_dung (được tính dựa trên việc count các ma_dich_vu_di_kem).
select hd.ma_hop_dong,
       ldv.ten_loai_dich_vu,
       dvdk.ten_dich_vu_di_kem,
       count(dvdk.ma_dich_vu_di_kem) as so_lan_su_dung
from hop_dong hd
         inner join hop_dong_chi_tiet hdct on hd.ma_hop_dong = hdct.ma_hop_dong
         inner join dich_vu_di_kem dvdk on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
         inner join dich_vu dv on hd.ma_dich_vu = dv.ma_dich_vu
         inner join loai_dich_vu ldv on dv.ma_loai_dich_vu = ldv.ma_loai_dich_vu
group by dvdk.ma_dich_vu_di_kem
having count(dvdk.ma_dich_vu_di_kem) = 1
order by hd.ma_hop_dong;

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

# 16.	Xóa những Nhân viên chưa từng lập được hợp đồng nào từ năm 2019 đến năm 2021.

create OR REPLACE view v_nhan_vien_chua_co_hop_dong as
select nv.ma_nhan_vien, nv.ho_ten , count(isnull( nv.ma_nhan_vien)) as so_hop_dong
from nhan_vien nv
         left join hop_dong hd on nv.ma_nhan_vien = hd.ma_nhan_vien

where (year( ngay_ket_thuc) between 2019 and 2021
or year(ngay_lam_hop_dong) between 2019 and 2021)
GROUP BY nv.ma_nhan_vien
HAVING so_hop_dong > 0 ;

select * from v_nhan_vien_chua_co_hop_dong;

set sql_safe_updates =0;
delete nv
from nhan_vien nv
where ma_nhan_vien  not in (select ma_nhan_vien from v_nhan_vien_chua_co_hop_dong) ;
set sql_safe_updates =1;

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

# 18.	Xóa những khách hàng có hợp đồng trước năm 2021 (chú ý ràng buộc giữa các bảng).

create view khach_hang_can_xoa as
select kh.ma_khach_hang
from khach_hang kh
         inner join hop_dong hd on kh.ma_khach_hang = hd.ma_khach_hang
where (year(ngay_lam_hop_dong) < 2021);

select *
from khach_hang_can_xoa;

set sql_safe_updates = 0;

alter table hop_dong
drop foreign key hop_dong_ibfk_2;
alter table hop_dong
add constraint hop_dong_ibfk_2 foreign key (ma_khach_hang) references khach_hang (ma_khach_hang) on delete set null;

delete kh
from khach_hang kh
         inner join hop_dong hd on kh.ma_khach_hang = hd.ma_khach_hang
where (year(ngay_lam_hop_dong) != 2021)
  and (year(ngay_lam_hop_dong) = 2020);

-- Specify to check foreign key constraints (this is the default)
set foreign_key_checks = 1;
set sql_safe_updates = 1;

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

set sql_safe_updates = 0;
update dich_vu_di_kem
set gia=gia * 2
where ma_dich_vu_di_kem in (select ma_dich_vu_di_kem from dich_vu_can_tang_gia);
set sql_safe_updates = 1;

# 20.	Hiển thị thông tin của tất cả các nhân viên và khách hàng có trong hệ thống, thông tin hiển thị bao gồm
# id (ma_nhan_vien, ma_khach_hang), ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi.
select ma_nhan_vien, ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi
from nhan_vien
union
select ma_khach_hang, ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi
from khach_hang