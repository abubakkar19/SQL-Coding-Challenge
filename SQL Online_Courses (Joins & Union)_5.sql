CREATE DATABASE ONLINE_COURSES;
USE ONLINE_COURSES;

CREATE TABLE Student_details (
Student_Id INT PRIMARY KEY UNIQUE,
Student_Name VARCHAR(25),
Gender Enum ("M","F"),
City VARCHAR (25),
Joined_Date DATE 
);

CREATE TABLE Course_Details (
Course_Id INT PRIMARY KEY UNIQUE,
Course_Name VARCHAR (25),
Mentor_Name VARCHAR (25)
) ;

ALTER TABLE Course_Details
DROP COLUMN Mentor_Name ;

CREATE TABLE Mentors_Details (
Mentor_ID INT PRIMARY KEY NOT NULL,
Mentor_Name VARCHAR (25),
Mentor_Roll VARCHAR (25),
Mentor_City VARCHAR (25)
) ;

CREATE TABLE Students_Enrolled_Courses (
Student_Id INT ,
Student_Name VARCHAR(25),
Course_Id INT,
Course_Name VARCHAR (25),
Mentor_Assigned VARCHAR (25),
FOREIGN KEY (Student_Id) REFERENCES Student_details (Student_Id),
FOREIGN KEY (Course_Id) REFERENCES Course_Details (Course_Id)
) ;

INSERT INTO Student_details ( Student_Id , Student_Name, Gender, City, Joined_Date)
VALUES (1001,"Naveen","M","Vellore","2025-10-02"),
(1002,"Shruthi","F","Chennai","2025-10-06"),
(1003,"Joseph","M","Vilupuram","2025-10-10"),
(1004,"Naresh","M","Vellore","2025-10-11"),
(1005,"Bala","F","Tiruvannamalai","2025-10-13"),
(1006,"Naveen","M","Coimbatore","2025-10-14"),
(1007,"Nanthan","M","Thiruvallur","2025-10-14"),
(1008,"Kaviyarasi","F","Hosur","2025-10-15"),
(1009,"Jayaparakash","M","Bangalore","2025-10-16"),
(1010,"Revathi","F","Madurai","2025-10-17"),
(1011,"Fazil","M","Dindivanam","2025-10-18"),
(1012,"Priya","F","Kallakuuchi","2025-10-20"),
(1013,"Priya Dharshini","M","Chennai","2025-10-20"),
(1014,"Saravanan","M","Coumbatore","2025-10-22"),
(1015,"Sathish","M","Chennai","2025-10-25")
;

INSERT INTO Course_Details ( Course_Id, Course_Name)
VALUES (101, "Data Analytics"),
(102, "Full Stack Development"),
(103, "Software Testing"),
(104, "Data Science"),
(105, "Python"),
(106, "SAP"),
(107, "Digital Marketing")
;

INSERT INTO Mentors_Details ( Mentor_ID, Mentor_Name, Mentor_Roll, Mentor_City)
VALUES (2001,"Kumaran","Data Analytics","Chennai"),
(2002,"Priya","Full Stack Development","Coimbatore"),
(2003,"Suresh","Software Testing","Erode"),
(2004,"Kavya","Data Science","Salem"),
(2005,"Rahul","Python","Madurai"),
(2006,"Lakshmi","SAP","Erode"),
(2007,"Arun Kumar","Digital Marketing","Chennai")
;


INSERT INTO Students_Enrolled_Courses ( Student_Id, Student_Name, Course_Id, Course_Name, Mentor_Assigned)
VALUES (1001,"Naveen",101,"Data Analytics","Kumaran"),
(1002,"Shruthi",102,"Full Stack Development","Priya"),
(1003,"Joseph",101,"Data Analytics","Kumaran"),
(1004,"Naresh",107,"Digital Marketing","Arun Kumar"),
(1005,"Bala",103,"Software Testing","Suresh"),
(1006,"Naveen",104,"Data Science","Kavya"),
(1007,"Nanthan",105,"Python","Rahul"),
(1008,"Kaviyarasi",106,"SAP","Lakshmi"),
(1009,"Jayaparakash",101,"Data Analytics","Kumaran"),
(1010,"Revathi",102,"Full Stack Development","Priya"),
(1011,"Fazil",103,"Software Testing","Suresh"),
(1012,"Priya",104,Null,"Kavya"),
(1013,"Priya Dharshini",106,Null,"Lakshmi"),
(1014,"Saravanan",101,"Data Analytics","Kumaran"),
(1015,"Sathish",107,"Digital Marketing",Null)
;

UPDATE Students_Enrolled_Courses
SET Mentor_Name = "Arun Kumar"
WHERE Student_Id = 1015 ;

UPDATE Students_Enrolled_Courses
SET Course_Name = Null
WHERE Student_Id = 1015 ;

SELECT * FROM Student_details ;
SELECT * FROM Course_Details ;
SELECT * FROM Mentors_Details ;
SELECT * FROM Students_Enrolled_Courses ;

SELECT * FROM Students_Enrolled_Courses 
INNER JOIN Course_Details On Students_Enrolled_Courses.Course_Name = Course_Details.Course_Name ;

SELECT * FROM Students_Enrolled_Courses 
LEFT JOIN Course_Details On Students_Enrolled_Courses.Course_Name = Course_Details.Course_Name ;

SELECT * FROM Students_Enrolled_Courses 
RIGHT JOIN Course_Details On Students_Enrolled_Courses.Course_Name = Course_Details.Course_Name ;

ALTER TABLE Mentors_Details
ADD Joined_Date Date ;

UPDATE Mentors_Details
SET Joined_Date = CASE Mentor_ID 
WHEN 2001 THEN "2023-06-05"
WHEN 2002 THEN "2023-08-05"
WHEN 2003 THEN "2023-10-05"
WHEN 2004 THEN "2024-09-05"
WHEN 2005 THEN "2024-011-05"
WHEN 2006 THEN "2025-01-05"
WHEN 2007 THEN "2025-05-05"
END
WHERE Mentor_ID BETWEEN 2001 AND 2007 ;

SELECT * FROM Student_details ;
SELECT * FROM Course_Details ;
SELECT * FROM Mentors_Details ;
SELECT * FROM Students_Enrolled_Courses ;

CREATE TABLE Past_Employees (
Emp_Id INT NOT NULL,
Emp_Name VARCHAR(25),
Gender Enum ("M","F"),
Joined_Date DATE,
Resignation_Date DATE,
City VARCHAR (25)
) ;

INSERT INTO Past_Employees 
(Emp_Id, Emp_Name, Gender, Joined_Date, Resignation_Date, City)
VALUES
(2001, "Manoj Kumar", "M", "2022-02-18", "2023-11-25", "Erode"),
(2002, "Divya Ramesh", "F", "2022-09-12", "2024-03-30", "Chennai"),
(2003, "Harish K", "M", "2022-01-05", "2024-07-14", "Coimbatore"),
(2004, "Anitha S", "F", "2021-12-20", "2023-09-02", "Kochi"),
(2007, "Arun Kumar", "M","2025-05-05",Null,"Chennai"), -- From Mentor_Details for Duplicates to Use Union and Union All
(2005, "Rahul", "M", "2024-011-05",Null,"Madurai")  -- From Mentor_Details for Duplicates to Use Union and Union All
;

TRUNCATE Past_Employees ;
DROP TABLE Past_Employees;

SELECT * FROM Past_employees ;

SELECT Emp_ID,Emp_Name AS All_Employees,Joined_Date FROM past_employees 
UNION ALL
SELECT Mentor_Id,Mentor_Name,Joined_Date FROM mentors_details; -- Shows all with duplicates, (Duplicates are "Arun Kumar","Rahul") 

SELECT Emp_ID,Emp_Name AS All_Employees,Joined_Date FROM past_employees 
UNION 
SELECT Mentor_Id,Mentor_Name,Joined_Date FROM mentors_details; -- Shows only Distinct, (Removed Duplicates are "Arun Kumar","Rahul") 

