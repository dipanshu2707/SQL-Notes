create database college; 

use college;
create table student(
  id int primary key,
  name varchar(50),
  age int not null

);
INSERT INTO student VALUES(1,"VICKY",23);
INSERT INTO student VALUES(2,"PIYUSH",22);
INSERT INTO student VALUES(3,"SAMMAAN",21);
INSERT INTO student VALUES(4,"ANMOL",25);
INSERT INTO student VALUES(5,"MANILAL",22);
INSERT INTO student VALUES(6,"AMIT",19);
insert into student values(7,"Aimam",27);
SELECT * FROM student;

