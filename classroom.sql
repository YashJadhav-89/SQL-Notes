CREATE DATABASE temp1;

create database temp2;
DROP DATABASE temp1;
DROP DATABASE temp2;
DROP DATABASE IF EXISTS company;

CREATE DATABASE collage;
CREATE DATABASE IF NOT EXISTS collage;
USE collage;

CREATE TABLE student
(
   id INT PRIMARY KEY,
   name VARCHAR(50),
   age INT NOT NULL
);

INSERT INTO student VALUES(1,"yash",20);
INSERT INTO student VALUES(2,"sumit",24);

SELECT * FROM student;

SHOW DATABASES;

SHOW TABLES;

DROP TABLE student;

CREATE TABLE student(
rollno INT PRIMARY KEY,
name VARCHAR(50)
);


SELECT * FROM student;

INSERT INTO student
(rollno,name)
VALUES
(101,"YASH"),
(102,"ROHAN"),
(103,"SAHIL");



CREATE DATABASE xyz_company;
USE xyz_company;

CREATE TABLE employee(
 id INT PRIMARY KEY,
 name VARCHAR(100),
 salary INT
);




CREATE DATABASE example1;
USE example1;


INSERT INTO employee
(id,name,salary)
VALUES
(1,"yash",1000),
(2,"sumit",2000),
(3,"vinit",3000);


SELECT * FROM employee;

CREATE TABLE temp3
(
id INT,
name VARCHAR(50),
age INT,
city VARCHAR(60),
PRIMARY KEY(id,name)
);

CREATE TABLE emp
(
 id INT,
 salary INT DEFAULT 25000);
 
 INSERT INTO emp (id) VALUES(101);
 
 SELECT * FROM emp;
 
 
 
 
 
 CREATE DATABASE school1;
 USE school1;
 
 CREATE TABLE student(
 rollno INT PRIMARY KEY,
 name VARCHAR(40),
 marks INT NOT NULL,
 grade VARCHAR(1),
 city VARCHAR(34)
 );
 
 
 INSERT INTO student 
 (rollno,name,marks,grade,city)
 VALUES
 (101,"yash",100,"A","Latur"),
 (102,"sumit",101,"B","Satara"),
 (103,"mohit",99,"C","Nashik");



SELECT * FROM student WHERE CITY="Latur";
SELECT * FROM student WHERE marks>80 LIMIT 3;

SELECT * FROM student ORDER BY marks ASC;
SELECT * FROM student ORDER BY marks DESC;


SELECT MAX(marks) FROM student;
SELECT MIN(marks) FROM student;
SELECT AVG(marks) FROM student;
SELECT COUNT(rollno) FROM student;

SELECT city, COUNT(rollno) FROM student GROUP BY city;
SELECT city, COUNT(rollno) FROM student GROUP BY city HAVING MAX(marks)>90;

SET SQL_SAFE_UPDATES = 0;
UPDATE student SET grade="O" WHERE grade="A";

UPDATE student SET marks = marks+1;
SELECT * FROM student;

DELETE FROM student WHERE marks=100;
SELECT * FROM student;

USE collage;
DELETE FROM student WHERE marks=101;

CREATE DATABASE foreignkey;
USE foreignkey;
CREATE TABLE dept(
id INT PRIMARY KEY,
name VARCHAR(50)
);

INSERT INTO dept
VALUES
(1,"yash"),
(2,"sumit"),
(3,"vinit");

SELECT * FROM dept;

UPDATE dept
SET id=4
WHERE id=2;

CREATE TABLE teacher(
id INT PRIMARY KEY,
name VARCHAR(60),
dept_id INT,
FOREIGN KEY (dept_id) REFERENCES dept(id)
ON UPDATE CASCADE
ON DELETE CASCADE
);

DROP TABLE teacher;

INSERT INTO teacher
VALUES
(1,"Adam",1),
(2,"Eve",2);

SELECT * FROM teacher1;

ALTER TABLE teacher
ADD COLUMN age INT NOT NULL DEFAULT 19;

ALTER TABLE teacher
CHANGE age stud_age INT;

ALTER TABLE teacher
MODIFY COLUMN age VARCHAR(20);

ALTER TABLE teacher
RENAME TO teacher1;







CREATE DATABASE joins;
USE joins;

CREATE TABLE student(
id INT PRIMARY KEY,
name VARCHAR(40),
age INT);

INSERT INTO student
VALUES
(101,"yash",20),
(102,"sumit",22),
(103,"vinit",23);


UPDATE student
SET id=1
WHERE id=101;

UPDATE student
SET id=2
WHERE id=102;

UPDATE student
SET id=3
WHERE id=103;

CREATE TABLE course(
id INT PRIMARY KEY,
course VARCHAR(30));


INSERT INTO course
VALUES
(1,"hindi"),
(2,"marathi"),
(3,"english"),
(4,"bio");

SELECT * FROM student INNER JOIN course ON
student.id=course.id;


SELECT * FROM student LEFT JOIN course ON
student.id=course.id;

SELECT * FROM student RIGHT JOIN course ON
student.id=course.id;


SELECT * FROM student LEFT JOIN course ON
student.id=course.id
UNION
SELECT * FROM student RIGHT JOIN course ON
student.id=course.id;


SELECT * FROM student RIGHT JOIN course ON
student.id=course.id
WHERE student.id IS NULL;


CREATE TABLE employee
(id INT PRIMARY KEY,
name VARCHAR(50),
manager_id INT);


INSERT INTO employee
VALUES
(101,"yash",103),
(102,"sumit",104),
(103,"vinit",null),
(104,"mohit",104);



SELECT *
FROM employee as a
JOIN employee as b
ON a.id = b.manager_id;


SELECT a.name as manager_name,b.name
FROM employee as a
JOIN employee as b
ON a.id = b.manager_id;


SELECT * FROM employee
UNION 
SELECT * FROM employee;


SELECT name,marks FROM student WHERE marks > (SELECT AVG(marks) FROM student);

SELECT MAX(marks) FROM (SELECT * FROM student WHERE city="delhi") AS temp;

SELECT (SELECT MAX(marks) FROM student),names
FROM student;

CREATE VIEW view1 AS 
SELECT id,name FROM employee;

SELECT * FROM view1;

DROP VIEW view1;
