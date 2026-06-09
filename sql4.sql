create database university;
use university;

create table student(
rollno int primary key,
name varchar(50),
parentsname varchar(50),
marks int not null,
grade varchar(1),
city varchar(30)
);

insert into student
(rollno,name,parentsname,marks,grade,city)
values
(101,"anil","piyush",35,"D","puna"),
(102,"bhumika","himnshu",89,"B","mumbai"),
(103,"akriti","anmol",56,"D","delhi"),
(104,"vicky","piyush",78,"C","puna");

select name, marks from student;
select distinct city from student;
select * from student;
select * from student where marks+10> 90;

select * from student where marks>80;
select * from student where city = "mumbai";

 -- Operators
 -- And (to check for both condition to be true)
 
 select * 
from student
where marks > 80 and city = "mummbai"; 

-- Or (to check for one of the condition to be true)
 
select * from student where marks > 70 or city = "puna";

-- Between (selects for a given range)

select * from student where marks between 70 and 90;

-- In (matches any value in the list)

select * from student where city in ("puna","mumbaia");

-- Not(to negate the given condition)

select * from student where city not in ("puma");

 -- Limit Clause (tuples)rowe to be returned
 
select * from student limit 3;
select * from student where marks >75 limit 2;

-- Order to sort in ascending or descending order

select * from student order by city asc;
select * from student order by marks asc;

select * from student order by marks desc ;
select * from student order by marks desc limit 3;
select marks from student;

-- Aggregate functions - Aggregate function perform a calculation on a set of value, and return a single value.

select min(MARKS) from student;
select avg(marks) from student;
select count(rollno) from student;

select city from student group by city;
select city, count(rollno) from student group by city;
select city, name, count(rollno) from student group by city, name;

select city, avg(marks) from student group by city; 
select city, avg(marks) from student group by city order by city asc;

