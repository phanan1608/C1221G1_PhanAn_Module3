use furama_database_advantage;

# 21.	Tạo khung nhìn có tên là v_nhan_vien để lấy được thông tin của tất cả các nhân viên có địa chỉ là “Hải Châu” và
# đã từng lập hợp đồng cho một hoặc nhiều khách hàng bất kì với ngày lập hợp đồng là “12/12/2019”.

create view v_nhan_vien as
select nv.ma_nhan_vien, ho_ten, dia_chi, ngay_lam_hop_dong
from nhan_vien nv
         inner join hop_dong hd on nv.ma_nhan_vien = hd.ma_nhan_vien
where dia_chi like '%Hải Châu%'
  and ngay_lam_hop_dong = '2019-12-12';

select *
from v_nhan_vien;

# 22.	Thông qua khung nhìn v_nhan_vien thực hiện cập nhật địa chỉ thành “Liên Chiểu” đối với tất cả các nhân viên được nhìn thấy bởi khung nhìn này.
set sql_safe_updates = 0;
update v_nhan_vien
set dia_chi = replace(dia_chi, 'Hải Châu', 'Liên Chiểu');
set sql_safe_updates = 1;

# 23.	Tạo Stored Procedure sp_xoa_khach_hang dùng để xóa thông tin của một khách hàng nào đó với ma_khach_hang được truyền
# vào như là 1 tham số của sp_xoa_khach_hang.
alter table hop_dong
    drop foreign key hop_dong_ibfk_2;
alter table hop_dong
    add constraint hop_dong_ibfk_2 foreign key (ma_khach_hang) references khach_hang (ma_khach_hang) on delete set null;

delimiter //
create procedure sp_xoa_khach_hang(in ma_khach_hang_can_xoa int)
begin
    set sql_safe_updates = 0;
    delete from khach_hang where ma_khach_hang = ma_khach_hang_can_xoa;
    set sql_safe_updates = 1;
end //
delimiter ;

drop procedure sp_xoa_khach_hang;

call sp_xoa_khach_hang(2);

# 24.	Tạo Stored Procedure sp_them_moi_hop_dong dùng để thêm mới vào bảng hop_dong với yêu cầu sp_them_moi_hop_dong
# phải thực hiện kiểm tra tính hợp lệ của dữ liệu bổ sung, với nguyên tắc không được trùng khóa chính và đảm bảo toàn vẹn
# tham chiếu đến các bảng liên quan.

drop procedure if exists sp_them_moi_hop_dong;
delimiter //
create procedure sp_them_moi_hop_dong(in ngay_lam_hop_dong_moi datetime, ngay_ket_thuc_moi datetime,
                                      tien_dat_coc_moi double,
                                      ma_nhan_vien_moi int, ma_khach_hang_moi int, ma_dich_vu_moi int)
begin
    set sql_safe_updates = 0;
    if (ngay_lam_hop_dong_moi <= ngay_ket_thuc_moi) then
        insert into hop_dong
        (ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc, ma_nhan_vien, ma_khach_hang, ma_dich_vu)
            value (ngay_lam_hop_dong_moi, ngay_ket_thuc_moi, tien_dat_coc_moi,
                   (select ma_nhan_vien
                    from nhan_vien
                    where ma_nhan_vien = ma_nhan_vien_moi),
                   (select ma_khach_hang
                    from khach_hang
                    where ma_khach_hang = ma_khach_hang_moi),
                   (select ma_dich_vu
                    from dich_vu
                    where ma_dich_vu = ma_dich_vu_moi)
            );
        #                     value (ngay_lam_hop_dong_moi, ngay_ket_thuc_moi, tien_dat_coc_moi, ma_nhan_vien_moi, ma_khach_hang_moi,
#                    ma_dich_vu_moi
#             );
    end if;
    set sql_safe_updates = 1;
end //
delimiter ;


call sp_them_moi_hop_dong('2021-12-11', '2022-12-15', 0,
                          50, 2, 1);

# 25.	Tạo Trigger có tên tr_xoa_hop_dong khi xóa bản ghi trong bảng hop_dong thì hiển thị tổng số lượng bản ghi còn lại
# có trong bảng hop_dong ra giao diện console của database.
# Lưu ý: Đối với MySQL thì sử dụng SIGNAL hoặc ghi log thay cho việc ghi ở console.
create table data_log
(
    log_id     int auto_increment,
    log_detail varchar(50),
    primary key (log_id)
);

delimiter //
create trigger tr_xoa_hop_dong
    after delete
    on hop_dong
    for each row
begin
    declare so_luong_dong int;
    set so_luong_dong = (select count(*) from hop_dong);
    insert into data_log
    set log_detail = so_luong_dong;
end //
delimiter ;

alter table hop_dong_chi_tiet
    drop constraint hop_dong_chi_tiet_ibfk_1;
alter table hop_dong_chi_tiet
    add constraint hop_dong_chi_tiet_ibfk_1 foreign key (ma_hop_dong) references hop_dong (ma_hop_dong) on delete set null;
delete
from hop_dong
where ma_hop_dong = 3;

# 26.	Tạo Trigger có tên tr_cap_nhat_hop_dong khi cập nhật ngày kết thúc hợp đồng, cần kiểm tra xem thời gian cập nhật
# có phù hợp hay không, với quy tắc sau: Ngày kết thúc hợp đồng phải lớn hơn ngày làm hợp đồng ít nhất là 2 ngày.
# Nếu dữ liệu hợp lệ thì cho phép cập nhật, nếu dữ liệu không hợp lệ thì in ra thông báo “Ngày kết thúc hợp đồng phải
# lớn hơn ngày làm hợp đồng ít nhất là 2 ngày” trên console của database.
# Lưu ý: Đối với MySQL thì sử dụng SIGNAL hoặc ghi log thay cho việc ghi ở console.

DROP PROCEDURE IF EXISTS validate_hop_dong;
DELIMITER //
CREATE PROCEDURE validate_hop_dong(in ngay_lam_hop_dong datetime,
                                   ngay_ket_thuc datetime)
    DETERMINISTIC
    NO SQL
BEGIN
    IF (day(ngay_ket_thuc) - day(ngay_lam_hop_dong)) <= 2 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =
                'Ngày kết thúc hợp đồng phải lớn hơn ngày làm hợp đồng ít nhất là 2 ngày';
    END IF;
END//
DELIMITER ;

drop trigger if exists validate_cap_nhat_hop_dong;
DELIMITER //
CREATE TRIGGER validate_cap_nhat_hop_dong
    BEFORE UPDATE
    ON hop_dong
    FOR EACH ROW
BEGIN
    CALL validate_hop_dong(NEW.ngay_lam_hop_dong, NEW.ngay_ket_thuc);
END//
DELIMITER ;

update hop_dong
set ngay_lam_hop_dong = '2022-12-12',
    ngay_ket_thuc     = '2022-12-15'
where ma_hop_dong = 13;


# 27.	Tạo Function thực hiện yêu cầu sau:
# a.	Tạo Function func_dem_dich_vu: Đếm các dịch vụ đã được sử dụng với tổng tiền là > 2.000.000 VNĐ.

delimiter //
create function dem_dich_vu() returns int
    reads sql data
    deterministic
begin
    declare `count` int;
    set count = (select count(*)
                 from (select chi_phi_thue * count(hd.ma_dich_vu) as tong_tien
                       from dich_vu dv
                                inner join hop_dong hd on dv.ma_dich_vu = hd.ma_dich_vu
                       group by hd.ma_dich_vu
                       having tong_tien > 2000000) as dich_vu_tren_2000000);
    return count;
end //
delimiter ;

select dem_dich_vu();


# b.	Tạo Function func_tinh_thoi_gian_hop_dong: Tính khoảng thời gian dài nhất tính từ lúc bắt đầu làm hợp đồng đến
# lúc kết thúc hợp đồng mà khách hàng đã thực hiện thuê dịch vụ (lưu ý chỉ xét các khoảng thời gian dựa vào từng lần
# làm hợp đồng thuê dịch vụ, không xét trên toàn bộ các lần làm hợp đồng). Mã của khách hàng được truyền vào như là
# 1 tham số của function này.

create function func_tinh_thoi_gian_hop_dong(ma_kh int) returns int
    reads sql data
    deterministic
begin
    declare ket_qua int;
    set ket_qua = (select (date(ngay_ket_thuc) - date(ngay_lam_hop_dong))
                   from hop_dong
                   where ((ngay_ket_thuc - ngay_lam_hop_dong) >=
                          (select max(ngay_ket_thuc - ngay_lam_hop_dong)
                           from hop_dong
                           where ma_khach_hang = ma_kh))
                     and ma_khach_hang = ma_kh);
    return ket_qua;
end;

drop function func_tinh_thoi_gian_hop_dong;

select func_tinh_thoi_gian_hop_dong(7) as hop_dong_co_thoi_gian_dai_nhat;

# 28.	Tạo Stored Procedure sp_xoa_dich_vu_va_hd_room để tìm các dịch vụ được thuê bởi khách hàng với loại dịch vụ là “Room”
# từ đầu năm 2015 đến hết năm 2019 để xóa thông tin của các dịch vụ đó (tức là xóa các bảng ghi trong bảng dich_vu) và
# xóa những hop_dong sử dụng dịch vụ liên quan (tức là phải xóa những bản gi trong bảng hop_dong) và những bản liên quan khác.

drop procedure if exists sp_xoa_dich_vu_va_hd_room;

delimiter //
create procedure sp_xoa_dich_vu_va_hd_room()
begin
    alter table hop_dong
        drop foreign key hop_dong_ibfk_3;
    alter table hop_dong
        add constraint hop_dong_ibfk_3 foreign key (ma_dich_vu) references dich_vu (ma_dich_vu) on delete set null;

    alter table hop_dong_chi_tiet
        drop foreign key hop_dong_chi_tiet_ibfk_1;
    alter table hop_dong_chi_tiet
        add constraint hop_dong_chi_tiet_ibfk_1 foreign key (ma_hop_dong) references hop_dong (ma_hop_dong) on delete set null;

    drop temporary table if exists temp1;
    CREATE TEMPORARY TABLE temp1 ENGINE = MEMORY
    as (select dv.ma_dich_vu, hd.ma_hop_dong
        from dich_vu dv
                 inner join hop_dong hd on dv.ma_dich_vu = hd.ma_dich_vu
        where ma_loai_dich_vu = 3
          and year(ngay_lam_hop_dong) between 2015 and 2020);
    set sql_safe_updates = 0;
    delete from dich_vu where dich_vu.ma_dich_vu in (select ma_dich_vu from temp1);
    delete from hop_dong where hop_dong.ma_hop_dong in (select ma_hop_dong from temp1);
    set sql_safe_updates = 1;
end //
delimiter ;

call sp_xoa_dich_vu_va_hd_room;

