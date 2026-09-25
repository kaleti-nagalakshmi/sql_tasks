CREATE DATABASE IF NOT EXISTS sql_training;
USE sql_training;
CREATE TABLE students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(100) NOT NULL,
    age INT,
    city VARCHAR(50),
    email VARCHAR(100),
    phone VARCHAR(15),
    course VARCHAR(50),
    batch VARCHAR(20),
    fees DECIMAL(10,2),
    attendance_percentage DECIMAL(5,2),
    assignment_score INT,
    experience_level VARCHAR(20),
    mode VARCHAR(20),
    enrollment_month CHAR(7),
    status VARCHAR(30)
);
select*from students;
select student_name,fees,fees+1000 as increase_fee from students;
select student_name,assignment_score+5 as increase_marks from students;

select student_name from students
where fees +2000 > 25000;

select student_name from students
where fees*0.9<30000;

select student_name,assignment_score+5 from students
where assignment_score+5 >80 ;

select student_name, attendance_percentage-5 from students
where attendance_percentage > 75 ;

-- 28. Display the names of students whose age is greater than 25.
select student_name from students
where age > 25 ;

-- Q34. Find all students who are older than 24 AND from Hyderabad.
select student_name,course from students
where course = "Python" or course = "SQL";

-- Q36. Find all students whose fees are greater than ₹30,000 AND attendance is above 85%.

select student_name ,fees,attendance_percentage from students
where fees > 30000 and attendance_percentage > 85;

select student_name ,city from students
where city = "Hyderabad" or city = "Bengaluru" or city = "Chennai" ;

--  Find all students who are younger than 23 AND enrolled in Data Analytics.
select student_name ,age,course from students
where age < 28 and course = " Data Analytics";

select student_name from students
where course = "Power BI";

select student_name,city,attendance_percentage ,fees from students
where (city = " Hyderabad" and fees > 30000) or attendance_percentage > 90;