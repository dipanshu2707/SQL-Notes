create database IIT_college;
use IIT_college;

create table student(
rollno int primary key,
name varchar(50),
marks int not null,
grade varchar(3),
city varchar(30)
);

create table dept (
 rollno INT PRIMARY KEY,
 name varchar(23)
);

insert into dept values
(102,"english"),
(103,"maths"),
(104,"sst");

 update dept set rollno = 103 where rollno = 110;
select * from dept;

create table teacher(
rollno int primary key,
name varchar(20),
dept_rollno int,
foreign key (dept_rollno) references dept(rollno)
On update cascade
On delete cascade
);


insert into teacher values
(102, "Adam",102),
(103, "Eve",103),
(104, "vinod",104);

select * from teacher;

update dept set rollno = 103 where rollno = 110;