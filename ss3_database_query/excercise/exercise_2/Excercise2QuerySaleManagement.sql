use ss2_exercise_sale_management_database;

insert into customer
(customer_name, customer_age)
values
("Minh Quan", 10),
("Ngoc Anh", 20),
("Hong Ha", 50);

insert into `order`
(customer_id,order_date)
values 
(1,"2006-03-21"),
(2,"2006-03-23"),
(1,"2006-03-16");

insert into product
(product_name,product_price)
values
("May Giat",3),
("Tu Lanh",5),
("Dieu Hoa",7),
("Quat",1),
("Bep Dien",2);

insert into order_detail
(order_id, product_id, order_quantity)
values
(1,1,3),
(1,3,7),
(1,4,2),
(2,1,1),
(3,1,8),
(2,5,4),
(2,3,3);

select order_id, order_date,order_total_price from `order`;

select c.customer_id, c.customer_name, p.product_id, p.product_name
from customer c
join `order` o on c.customer_id = o.customer_id
join order_detail od on o.order_id = od.order_id
join product p on p.product_id = od.product_id;

select c.customer_id, c.customer_name
from customer c
left join `order` o on c.customer_id = o.customer_id
where o.customer_id is null;

select o.order_id, o.order_date, sum(od. order_quantity*p.product_price) as total
from `order` o
join  order_detail od on o.order_id = od.order_id
join product p on od.product_id = p.product_id
group by o.order_id;