CREATE DATABASE EMPLOYEES ;
USE EMPLOYEES ;
CREATE TABLE Employee (
Emp_ID INT PRIMARY KEY NOT NULL,
Emp_Name VARCHAR (25),
Age INT,
Gender Enum ("M", "F"),
Department_Name VARCHAR (25)
);

INSERT INTO Employee ( Emp_ID, Emp_Name, Age, Gender, Department_Name)
VALUES (1001,"Priya",25,"F","IT"),
(1002,"Pavithra",23,"F","ECE"),
(1003,"Vihaan Singh",26,"M","Data Analyst"),
(1004,"Lakshmi",22,"F","Data Analyst"),
(1005,"Deva",27,"M","Data Analyst"),
(1006,"Sam",28,"M","Data Analyst"),
(1007,"Saravanan",29,"M","IT"),
(1008,"Sathish",29,"M","Data Analyst"),
(1009,"Gugan",25,"M","IT"),
(1010,"Banu",29,"F","Medical Coding"),
(1011, "Shabarish",24,"M","Data Analyst"),
(1012, "Kabir",21,"M","Data Analyst"),
(1013,"Sundar",30,"M","Data Science"),
(1014,"Sudakar",26,"M","Data Analyst"),
(1015,"Swetha",25,"F","Medical Coding"),
(1016,"Fayas",28,"M","Data Analyst"),
(1017,"Surya",23,"M","Data Analyst")
;

SELECT * FROM Employee;
SELECT MAX(Department_Name) More_than_10_Eployees FROM Employee 
GROUP BY Department_Name 
HAVING COUNT(Department_Name) = 10 ;