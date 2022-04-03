-- Task2.	Hiển thị thông tin của tất cả nhân viên có trong hệ thống có tên bắt đầu là một trong các ký tự “H”, “T” hoặc “K” và có tối đa 15 kí tự.
select ma_nhan_vien, ho_ten
from nhan_vien
where ho_ten regexp '^[HKT]\.'
  and length(ho_ten) <= 16;
-- where (ho_ten like 'H%' or ho_ten like 'K%' or ho_ten like 'T%')