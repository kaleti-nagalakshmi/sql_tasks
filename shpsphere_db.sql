CREATE DATABASE IF NOT EXISTS shopsphere_db;

USE shopsphere_db;

-- 1. ONLINE SALES

DROP TABLE IF EXISTS online_sales;

CREATE TABLE online_sales (
    sale_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    email VARCHAR(100),
    city VARCHAR(50),
    product VARCHAR(100),
    category VARCHAR(50),
    quantity INT,
    amount DECIMAL(10,2),
    order_date VARCHAR(20),
    discount DECIMAL(5,2),
    status VARCHAR(20)
);


INSERT INTO online_sales
(sale_id, customer_name, email, city, product, category,
 quantity, amount, order_date, discount, status)
VALUES

(101, 'Rahul Sharma', 'rahul@gmail.com', 'Hyderabad',
 'Laptop', 'Electronics', 1, 65000, '15-08-2026', 10, 'Delivered'),

(102, 'Priya Reddy', 'priya@gmail.com', 'Bengaluru',
 'Headphones', 'Electronics', 2, 5000, '18-08-2026', 5, 'Delivered'),

(103, 'Arjun Kumar', 'arjun@gmail.com', 'Chennai',
 'Office Chair', 'Furniture', 1, 8500, '20-08-2026', 0, 'Pending'),

(104, 'Sneha Rao', 'sneha@gmail.com', 'Hyderabad',
 'Keyboard', 'Electronics', 3, 4500, '22-08-2026', 8, 'Delivered'),

(105, 'Vikram Singh', 'vikram@gmail.com', 'Mumbai',
 'Monitor', 'Electronics', 2, 30000, '25-08-2026', 12, 'Cancelled'),

(106, 'Ananya Das', 'ananya@gmail.com', 'Delhi',
 'Desk', 'Furniture', 1, 12000, '27-08-2026', 5, 'Delivered'),

(107, 'Kiran Reddy', 'kiran@gmail.com', 'Hyderabad',
 'Mouse', 'Electronics', 4, 3200, '29-08-2026', 0, 'Delivered'),

(108, 'Meera Nair', 'meera@gmail.com', 'Kochi',
 'Backpack', 'Accessories', 2, 4000, '30-08-2026', 15, 'Pending');
select * from online_sales;




-- 2. STORE SALES


DROP TABLE IF EXISTS store_sales;

CREATE TABLE store_sales (
    sale_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    email VARCHAR(100),
    city VARCHAR(50),
    product VARCHAR(100),
    category VARCHAR(50),
    quantity INT,
    amount DECIMAL(10,2),
    order_date VARCHAR(20),
    discount DECIMAL(5,2),
    status VARCHAR(20)
);


INSERT INTO store_sales
(sale_id, customer_name, email, city, product, category,
 quantity, amount, order_date, discount, status)
VALUES

(201, 'Rahul Sharma', 'rahul@gmail.com', 'Hyderabad',
 'Laptop Bag', 'Accessories', 1, 2500, '16-08-2026', 5, 'Delivered'),

(202, 'Pooja Mehta', 'pooja@gmail.com', 'Pune',
 'Keyboard', 'Electronics', 2, 3000, '19-08-2026', 10, 'Delivered'),

(203, 'Arjun Kumar', 'arjun@gmail.com', 'Chennai',
 'Desk', 'Furniture', 1, 11000, '21-08-2026', 5, 'Delivered'),

(204, 'Rohan Verma', 'rohan@gmail.com', 'Mumbai',
 'Monitor', 'Electronics', 1, 16000, '23-08-2026', 8, 'Pending'),

(205, 'Sneha Rao', 'sneha@gmail.com', 'Hyderabad',
 'Mouse', 'Electronics', 2, 1800, '24-08-2026', 0, 'Delivered'),

(206, 'Neha Kapoor', 'neha@gmail.com', 'Delhi',
 'Office Chair', 'Furniture', 2, 17000, '26-08-2026', 10, 'Delivered'),

(207, 'Kiran Reddy', 'kiran@gmail.com', 'Hyderabad',
 'Headphones', 'Electronics', 1, 2800, '28-08-2026', 5, 'Cancelled'),

(208, 'Amit Joshi', 'amit@gmail.com', 'Pune',
 'Backpack', 'Accessories', 3, 6000, '31-08-2026', 12, 'Delivered');
 
-- part A union / union all
select customer_name   from online_sales
union 
select customer_name from store_sales ;
-- 2
select customer_name   from online_sales
union all
select customer_name from store_sales ;
-- 3
select product from online_sales
union 
select product from store_sales;
-- 4
select customer_name,city  from online_sales
union 
select  customer_name,city from store_sales;
-- 5
select customer_name  from online_sales
union 
select  customer_name from store_sales;




  
  
  -- part B -string functions 
select upper(customer_name ) from online_sales ;
select length(customer_name ) from online_sales ; 
select * from online_sales ;
select concat("",customer_name,email)from online_sales;
select concat_ws("  -  ",customer_name,email)from online_sales;
select concat_ws("  |  ",customer_name,city,category)from online_sales;
select substring(customer_name,1,4) from online_sales;
select left (customer_name,3) from online_sales;
select right(customer_name,4) from online_sales;
select left (product,5) from online_sales;
select trim(customer_name) from online_sales;
select replace(email,"@gmail.com","@shopsphere.com.") from online_sales;

-- date functions 
select str_to_date(order_date,"%d-%m-%y")from online_sales;
select date_format(str_to_date(order_date,"%d-%m-%y"),"%M %d %y")from online_sales;
select month(str_to_date(order_date,"%d-%m-%y"))from online_sales;
select year(str_to_date(order_date,"%d-%m-%y")) from online_sales;
select *from online_sales ;
select date(str_to_date(order_date,"%d-%m-%y"))from online_sales;
select monthname(str_to_date(order_date,"%d-%m-%y"))from online_sales;
select datediff("2026-6-1","2025-8-12") from online_sales ;
select order_date ,dayname(str_to_date(order_date,"%d-%m-%y")) 
as day_name from online_sales ;
select order_date ,curdate() from online_sales ;
select order_date ,now() from online_sales ;
select customer_name ,
date_format(str_to_date(order_date,"%d-%m-%y"),"%M")as month_name 
from online_sales  ;
-- 23
select count(*) as num_of_sales,
date_format(str_to_date(order_date,"%d-%m-%y"),"%M")as month_name 
from online_sales 
group by month_name ;

select * from online_sales
where month(str_to_date(order_date,"%d-%m-%Y")) =8 and
year(str_to_date(order_date,"%d-%m-%y")) =2026;

-- conditional functions 
select * from online_sales;
select if(amount> 20000 ,"yes","no") from online_sales;
select ifnull(customer_name ,"nodata")from online_sales;
select coalesce();
select if(amount >= 15000,"High Value","Regular") from online_sales ;
select if(quantity>= 3,"Bulk","Normal ") from online_sales ;
select amount-(amount*discount/100) as final_amount from online_sales;
select product,amount,discount,amount-(amount*discount/100) as final_amount from online_sales;
select product,avg(amount) from online_sales
group by product;
select product,round(avg(amount),2)avg_amount from online_sales
group by product;
select if(quantity % 2 = 0 ,"Even","Odd")from online_sales;
select quantity ,sqrt(quantity) from online_sales ;
select amount,abs(amount-10000) from online_sales;
select round(amount) from online_sales;

select * from online_sales;

-- Part F — MIX EVERYTHING
select customer_name ,product,city,amount from online_sales
union all
select customer_name ,product,city,amount from store_sales;

-- 37
select customer_name ,city from online_sales
where city = "Hyderabad"
union 
select customer_name ,city from store_sales
where city = "Hyderabad"
;
select upper(customer_name),lower(product),
monthname(str_to_date(order_date,"%d-%m-%y")),amount-(amount*discount/100)
 from  online_sales
union all
select upper(customer_name),lower(product),
monthname(str_to_date(order_date,"%d-%m-%y")),amount-(amount*discount/100)
 from  store_sales;
-- 38
select month_name ,sum(final_amount) as total_final_amount from 
(
select monthname(str_to_date(order_date,"%d-%m-%y")) as month_name ,
amount-(amount*discount/100)as final_amount from online_sales 
union all
select monthname(str_to_date(order_date,"%d-%m-%y")) as month_name ,
amount-(amount*discount/100)as final_amount from store_sales 
) as sales 
group by month_name ;


 -- 39
select city,sum( final_amount)from 
(
select  city,
amount-(amount*discount/100)as final_amount from online_sales 
union all
select  city,amount-(amount*discount/100)as final_amount from store_sales
) as sales 
group by city;

-- 40
select product ,sum(final_amount)as final_revenue from (
select product,sum(amount-(amount*discount/100))
as final_amount from online_sales 
group by product
union all
select product,sum(amount-(amount*discount/100))
as final_amount from store_sales 
group by product
)as sales 
group by product 
order by final_revenue desc limit 3;

--  Final Challenge
select * from (
select upper(customer_name),city,product,category,monthname(str_to_date(order_date,"%d-%m-%y"))
as month_name,
quantity,amount,discount,amount-(amount*discount/100)as final_amount ,
if (amount-(amount*discount/100) >= 15000,"High value","Regular")as sale_classification from online_sales
union all 
select upper(customer_name),city,product,category,monthname(str_to_date(order_date,"%d-%m-%y"))
as month_name,
quantity,amount,discount,amount-(amount*discount/100)as final_amount ,
if (amount-(amount*discount/100)>= 15000,"High value","Regular")as sale_classification from online_sales
) as sales_record;
 
 








