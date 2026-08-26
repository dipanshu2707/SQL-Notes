create database Prestige_collage;
use Prestige_collage;

create table student(
rollno int primary key,
name varchar(50),
marks int not null,
grade varchar(3),
city varchar(30)
);

INSERT INTO student
(rollno, name, marks, grade, city)
VALUES
(106, "farhan", 88, "B", "Pune"),
(107, "geeta", 91, "A", "Mumbai"),
(108, "harish", 67, "C", "Delhi"),
(109, "isha", 99, "A+", "Chennai"),
(110, "jay", 54, "D", "Kolkata"),
(111, "kiran", 73, "C", "Pune"),
(112, "lavanya", 82, "B", "Hyderabad"),
(113, "manish", 95, "A", "Delhi"),
(114, "nisha", 45, "E", "Mumbai"),
(115, "omkar", 86, "B", "Pune"),
(116, "priya", 92, "A", "Chennai"),
(117, "rahul", 76, "C", "Delhi"),
(118, "sneha", 89, "B", "Hyderabad"),
(119, "tanya", 97, "A+", "Kolkata"),
(120, "vijay", 63, "D", "Mumbai"),
(121, "yash", 84, "B", "Delhi"),
(122, "zara", 90, "A", "Pune"),
(123, "arjun", 58, "D", "Chennai"),
(124, "deepa", 80, "B", "Hyderabad"),
(125, "rohit", 99, "A+", "Delhi"); 

select * from student;

alter table student add column age int;
alter table student add column age int not null default 20;

Alter table student drop column age;

Alter table student rename to children;

alter table children change column name new_NAME varchar(20);
select * from children;


-- Truncate (to delete table's data)

truncate table children;