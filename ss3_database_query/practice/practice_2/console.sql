create database demo;
use demo;
drop table customer;
create table customer(
    id int auto_increment,
    full_name varchar(50),
    day_of_birth datetime,
    primary key (id)
);