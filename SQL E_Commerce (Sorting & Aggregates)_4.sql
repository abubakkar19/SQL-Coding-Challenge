CREATE DATABASE E_COMMERCE ;
USE E_COMMERCE;

CREATE TABLE ORDERS (
Order_Id INT PRIMARY KEY AUTO_INCREMENT,
Customer_Name VARCHAR(25),
Product_Name VARCHAR(50),
Product_Category VARCHAR (25),
Price DECIMAL(10,2),
Quantity INT,
Total_Amount DECIMAL (10,2),
Order_Date Date 
) ;
ALTER TABLE ORDERS 
ADD COLUMN Gender ENUM ("M", "F");

INSERT INTO ORDERS (Customer_Name, Product_Name, Product_Category, Price, Quantity ,Total_Amount, Order_Date, Gender)
VALUES ( "Dinsesh", "Iphone 15", "Mobile", 50000, 1, 50000, "2025-01-10", "M"),
( "Ganesh", "Shoes", "Fashion", 1000, 1, 1000, "2025-01-20", "M"),
("Arun", "Air Fryer", "Electronics", 10000, 1, 10000, "2025-01-30", "M"),
("Joseph","Watch","Accessories", 3000, 1, 3000, "2025-02-05", "M"),
("Ram","Xioami TV", "Electronics", 40000, 1, 40000, "2025-02-16", "M"),
("Raj", "Ipad", "Tab", 20000 ,1 ,20000, "2025-02-27", "M"),
("Kumar", "Peter England Shirt", "Fashion", 2000, 3, 60000, "2025-03-02", "M"),
("Hari", "One Plus Headphones", "Electronics", 5000, 2, 10000, "2025-03-13", "M"),
("Vignesh", "Shoes", "Fashion", 2500, 1, 2500, "2025-03-16", "M"),
("Logesh", "Speaker", "Electronics", 2500, 4, 10000, "2025-04-18", "M"),
("Revathy", "Ear Rings", "Fahshion", 1000, 2, 2000, "2025-04-06", "F"),
("Pavithra", "Saree", "Fashion", 3000, 2, 6000, "2025-05-03", "F"),
("Nivetha", "one Plus 13", "Mobile", 60000, 1, 60000, "2025-05-19", "F");

SELECT * FROM ORDERS;
-- ORDER BY & LIMIT
SELECT * FROM ORDERS
ORDER BY Customer_Name ASC;

SELECT * FROM ORDERS
WHERE Price >= 20000
ORDER BY Price DESC
LIMIT 3;

-- Aggregate Functions
SELECT COUNT(Order_Id) Count_of_Orders FROM ORDERS;
SELECT SUM(Total_Amount) Total_Sales FROM ORDERS;
SELECT ROUND(AVG(Price),2) Avg_Price FROM ORDERS;
SELECT MAX(Quantity) High_Saled_QTY FROM ORDERS;
SELECT MIN(Price) Minimum_Price FROM ORDERS;

