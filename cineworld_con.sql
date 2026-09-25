-- create database cineworld_db;
use cineworld_db;
create table theatres(
theatre_id int primary key,
theatre_name varchar(50) not null,
city varchar(50) not null,
no_screens int check(no_screens > 0)
);
insert into theatres values(1,"s2","nellore",3),(2,"mg","hyderabad",2),(3,"naga","macherla",1);
select*from theatres;
-- desc theatres;
-- select * from theatres;

create table movies(
movie_id int primary key,
movie_title varchar(50) not null,
genre varchar(30) not null,
duration int check(duration > 0),
movie_language varchar(50) not null
);
-- insert into movies values(1,"irumudi","emotional",2,"telugu"),(2,"peddi","emotional",3,"telugu"),
-- (3,"paradise","action",3,"telugu");
-- select * from movies;


create table shows(
show_id int primary key ,
movie_id int not null,
theatre_id int not null,
show_date date not null,
show_time time not null,
ticket_price decimal(5,2) check(ticket_price > 0),
constraint movie_details foreign key(movie_id) references movies(movie_id),
constraint theatre_details foreign key(theatre_id) references theatres(theatre_id)
);
-- insert into shows values(101,1,1,"2026-08-26","10:09:07",500.00),(102,2,2,"2026-06-16","12:09:07",200.00),
-- (103,3,3,"2026-02-13","02:09:07",600.00);
-- select *from shows;



create table customers(
customer_id int primary key,
customer_name varchar(50) not null,
email varchar(50) not null unique,
phone_number varchar(10) not null unique
);
-- insert into customers values(201,"naga","naga@gmail.com",1234567890),(202,"syam","syam@gmail.com",7702762749),
-- (203,"kranthi","kranthi",0987654321);
-- select*from customers;


create table bookings(
booking_id int primary key,
customer_id int not null,
show_id int not null,
no_of_seats int not null check(no_of_seats>0),
booking_date date default(current_date),
total_amount decimal(10,2) not null check(total_amount> 0),
constraint customer_details foreign key(customer_id) references customers(customer_id),
constraint show_details foreign key(show_id) references shows(show_id)

);
-- insert into bookings values(301,201,101,3,default,500.00),(302,202,102,4,default,700.00),
-- (303,203,103,2,default,800.00);
-- select * from bookings;




















show databases;
use cineworld_db;
show tables;

