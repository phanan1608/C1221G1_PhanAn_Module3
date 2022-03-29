drop database ss2_exercise_sale_management_database;
create database ss2_exercise_sale_management_database;
use ss2_exercise_sale_management_database;
create table customer(
		customer_id int auto_increment,
        customer_name varchar(50),
        customer_age int,
        primary key (customer_id)
);
create table `order`(
		order_id int auto_increment,
        customer_id int,
        order_date datetime,
        order_total_price double,
        primary key (order_id),
        foreign key (customer_id) references customer(customer_id)
);
create table product(
		product_id int auto_increment,
        product_name varchar(50),
        product_price double,
        primary key (product_id)
);
create table order_detail(
		order_id int,
        product_id int,
        order_quantity int,
        primary key(order_id,product_id),
        foreign key (order_id) references `order`(order_id),
        foreign key (product_id) references product(product_id)        
);
