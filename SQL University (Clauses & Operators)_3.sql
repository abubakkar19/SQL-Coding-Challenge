CREATE DATABASE UNIVERSITY ;
USE UNIVERSITY;

CREATE TABLE STUDENT_DETAILS (
Student_Id INT PRIMARY KEY AUTO_INCREMENT,
Student_Name VARCHAR (25) NOT NULL,
AGE INT NOT NULL,
Student_City VARCHAR (50)
) ;

INSERT INTO STUDENT_DETAILS (Student_Name,AGE,Student_City)
VALUES ("Achuthan" , 20, "Vilupuram"),
("Krishna", 19, "Chennai"),
("Agilan", 20, "Nagapatinam"),
("Barath", 20, "Chennai"),
("Joyson David", 19, "Chennai"),
("Adhi Eswar", 20, "Chennai"),
("Krishna Kumar", 23, "Erode"),
("Adhinathan", 20, "Dindivanam"),
("Dinseh", 20, "Thiruvallur"),
("Aadhesh", 20, "Andaman Nicobar") ;

ALTER TABLE STUDENT_DETAILS 
ADD Email_Address VARCHAR(25);

UPDATE STUDENT_DETAILS
SET Email_Address = CASE Student_Id
    WHEN 1 THEN 'abc123@gmail.com'
    WHEN 2 THEN 'efg123@gmail.com'
    WHEN 3 THEN 'ijk123@gmail.com'
    WHEN 4 THEN 'lmn123@gmail.com'
    WHEN 5 THEN 'opq123@gmail.com'
    WHEN 6 THEN 'rst123@gmail.com'
    WHEN 7 THEN NULL
    WHEN 8 THEN 'uvz123@gmail.com'
    WHEN 9 THEN NULL
    WHEN 10 THEN 'axz123@gmail.com'
END
WHERE Student_Id BETWEEN 1 AND 10;


CREATE TABLE DEPARTMENT_DETAILS (
Department_Id INT PRIMARY KEY NOT NULL,
Department_Name VARCHAR (25) 
);

INSERT INTO DEPARTMENT_DETAILS (Department_Id,Department_Name)
VALUES ( 101, "Mechanical"),
( 102, "Civil"),
( 103, "Computer Science"),
( 104, "EEE"),
( 105, "ECE"),
( 106, "Mechatronics"),
( 107, "Mechanical"),
( 108, "Computer Science"),
( 109, "Civil"),
( 110, "EEE") ;

CREATE TABLE STUDENT_PERFOMANCE (
Student_Id INT ,
Student_Name VARCHAR (25),
Department_Name VARCHAR (25),
Department_Id INT, 
CGPA DECIMAL (10,2),
FOREIGN KEY (Student_Id) REFERENCES STUDENT_DETAILS(Student_Id),
FOREIGN KEY (Department_Id) REFERENCES DEPARTMENT_DETAILS(Department_Id)
) ;


INSERT INTO STUDENT_PERFOMANCE ( Student_ID,Student_Name,Department_Name,Department_Id,CGPA)
VALUES (1,"Achuthan","Mechanical",101,8.20),
(2,"Krishna","Civil",102,8.00),
(3,"Agilan","Computer Science",103,7.00),
(4,"Barath","EEE",104,7.20),
(5,"Joyson David","ECE",105,7.25),
(6,"Adhi Eswar","Mechatronics",106,7.50),
(7,"Krishna Kumar","Mechanical",107,8.50),
(8,"Adhinathan","Civil",108,8.75),
(9,"Dinseh","Computer Science",109,7.75),
(10,"Aadhesh","EEE",110,8.25) ;


SELECT * FROM Student_Details ;
SELECT * FROM Department_Details ;
SELECT * FROM STUDENT_PERFOMANCE ;

SELECT DISTINCT Department_Name FROM Department_Details ;

SELECT * FROM Student_Details 
WHERE Email_Address IS NULL ;

SELECT * FROM Student_Details 
WHERE Email_Address IS NOT NULL ;

SELECT * FROM STUDENT_PERFOMANCE 
WHERE Department_Name in ("Mechanical","Civil") ;

SELECT * FROM STUDENT_PERFOMANCE 
WHERE CGPA BETWEEN 7.50 AND 9.00 ;

SELECT * FROM STUDENT_PERFOMANCE 
WHERE CGPA NOT BETWEEN 7.50 AND 9.00 ;

