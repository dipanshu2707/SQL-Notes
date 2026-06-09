create database xyz_company;
use xyz_company;

create table employee(
  id int primary key,
  name varchar(100),
  salary int
  );
INSERT INTO employee 
(id,name,salary)
values
(1,"himanshu",35000),
(2,"ramu",49000),
(3,"arpit",28000);

INSERT INTO employee 
(id,name,salary)
values
(4,"shubhem",52000);


select * from employee;

create table temp(
  id int unique 
  );
  
insert into temp value (101);   
insert into temp value (101);
select * from temp;

create table emp(
  id int,
  salary int default 30000);
  
insert into emp (id) values (123);
select * from emp;


