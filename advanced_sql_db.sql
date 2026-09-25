drop DATABASE advanced_sql_db;


CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50),
    department VARCHAR(30),
    job_role VARCHAR(50),
    salary INT,
    joining_date DATE,
    city VARCHAR(30),
    performance_score DECIMAL(3,1)
);


INSERT INTO employees
(employee_id, employee_name, department, job_role, salary, joining_date, city, performance_score)
VALUES
(1, 'Rahul Sharma', 'IT', 'Data Analyst', 72000, '2022-04-15', 'Hyderabad', 8.7),
(2, 'Priya Reddy', 'HR', 'HR Executive', 55000, '2021-07-20', 'Bengaluru', 8.2),
(3, 'Arjun Kumar', 'IT', 'Software Engineer', 90000, '2020-02-10', 'Chennai', 9.1),
(4, 'Sneha Rao', 'Sales', 'Sales Executive', 65000, '2023-01-12', 'Hyderabad', 7.9),
(5, 'Karan Singh', 'IT', 'Data Engineer', 82000, '2021-11-05', 'Pune', 8.9),
(6, 'Ananya Das', 'Finance', 'Financial Analyst', 68000, '2022-08-18', 'Delhi', 8.4),
(7, 'Vikram Patel', 'Sales', 'Sales Manager', 95000, '2019-06-25', 'Mumbai', 9.0),
(8, 'Meera Nair', 'HR', 'Recruiter', 60000, '2023-03-14', 'Kochi', 8.0),
(9, 'Rohan Verma', 'IT', 'Software Engineer', 90000, '2022-01-28', 'Hyderabad', 8.8),
(10, 'Pooja Shah', 'Finance', 'Accountant', 58000, '2021-09-09', 'Mumbai', 7.8),
(11, 'Aditya Rao', 'IT', 'DevOps Engineer', 85000, '2020-12-11', 'Bengaluru', 9.2),
(12, 'Neha Kapoor', 'Sales', 'Sales Executive', 65000, '2024-02-19', 'Delhi', 8.1),
(13, 'Kiran Reddy', 'Finance', 'Finance Manager', 88000, '2019-10-21', 'Hyderabad', 9.0),
(14, 'Ishita Menon', 'HR', 'HR Manager', 78000, '2020-05-16', 'Chennai', 8.9),
(15, 'Sahil Gupta', 'IT', 'QA Engineer', 70000, '2023-06-07', 'Pune', 8.3),
(16, 'Kavya Iyer', 'Marketing', 'Marketing Executive', 62000, '2022-10-03', 'Bengaluru', 8.5),
(17, 'Manish Joshi', 'Marketing', 'Marketing Manager', 84000, '2020-08-27', 'Mumbai', 9.1),
(18, 'Tanya Bose', 'Marketing', 'Content Strategist', 62000, '2024-01-15', 'Kolkata', 8.0),
(19, 'Nikhil Das', 'IT', 'Data Analyst', 72000, '2024-04-22', 'Delhi', 8.6),
(20, 'Sara Khan', 'Finance', 'Financial Analyst', 68000, '2023-09-12', 'Pune', 8.7);

select employee_name ,salary, avg(salary) over() as company_avg_salary
  from employees;
  
select employee_name ,department,salary,avg(salary)
over(partition by department)as dept_avg_salary ,
avg(salary)over(partition by department)-salary as difference  
from employees;
-- 3
select employee_name,salary ,rank() over(order by  salary desc ) 
ranks from employees;

-- 4
select employee_name ,department,salary ,rank() 
over(partition by department order by salary)as dept_rank
 from employees ;
 
-- 5 
select employee_name ,salary,joining_date, lag(salary)
 over(order by joining_date) as previous_salary from employees ;
-- 6
select employee_name ,department,salary , 
avg(salary) over(partition by department ) as avg_dept_salary, 
rank() over(partition by department order by salary desc) as ranks 
from employees ;

-- 7 
select* from(
select employee_name ,salary,
avg(salary) over(partition by department ) as dept_avg_salary
from employees
)as employees
where salary > dept_avg_salary;
-- 8
select * from (
select department,count(*)as num_emp,avg(salary)as avg_salary,
max(salary) as max_salary
 from employees
 group by department
 ) as tab 
;
-- 9 
select employee_name ,department,salary, 
rank()over(partition by department  order by salary desc) from employees 
;
select * from (
select employee_name ,department,salary, 
rank()over(partition by department  order by salary desc )as salary_rank  from employees 
) as top_3 
where salary_rank <=3;

-- 10
select employee_name ,salary,company_avg_salary ,
salary-company_avg_salary as difference from(
select employee_name ,salary , avg(salary)over()as company_avg_salary
 from employees)as high_sal
where salary > company_avg_salary
;

-- 11
create view employee_salary_details as (
select employee_name,department,job_role ,salary ,city from employees
);
select * from employee_salary_details ;

select employee_name ,salary from employee_salary_details 
where salary > 75000
order by salary desc ;

-- 13
drop view if exists department_salary_summary;
create view department_salary_summary as 
select department,count(*)as employee_count ,
avg(salary)as average_salary,min(salary) as min_salary ,
max(salary)as max_salary 
from employees
group by department ;
select * from department_salary_summary;
-- 14 
select department from department_salary_summary 
where average_salary > 70000;

-- 15
drop view if exists avg_salary_dept;
create view avg_salary_dept as 
select employee_name ,department,salary ,
avg(salary) over(partition by department) 
 as dept , rank()over(partition by department order by salary desc) 
 as dept_rank
from employees ;
select * from avg_salary_dept;

-- 16
select employee_name,dept_rank from avg_salary_dept
where dept_rank = 1 ;

-- 17
delimiter // 
create procedure  show_all_employees()
begin
select * from employees ;
end //
delimiter ;
call show_all_employees;
-- 18
delimiter // 
create procedure  show_all_employees_1(in epartment varchar(50))
begin
select * from employees
where department= "IT" ;
end //
delimiter ;
call show_all_employees_1("IT");


-- 19
delimiter // 
create procedure  show_employes_by (in city varchar(50))
begin
select employee_name from employees
where city = 'Hyderabad';
end //
delimiter ;
call show_employes_by("Hyderabad");

delimiter //
create procedure num_of_emp(in department_emp varchar(20),out emp_count int)
begin 
select count(*)as num_of_emp_dept from employees
where department = department_emp ;
end //
delimiter ;
call num_of_emp("IT",@total);


delimiter //
create procedure update_salary(inout increase_salary decimal(10,2))
begin
set increase_salary = increase_salary + 5000;
end //
delimiter ;
set @salary = 90000;
call update_salary(@salary);
select @salary;




















 









