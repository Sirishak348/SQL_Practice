CREATE DATABASE ExecutionPlanPractice;
GO

USE ExecutionPlanPractice;
GO

CREATE TABLE Customers
(
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100),
    Country VARCHAR(50)
);
GO

CREATE TABLE Orders
(
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    Amount DECIMAL(10,2)
);
GO

INSERT INTO Customers VALUES
(1, 'Rahul', 'India'),
(2, 'Priya', 'India'),
(3, 'John', 'USA'),
(4, 'David', 'UK'),
(5, 'Sara', 'USA');
GO

INSERT INTO Orders VALUES
(101, 1, '2026-01-10', 5000),
(102, 2, '2026-01-12', 3000),
(103, 1, '2026-02-05', 7000),
(104, 3, '2026-02-10', 2500),
(105, 4, '2026-03-01', 8000);
GO

SELECT *
FROM Customers;
--CustomerID is the primary key and SQL Server created a clustered index by default in this case.

CREATE INDEX IX_Customers_Country
ON Customers(Country);
GO  --creating non clustered index
 
SELECT *
FROM Customers
WHERE Country = 'India';

--order by

SELECT *
FROM Orders
ORDER BY CustomerID;

CREATE INDEX IX_Orders_CustomerID
ON Orders(CustomerID);
GO

--joins 

SELECT
    o.OrderID,
    c.CustomerName,
    o.Amount
FROM Orders o
JOIN Customers c
    ON o.CustomerID = c.CustomerID;  --present nested loops is used

--forcing Hash join

SELECT
    o.OrderID,
    c.CustomerName,
    o.Amount
FROM Orders o
JOIN Customers c
    ON o.CustomerID = c.CustomerID
OPTION (HASH JOIN);

--forced nested loop

SELECT
    o.OrderID,
    c.CustomerName,
    o.Amount
FROM Orders o
JOIN Customers c
    ON o.CustomerID = c.CustomerID
OPTION (Loop Join);

--forced Merge join

SELECT
    o.OrderID,
    c.CustomerName,
    o.Amount
FROM Orders o
JOIN Customers c
    ON o.CustomerID = c.CustomerID
OPTION (MERGE JOIN);

--For small Tables nested loop is best
--For large Tables Hash join is best
--For sorted tables Merge join is best



    