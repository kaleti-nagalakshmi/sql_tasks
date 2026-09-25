CREATE DATABASE IF NOT EXISTS food_delivery_db;
USE food_delivery_db;

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    city VARCHAR(50) NOT NULL,
    restaurant VARCHAR(100) NOT NULL,
    food_category VARCHAR(50) NOT NULL,
    order_value DECIMAL(10,2) NOT NULL,
    delivery_fee DECIMAL(10,2) NOT NULL,
    distance_km DECIMAL(5,2) NOT NULL,
    customer_age INT NOT NULL,
    delivery_time_min INT NOT NULL,
    restaurant_rating DECIMAL(2,1) NOT NULL,
    payment_method VARCHAR(30) NOT NULL,
    order_status VARCHAR(30) NOT NULL
);


-- part A 
-- Q1. select * from orders;
-- Q2 SELECT CUSTOMER_NAME,CITY,restaurant FROM ORDERS;
-- Q3 select restaurant,food_category,order_value from orders;
-- Q4 select customer_name,order_value,delivery_fee from orders;


-- Part B 
select * FROM ORDERS
WHERE CITY="HYDERABAD";

SELECT * FROM ORDERS
WHERE ORDER_VALUE>500;

SELECT * FROM ORDERS
WHERE DISTANCE_KM<5;

SELECT * FROM ORDERS
WHERE CUSTOMER_AGE>=25;

SELECT * FROM ORDERS
WHERE restaurant_rating<4;

SELECT * FROM ORDERS
WHERE ORDER_STATUS="DELIVERED";

SELECT * FROM ORDERS
WHERE ORDER_VALUE=300;

SELECT * FROM ORDERS
WHERE ORDER_VALUE!=300;

-- PART C 
SELECT CUSTOMER_NAME,order_value + delivery_fee AS total_amount FROM ORDERS;
select restaurant,order_value-(order_value*0.9 ) as increased_discount from orders;
select customer_name,order_value+50 as increased_value from orders;
select customer_name,Delivery_Fee div distance_km as delivery_cost_per_kilometre from orders;
select customer_name,order_value+100 as increased_value1 from orders;


-- part D 
-- Q18
select * from orders
where order_value>500 and distance_km<5; 
-- Q19
select customer_age, order_value,restaurant_rating from orders
where customer_age>25 and order_value>400 and  restaurant_rating>4.0;
-- Q20
select order_value,delivery_fee from orders
where order_value>800 or delivery_fee>50;
-- Q21 
select * from orders 
where city = "Hyderaba" or city = "Bengaluru " or city = "Chennai";
-- Q22
select * from orders 
where delivery_time_min > 40 and restaurant < 4.0;

-- Q23
select * from orders 
where order_value < 300 or distance_km < 4.0 or delivery_fee > 80;
-- Q24
select * from orders 
where customer_age and  order_status="Delivered" and order_value > 500;

-- Q25
select * from orders 
where food_category="Biryani" or  food_category="Biryani" and order_value > 400;

-- Q26
select * from orders 
where city != "Hyderabad" and restaurant_rating > 4.0;

-- Q27
select * from orders 
where(customer_age > 25 and  order_value > 700 )or  restaurant_rating > 4.5;

-- Q28
select * from orders 
where city = "Hyderabad" and  order_value > 500 and delivery_time_min <40 and restaurant_rating > 4.0;
-- Q29
select * from orders 
where(order_value > 500 and distance_km < 6) and (restaurant_rating > 4.5 or delivery_time_min < 30);
-- Q30
select * from orders 
where(customer_age > 25 and (city = "Hyderabad " or city = "Bengaluru")) and (order_value > 500 and delivery_time_min < 45);