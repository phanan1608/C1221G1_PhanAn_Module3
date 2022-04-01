create database demo_database;
use demo_database;
CREATE TABLE product
(
    id                  int         not null,
    product_code        varchar(45) not null,
    product_price       double,
    product_name        varchar(45),
    product_amount      int,
    product_description varchar(100),
    product_status      bit
);
INSERT INTO product
VALUES (1, 'Product1001', 1000, 'iphone11', 100, 'like new', 1),
       (2, 'Product1001', 1200, 'iphone11', 100, 'full box', 1),
       (3, 'Product1002', 1200, 'iphone12', 300, 'like new', 0),
       (4, 'Product1003', 1500, 'iphone13', 400, 'full box', 1),
       (5, 'Product1004', 1500, 'iphone14', 400, 'full box', 0),
       (6, 'Product1005', 1200, 'iphone15', 500, 'full box', 1);

# Tạo Unique Index trên bảng Products (sử dụng cột productCode để tạo chỉ mục)
alter table product
    add index idx_product_code (product_code);

alter table product
    drop index idx_product_code;


# Tạo Composite Index trên bảng Products (sử dụng 2 cột productName và productPrice)
alter table product
    add index idx_product_name_price (product_price, product_name);

alter table product
    drop index idx_product_name_price;

# Sử dụng câu lệnh EXPLAIN để biết được câu lệnh SQL của bạn thực thi như nào
explain
select *
from product
where product_code = 'Product1004';

explain
select *
from product
where product_price = 'Product1004';

explain
select *
from product
where product_name = 'iphone11'
   or product_name = 'iphone12';

# Tạo view lấy về các thông tin: productCode, productName, productPrice, productStatus từ bảng products.
explain
select *
from product
where product_price = 1000
  and product_name = 'iphone11';

create or replace view product_views as
select product_code, product_name, product_price, product_status
from product;

select *
from product_views;

# Tiến hành sửa đổi view
update product_views
set product_status=1
where product_code = 'Product1002';

# Tiến hành xoá view
drop view product_views;

# Tạo store procedure lấy tất cả thông tin của tất cả các sản phẩm trong bảng product
DELIMITER //
CREATE PROCEDURE find_all_product()
BEGIN
    SELECT * FROM product;
END //
DELIMITER ;

call find_all_product();

# Tạo store procedure thêm một sản phẩm mới
DELIMITER //
CREATE PROCEDURE addProduct(in id_add int, product_code_add varchar(45), product_price_add double,
                            product_name_add varchar(45), product_amount_add int,
                            product_description_add varchar(100), product_status_add bit)
BEGIN

    insert into product
        value (id_add, product_code_add, product_price_add, product_name_add, product_amount_add,
               product_description_add, product_status_add);
END //
DELIMITER ;

call addProduct(7, 'Product1007', 2000, 'iphone16',
                500, 'like new', 1);
# Tạo store procedure sửa thông tin sản phẩm theo id
DELIMITER //
CREATE PROCEDURE updateProduct(in id_update int, product_code_update varchar(45), product_price_update double,
                               product_name_update varchar(45), product_amount_update int,
                               product_description_update varchar(100), product_status_update bit)
BEGIN
    set sql_safe_updates = 0;
    update product
    set product_code        = product_code_update,
        product_price       = product_price_update,
        product_name        = product_name_update,
        product_amount      =product_amount_update,
        product_description = product_description_update,
        product_status      = product_status_update
    where id = id_update;
    set sql_safe_updates = 1;
END
//
DELIMITER ;
call updateProduct(2, 'A', 500, 'samsung',
                   10, 'old', 1);
# Tạo store procedure xoá sản phẩm theo id
DELIMITER //

CREATE PROCEDURE deleteProduct(in id_delete int)

BEGIN
    set sql_safe_updates = 0;
    delete from product where id = id_delete;
    set sql_safe_updates = 1;
END //
DELIMITER ;

call deleteProduct(2);