CREATE DATABASE IF NOT EXISTS techmart_db;
USE techmart_db;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    city VARCHAR(50),
    phone VARCHAR(15)
);

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(100) NOT NULL,
    department VARCHAR(50),
    manager_id INT,
    CONSTRAINT fk_employee_manager FOREIGN KEY (manager_id)
        REFERENCES employees(employee_id)
);

CREATE TABLE categories (
    category_id INT PRIMARY KEY,
    category_name VARCHAR(50) UNIQUE NOT NULL
);

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category_id INT NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    brand VARCHAR(50),
    stock_quantity INT,
    CONSTRAINT fk_product_category FOREIGN KEY (category_id)
        REFERENCES categories(category_id)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT NOT NULL,
    employee_id INT NOT NULL,
    order_date DATE NOT NULL,
    order_status VARCHAR(20) NOT NULL,
    payment_method VARCHAR(30) NOT NULL,
    CONSTRAINT fk_order_customer FOREIGN KEY (customer_id)
        REFERENCES customers(customer_id),
    CONSTRAINT fk_order_employee FOREIGN KEY (employee_id)
        REFERENCES employees(employee_id)
);

CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL,
    CONSTRAINT fk_item_order FOREIGN KEY (order_id)
        REFERENCES orders(order_id),
    CONSTRAINT fk_item_product FOREIGN KEY (product_id)
        REFERENCES products(product_id)
);
set foreign_key_checks = 0;

select c.customer_name ,c.city,o.order_id
 from customers as c
inner join orders as o
on c.customer_id = o.customer_id
where city = "Hyderabad";

select c.customer_name ,sum(unit_price*quantity) as total_spent from customers as c
join orders as o on c.customer_id =o.customer_id 
join order_items as oi on o.order_id =oi.order_id 
group by c.customer_name ;

 select * from customers ;
 
 select c.customer_name ,o.order_id 
 from  orders o
 right  join customers c 
 on c.customer_id = o.customer_id 
where o.order_id  is null;


select e.employee_name ,m.employee_name
 from employees e
join employees m 
on e.manager_id = m.employee_id;

select * from employees as e
join employees as m 
on e.manager_id = m.employee_id;

select*from employees;

select E.EMPLOYEE_NAME AS EMPLOYEE_NAME,M.EMPLOYEE_NAME AS MANAGER_NAME
from Employees E left join Employees M
on E.MANAGER_ID = M.EMPLOYEE_ID;

SELECT E.EMPLOYEE_NAME AND E.EMPLOYEE_NAME  FROM EMPLOYEES AS E 
LEFT JOIN EMPLOYEES AS M
ON E.MANAGER_ID=M.EMPLOYEE_ID;


SELECT * FROM EMPLOYEES;

SELECT CUSTOMER_NAME ,CITY FROM CUSTOMERS 
WHERE CITY = "HYDERABAD";

SELECT A.CUSTOMER_NAME ,O.ORDER_DATE ,
O.ORDER_STATUS
FROM CUSTOMERS AS A
LEFT JOIN ORDERS AS O
ON A.CUSTOMER_ID = O.CUSTOMER_ID;
 
SELECT * 
FROM CUSTOMERS C 
LEFT JOIN ORDERS O
ON C.CUSTOMER_ID = O.CUSTOMER_ID
WHERE O.CUSTOMER_ID IS NOT NULL;

SELECT *
FROM CUSTOMERS C
LEFT JOIN ORDERS O
ON C.CUSTOMER_ID = O.CUSTOMER_ID
WHERE PAYMENT_METHOD IN ("UPI","CREDIT CARD") ;

SELECT * 
FROM PRODUCTS 
WHERE PRICE > 5000 AND PRICE < 20000 ;
-- ORDER BY PRICE DESC;
SELECT * FROM PRODUCTS;


SELECT C.CUSTOMER_NAME ,C.CUSTOMER_ID ,COUNT(*) 
AS NUM_OF_ORDERS
FROM CUSTOMERS C 
LEFT JOIN ORDERS O
ON C.CUSTOMER_ID = O.CUSTOMER_ID
group by C.CUSTOMER_ID ;


SELECT C.CUSTOMER_NAME,O.ORDER_ID
FROM CUSTOMERS C 
LEFT JOIN ORDERS O
ON C.CUSTOMER_ID = O.CUSTOMER_ID;


SELECT C.CUSTOMER_NAME,O.ORDER_ID
FROM CUSTOMERS C 
LEFT JOIN ORDERS O
ON C.CUSTOMER_ID = O.CUSTOMER_ID
WHERE O.CUSTOMER_ID IS NULL;

-- 9 
SELECT O.ORDER_ID,C.CUSTOMER_NAME,E.EMPLOYEE_NAME 
FROM ORDERS O
LEFT JOIN CUSTOMERS C 
ON C.CUSTOMER_ID = O.CUSTOMER_ID
JOIN EMPLOYEES E
ON E.EMPLOYEE_ID = O.EMPLOYEE_ID;

-- 10
select  P.product_name,CG.CATEGORY_NAME,P.BRAND,P.PRICE
FROM PRODUCTS P 
LEFT JOIN CATEGORIES CG
ON P.CATEGORY_ID  = CG.CATEGORY_ID;
-- 11
SELECT P.PRODUCT_NAME,SUM(QUANTITY) AS TOTAL_QUANTITY
FROM PRODUCTS AS P
LEFT JOIN ORDER_ITEMS AS OI
ON P.PRODUCT_ID = OI.PRODUCT_ID 
group by PRODUCT_NAME;

-- 12
SELECT P.PRODUCT_NAME,SUM(QUANTITY*UNIT_PRICE)
 AS TOTAL_REVENUE
FROM PRODUCTS AS P
LEFT JOIN ORDER_ITEMS AS OI
ON P.PRODUCT_ID = OI.PRODUCT_ID 
group by PRODUCT_NAME;

-- 13
SELECT P.PRODUCT_NAME,SUM(QUANTITY*UNIT_PRICE) 
 AS TOTAL_REVENUE
FROM PRODUCTS AS P
LEFT JOIN ORDER_ITEMS AS OI
ON P.PRODUCT_ID = OI.PRODUCT_ID 
group by PRODUCT_NAME
ORDER BY TOTAL_REVENUE DESC
LIMIT 5;

-- 14
SELECT C.CUSTOMER_NAME, SUM(QUANTITY*UNIT_PRICE) 
AS TOTAL_AMOUNT
FROM CUSTOMERS C
LEFT JOIN ORDERS O
ON C.CUSTOMER_ID=O.CUSTOMER_ID
JOIN ORDER_ITEMS OI
ON O.ORDER_ID =  OI.ORDER_ID
group by C.CUSTOMER_NAME ;

-- 15
SELECT C.CUSTOMER_NAME, SUM(QUANTITY*UNIT_PRICE) 
AS TOTAL_AMOUNT
FROM CUSTOMERS C
LEFT JOIN ORDERS O
ON C.CUSTOMER_ID=O.CUSTOMER_ID
JOIN ORDER_ITEMS OI
ON O.ORDER_ID =  OI.ORDER_ID
group by C.CUSTOMER_NAME 
order by TOTAL_AMOUNT
LIMIT 5;

-- 16
SELECT C.CUSTOMER_NAME, SUM(QUANTITY*UNIT_PRICE) 
AS TOTAL_AMOUNT
FROM CUSTOMERS C
LEFT JOIN ORDERS O
ON C.CUSTOMER_ID=O.CUSTOMER_ID
JOIN ORDER_ITEMS OI
ON O.ORDER_ID =  OI.ORDER_ID
group by C.CUSTOMER_NAME 
HAVING TOTAL_AMOUNT > 30000;
-- 17
SELECT C.CATEGORY_NAME,C.CATEGORY_ID, SUM(QUANTITY*UNIT_PRICE) AS TOTAL_AMOUNT
FROM CATEGORIES C
LEFT JOIN PRODUCTS P
ON C.CATEGORY_ID = P.CATEGORY_ID 
JOIN ORDER_ITEMS OI
ON P.PRODUCT_ID = OI.PRODUCT_ID 
GROUP BY C.CATEGORY_NAME ;


-- 17
SELECT C.CATEGORY_NAME,C.CATEGORY_ID, SUM(QUANTITY*UNIT_PRICE)
 AS TOTAL_AMOUNT
FROM CATEGORIES C
LEFT JOIN PRODUCTS P
ON C.CATEGORY_ID = P.CATEGORY_ID 
JOIN ORDER_ITEMS OI
ON P.PRODUCT_ID = OI.PRODUCT_ID 
GROUP BY C.CATEGORY_NAME 
HAVING TOTAL_AMOUNT > 50000
order by TOTAL_AMOUNT DESC;

-- 19
SELECT EMPLOYEE_NAME ,COUNT(*) AS NUM_OF_ORDERS
FROM EMPLOYEES E
LEFT JOIN ORDERS O
ON E.EMPLOYEE_ID = O.EMPLOYEE_ID 
GROUP BY EMPLOYEE_NAME;

-- 20
SELECT EMPLOYEE_NAME ,COUNT(*) AS NUM_OF_ORDERS
FROM EMPLOYEES E
LEFT JOIN ORDERS O
ON E.EMPLOYEE_ID = O.EMPLOYEE_ID 
GROUP BY EMPLOYEE_NAME
HAVING NUM_OF_ORDERS > 3;

-- 21
SELECT COUNT(*) NUM_OF_ORDER, AVG(QUANTITY*UNIT_PRICE) 
AS AVG_AMOUNT
FROM CUSTOMERS C
LEFT JOIN ORDERS O
ON C.CUSTOMER_ID = O.CUSTOMER_ID 
JOIN ORDER_ITEMS OI
ON O.ORDER_ID = OI.ORDER_ID 
GROUP BY CUSTOMER_NAME;

-- 22
SELECT COUNT(*) NUM_OF_ORDER, AVG(QUANTITY*UNIT_PRICE) 
AS AVG_AMOUNT
FROM CUSTOMERS C
LEFT JOIN ORDERS O
ON C.CUSTOMER_ID = O.CUSTOMER_ID 
JOIN ORDER_ITEMS OI
ON O.ORDER_ID = OI.ORDER_ID 
GROUP BY CUSTOMER_NAME
HAVING AVG_AMOUNT > 15000;

-- 23
SELECT ORDER_STATUS ,COUNT(*) AS NUM_OF_ORDERS
FROM ORDERS 
group by ORDER_STATUS;

-- 24
SELECT CG.CATEGORY_NAME,ORDER_STATUS ,COUNT(*) 
AS NUM_OF_ORDERS, SUM(QUANTITY*UNIT_PRICE) AS TOTAL_REVENUE
FROM ORDERS O
LEFT JOIN ORDER_ITEMS OI
ON O.ORDER_ID = OI.ORDER_ID 
JOIN PRODUCTS P
ON OI.PRODUCT_ID = P.PRODUCT_ID
JOIN CATEGORIES CG
ON P.CATEGORY_ID = CG.CATEGORY_ID 
WHERE O.ORDER_STATUS = "DELIVERED"
group by CG.CATEGORY_NAME;

-- 25 
SELECT CG.CATEGORY_NAME,ORDER_STATUS ,COUNT(*) 
AS NUM_OF_ORDERS, SUM(QUANTITY*UNIT_PRICE) AS TOTAL_REVENUE
FROM ORDERS O
LEFT JOIN ORDER_ITEMS OI
ON O.ORDER_ID = OI.ORDER_ID 
JOIN PRODUCTS P
ON OI.PRODUCT_ID = P.PRODUCT_ID
JOIN CATEGORIES CG
ON P.CATEGORY_ID = CG.CATEGORY_ID 
WHERE O.ORDER_STATUS = "DELIVERED"
group by CG.CATEGORY_NAME
ORDER BY TOTAL;

SELECT * FROM PRODUCTS 
WHERE PRODUCT_NAME = "";

SELECT * FROM CATEGORIES;

-- 26
SELECT PRODUCT_NAME ,PRICE ,
CASE 
WHEN PRICE > 15000 THEN "PREMIUM"
WHEN PRICE  < 5000 THEN "BUDGET"
WHEN PRICE BETWEEN 5000 AND 15000 THEN "STANDARD"

END AS CATEGORIZED_PRODUCTS FROM PRODUCTS ;

-- 27 
SELECT COUNT(*)AS NUM_OF_PRODUCTS ,
CASE 
WHEN PRICE > 15000 THEN "PREMIUM"
WHEN PRICE  < 5000 THEN "BUDGET"
WHEN PRICE BETWEEN 5000 AND 15000 THEN "STANDARD"

END AS CATEGORIZED_PRODUCTS 
FROM PRODUCTS 
GROUP BY CATEGORIZED_PRODUCTS;

-- 28
SELECT E.EMPLOYEE_NAME ,M.EMPLOYEE_NAME AS MANAGER_NAME 
FROM EMPLOYEES E
LEFT JOIN EMPLOYEES M
ON E.MANAGER_ID = M.EMPLOYEE_ID ;
-- 29
SELECT  E.EMPLOYEE_NAME,M.EMPLOYEE_NAME AS MANAGER_NAME  
FROM EMPLOYEES E
LEFT JOIN EMPLOYEES M
ON E.MANAGER_ID = M.EMPLOYEE_ID 
WHERE E.MANAGER_ID IS NULL;

-- 30 
SELECT C.CITY,COUNT(*) AS NUM_OF_CUSTOMERS 
FROM CUSTOMERS C
LEFT JOIN ORDERS O
ON C.CUSTOMER_ID = O.CUSTOMER_ID 
WHERE ORDER_ID IS NOT NULL
group by C.CITY
HAVING NUM_OF_CUSTOMERS > 2;

-- 31
SELECT C.CUSTOMER_NAME ,O.ORDER_STATUS,SUM(QUANTITY*UNIT_PRICE) AS TOTAL_AMOUNT 
FROM CUSTOMERS C
LEFT JOIN ORDERS O 
ON C.CUSTOMER_ID = O.CUSTOMER_ID 
LEFT JOIN ORDER_ITEMS OI
ON O.ORDER_ID = OI.ORDER_ID
WHERE  ORDER_STATUS = "DELIVERED"
GROUP BY CUSTOMER_NAME
HAVING TOTAL_AMOUNT > 20000
ORDER BY TOTAL_AMOUNT DESC
LIMIT 3;

-- 32
select category_name , sum(quantity*unit_price) as total_revenue
from products p
left join categories c
on p.category_id = c.category_id
left join order_items oi
on p.product_id = oi.product_id 
where price > 5000
group by category_name 
order by total_revenue desc
limit 3;

-- 33
select e.employee_name ,count(*) as num_of_orders 
from employees e
inner join  orders o
on e.employee_id = o.employee_id
group by employee_name 
having  num_of_orders > 2;

-- 34
select c.customer_name ,count(*) as num_of_orders ,sum(quantity)
 as total_quantity,sum(quantity*unit_price) as total_spending 
from customers c
left join orders o
on c.customer_id = o.customer_id
join order_items oi
on  o.order_id = oi.order_id 
group by customer_name
order by  total_spending desc;
-- 35
select  c.customer_name ,count(* )as num_of_orders,
sum(quantity*unit_price)as total_spending 
from customers c
left join orders o
on c.customer_id = o.customer_id
join order_items oi
on  o.order_id = oi.order_id 
join products p
on oi.product_id =p.product_id 
join categories cg
on p.category_id = cg.category_id 
where order_status = "Delivered"
group by customer_name
having num_of_orders > 2 and count(distinct cg.category_id) =3
order by total_spending desc
limit 3;







-- subquerries
-- select * from products
-- where price > (select round(avg(price))from products);


-- select* from products 
-- where price = (select max(price) from products);
-- select *from 
-- customers c join 
-- orders o on c.customer_id = o.customer_id
-- where c.city = "Hyderabad";

-- select customer_id  from customers 
-- where city = "Hyderabad";

-- select *from orders 
-- where customer_id in (select customer_id  from customers 
-- where city = "Hyderabad");


-- select customer_id from customers 
-- where city = "Hyderabad" or city = "Bengaluru"; 


-- select *from orders 
-- where customer_id in (select customer_id  from customers 
-- where city in ( "Hyderabad" ,"Benguluru"));

-- select *from orders 
-- where customer_id in (select customer_id  from customers 
-- where city in ( "Hyderabad" ,"Benguluru"));


--  select customer_name  from customers 
-- where customer_id not in (select customer_id from orders );


-- select customer_name from customers 
-- where customer_id in (select customer_id from oredes );

-- select category_id from categories 
-- where category_name = "accessories";

-- select price from products 
-- where category_id = (select category_id from categories 
-- where category_name = "accessories");

-- select *from products 
-- where price > any(select price from products 
-- where category_id = (select category_id from categories 
-- where category_name = "accessories"));

-- select category_name from categories ;

-- select category_id from categories 
-- where category_name = "Smart Watches";

-- select * from products 
-- where category_id = (select category_id from categories 
-- where category_name = "Smart Watches");

-- select * from  products 
-- where price < all(select * from products 
-- where category_id = (select category_id from categories where category_name = "Smart Watches"));

-- select avg(price) from products 
-- where category_id = 2;

-- select *from  products p1
-- where price > (select avg (price) from products p2
-- where p2.category_id = p1.category_id);

-- select c.category_name ,product_name ,p.price 
-- from products p 
-- join categories c on p.category_id = c.category_id
-- where price = (select max(price) from products p2
-- where p2.category_id = p.category_id );
-- -- 12
-- use shopsphere_db;
-- select * from store_sales;
-- -- 
-- select customer_name ,city,product,amount  - (amount * discount/100) 
-- as final_amount from store_sales 
-- union all
-- select customer_name ,city,product,amount  - (amount * discount/100) 
-- as final_amount from store_sales ;

-- -- 13 
-- select city, sum(final_amount)from (
-- select customer_name ,city,product,amount  - (amount * discount/100) 
-- as final_amount from store_sales 
-- union all
-- select customer_name ,city,product,amount  - (amount * discount/100) 
-- as final_amount from store_sales )as combined_data 
-- group by city






