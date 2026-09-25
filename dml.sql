create database students_details; 
use students_details;
create table student(
student_id INT,
student_name VARCHAR(100),
age INT,
city VARCHAR(50),
email VARCHAR(100),
course VARCHAR(50),
fees DECIMAL(10,2)
);
insert into student 
values(101,"Rahul",22,"Hyderabad","rahul@gmail.com","Data Science",45000),
(102,"Priya",22,"Vijayawada","priya@gmail.com","python",25000),
(103,"Arjun",21,"Visakhapatnam","arjun@gmail.com","Data Analytics",30000),
(104,"Arjun",23,"Hyderabad","sneha@gmail.com","Data Science",45000),
(105,"Kiran",25,"Bengaluru","kiran@gmail.com","Python",25000),
(106,"Ananya",22,"Chennai","ananya@gmail.com","Machine Learning",50000),
(107,"Rohit",26,"Hyderabad","rohit@gmail.com","Data Analytics",30000),
(108,"divya",23,"Pune","divya@gmail.com","Data Science",45000),
(109,"Varun",24,"Vijayawada","varun@gmail.com","Machine Learning ",50000),
(110,"Meghana",21,"Visakhapatnam","Meghana@gmail.com","Python ",25000);

update student
set city = "Bengaluru"
where student_name = "Rahul";

update student
set email = "priya.ds@gmail.com"
where student_name = "Priya";

update student
set fees = 48000
where course ="Data Science";

update student
set course = "Data Analytics"
where student_name = "Arjun ";

update student
set city = "Chennai " where student_name = "Sneha";
update student
set email = "sneha23@gmail.com" where student_name = "Snesha";

delete from student 
where student_id = 110;

delete from student 
where student_id = 105;

-- think and answer 
-- all students city will be changed to hyderabad
-- all records/rows are remove from students table but table structure remains 
-- who has pyrhon course thry wiil have fees changed to 50000.
-- who has taken python course.
--  Answer These in the Comments;
-- no,because identify uniquely by using their id's.
-- no,age cannot be negative .
-- yes, names should be not empty,we can use not null constrain.
-- no, each email should be unque .
-- we can use constraints to define rules and maintain data intigrity.

--















