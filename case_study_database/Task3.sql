-- Task3.	Hiển thị thông tin của tất cả khách hàng có độ tuổi từ 18 đến 50 tuổi và có địa chỉ ở “Đà Nẵng” hoặc “Quảng Trị”.
select ma_khach_hang, ho_ten
from khach_hang
where ((year(now()) - year(ngay_sinh)) between 18 and 50)
  and (dia_chi like '%Đà Nẵng%' or dia_chi like '%Quảng Trị%');