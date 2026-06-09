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

select * from student where marks>80;
select * from student where city = "mumbai";

 select * from student where marks+10> 90;
 
 select * 
from student
where marks > 80 and city = "mummbai"; 
select * from student where marks > 70 or city = "puna";
select * from student where marks between 70 and 90;

select * from student where city in ("puna","mumbaia");
select * from student where city not in ("puna");
select * from student where marks >75 limit 2;

select * from student order by city asc;
select * from student order by marks asc;
select * from student order by marks desc;