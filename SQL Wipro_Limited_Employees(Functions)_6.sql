CREATE DATABASE WIPRO_LIMITED ;
USE WIPRO_LIMITED ;

CREATE TABLE EMPLOYEES ( 
Employee_Id INT PRIMARY KEY AUTO_INCREMENT,
First_Name VARCHAR(25),
Last_Name VARCHAR(25),
Gender ENUM ("M","F"),
Joined_Date DATE,
Resignation_Date DATE,
Employee_City VARCHAR(25)
) ;

INSERT INTO EMPLOYEES 
(First_Name, Last_Name, Gender, Joined_Date, Resignation_Date, Employee_City)
VALUES
("Arun", "Kumar", "M", "2020-01-15", "2022-08-20", "Chennai"),
("Priya", "Sharma", "F", "2019-06-10", "2023-03-28", "Bangalore"),
("Suresh", "Ravi", "M", "2021-03-05", "2024-01-19", "Hyderabad"),
("Divya", "Ramesh", "F", "2020-09-12", "2023-11-15", "Chennai"),
("Karthik", "Raj", "M", "2022-04-01", "2024-05-20", "Coimbatore"),
("Lakshmi", "Devi", "F", "2018-11-25", "2022-10-05", "Madurai"),
("Manoj", "Selvam", "M", "2021-01-10", "2023-12-22", "Pune"),
("Anitha", "S", "F", "2019-02-18", "2022-09-30", "Kochi"),
("Vijay", "Kannan", "M", "2020-05-20", "2023-08-18", "Chennai"),
("Meena", "Ravi", "F", "2021-07-14", "2024-03-10", "Bangalore"),
("Harish", "Krishnan", "M", "2019-09-02", "2023-01-25", "Hyderabad"),
("Swetha", "R", "F", "2020-12-10", "2024-02-20", "Coimbatore"),
("Ragul", "S", "M", "2021-06-05", "2023-10-01", "Trichy"),
("Nivetha", "Sri", "F", "2019-03-22", "2022-12-15", "Chennai"),
("Gokul", "Prasad", "M", "2020-02-11", "2024-01-05", "Bangalore"),
("Revathi", "P", "F", "2022-08-01", "2024-06-30", "Madurai"),
("Sathish", "Kumar", "M", "2018-10-05", "2023-05-22", "Hyderabad"),
("Keerthana", "M", "F", "2021-11-19", "2024-08-17", "Pune"),
("Abdul", "Rahman", "M", "2020-06-15", "2023-09-25", "Chennai"),
("Ramya", "Suresh", "F", "2019-07-28", "2024-04-10", "Coimbatore"),
("Ramesh", "Kumar", "M", "2013-04-12", "2023-07-20", "Chennai"),
("Geetha", "Lakshmi", "F", "2014-02-28", "2024-05-10", "Bangalore"),
("Murugan", "Ravi", "M", "2012-11-05", "2023-12-18", "Coimbatore"),
("Shalini", "Suresh", "F", "2011-08-19", "2024-09-22", "Hyderabad"),
("Venkatesh", "Arun", "M", "2010-06-01", "2024-01-30", "Chennai");

SELECT * FROM employees ;
 -- String Functions
SELECT UPPER(First_Name) AS Upper_Case_Name FROM employees ;
SELECT LOWER(Last_Name) AS Lower_Case_Name FROM employees ;
SELECT CONCAT(First_Name," ",Last_Name) AS Employees_Names FROM employees ;
SELECT SUBSTRING(Employee_City,1,3) FROM employees ;

-- Date Functions
SELECT NOW() Today ;
SELECT YEAR(Joined_Date) AS Joined_Year FROM employees ;
SELECT YEAR(Resignation_Date) AS Resignation_Year FROM employees ;

SELECT CONCAT(First_Name," ",Last_Name) AS Employees_Names,
YEAR(NOW()) - YEAR(Joined_Date) AS Tenure_Years FROM employees ;

SELECT * FROM employees
WHERE TIMESTAMPDIFF(YEAR, Joined_Date, Resignation_Date) >= 10;

SELECT CONCAT(First_Name," ",Last_Name) AS Employees_Names,
DATEDIFF(NOW(), Joined_Date) / 365 AS Tenure_In_Years
FROM employees;

SELECT CONCAT(First_Name," ",Last_Name) AS Employees_Names,
FLOOR(DATEDIFF(NOW(), Joined_Date) / 365) AS Tenure_In_Years
FROM employees;

-- User-defined Function
SELECT CONCAT(First_Name," ",Last_Name) AS Employees_Names FROM employees ;

DELIMITER $$
CREATE FUNCTION Full_Name_Students (Combining_Name VARCHAR(25))
RETURNS VARCHAR(25)
DETERMINISTIC
BEGIN 
	DECLARE Result VARCHAR(25);
    SELECT CONCAT(First_Name," ",Last_Name) AS Employees_Names INTO Result FROM employees 
    WHERE Employee_Id = Combining_Name ;
    RETURN Result ;
    END $$
    DELIMITER ;
    
-- Using Function
SELECT Full_Name_Students (2);

SELECT * FROM employees ;



