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

select * from student;

-- Aggregate functions - Aggregate function perform a calculation on a set of value, and return a single value.

select min(MARKS) from student;
select avg(marks) from student;
select count(rollno) from student;

select city from student group by city;
select city, count(rollno) from student group by city;
select city, name, count(rollno) from student group by city, name;

select city, avg(marks) from student group by city; 
select city, avg(marks) from student group by city order by city asc;

