CREATE DATABASE swiftpay_db;
USE swiftpay_db;
create table customers(
customer_id int primary key,
full_name varchar(50) not null,
email varchar(50) not null unique,
age int check(age>=18),
mobile varchar(50) not null unique,
account_status varchar(20) default "active",
wallet_balance decimal(10,2) default 0.00 check(wallet_balance >=0)
);
insert into customers(customer_id,full_name,email,age,mobile)
values(1,"ritika shah","ritika shah@mail.com",24,"9812345670");


-- Account_Status and  Wallet_Balance filled with their default values.--
-- 2. duplicate email
insert into customers values(2,"Karan Oberoi","ritika shah@mail.com",
25,"232483937","not active",47837);

-- unique  constraint rule

-- 3.duplicate mobile 
insert into customers values(3,"Karan","karan@mail.com",
25,"9812345670","active",20000); 
-- duplicate entry prevent the unique rule 
-- 4. underage applicant 
insert into customers values(3,"geetha","geetha@mail.com",
15,"9812345345","active",2000); 
-- check constraint 
-- 5.missing name 
insert into customers values(4,"na@mail.com",
20,"123445345","active",200); 
-- not null constraint prevent the duplicate values 

-- 6.negative balance 
insert into customers values(5,"anu","anu@mail.com",
20,"1234456345","active",-500.00);
--  check constraint prevent 
insert into customers(customer_id,full_name,email,age,mobile) 
values(7,"syam","shyam@gmail.com",27,"7782762749");
-- 1 mysql store the inserted values only
-- 2 because we give the default values to both colums by using default constraint 

-- part D:
-- beacuse each customer needs unique  identification number.
-- because email and mobile are to identifies the each cutomer.
-- beacuse below 18 years old customer not elible for resistration
-- wallet_balance represents the user spend if allow the negative balance it leads to overspend 
-- automatic values gives the default values to the customer table  
-- if customer not enter the balance. in that time table allow 
-- the insertion od customer data.






 


 