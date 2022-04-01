# Tạo View
CREATE VIEW customer_views AS

SELECT customerNumber, customerName, phone

FROM  customers;

select * from customer_views;

# Thay đổi /cập nhật View
CREATE OR REPLACE VIEW customer_views AS

SELECT customerNumber, customerName, contactFirstName, contactLastName, phone

FROM customers

WHERE city = 'Nantes';

select * from customer_views;

# Xoá View
DROP VIEW customer_views;
