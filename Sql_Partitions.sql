CREATE DATABASE PartitionPractice;
GO

USE PartitionPractice;
GO

--creating partition function
 
CREATE PARTITION FUNCTION pf_SalesByYear (DATE)
AS RANGE RIGHT
FOR VALUES
(
    '2024-01-01',
    '2025-01-01',
    '2026-01-01'
);
GO

--creating partition scheme

CREATE PARTITION SCHEME ps_SalesByYear
AS PARTITION pf_SalesByYear
ALL TO ([PRIMARY]); 
GO

--creating partition table

CREATE TABLE Sales
(
    OrderID INT NOT NULL,
    CustomerName VARCHAR(100),
    OrderDate DATE NOT NULL,
    Amount DECIMAL(10,2)
)
ON ps_SalesByYear(OrderDate);
GO

--insertion

INSERT INTO Sales VALUES
(1, 'Rahul', '2023-05-10', 5000),
(2, 'Priya', '2023-11-20', 7000),
(3, 'John',  '2024-02-15', 3000),
(4, 'David', '2024-08-10', 9000),
(5, 'Sara',  '2025-01-20', 4500),
(6, 'Anil',  '2025-06-15', 8000),
(7, 'Ravi',  '2026-01-10', 6000),
(8, 'Meena', '2026-07-20', 10000);

--check partirion

SELECT
    OrderID,
    CustomerName,
    OrderDate,
    Amount,
    $PARTITION.pf_SalesByYear(OrderDate) AS PartitionNumber
FROM Sales
ORDER BY OrderDate;

--checking no of rows in each partition

SELECT
    $PARTITION.pf_SalesByYear(OrderDate) AS PartitionNumber,
    COUNT(*) AS NumberOfRows
FROM Sales
GROUP BY $PARTITION.pf_SalesByYear(OrderDate)
ORDER BY PartitionNumber;

--add new partition

ALTER PARTITION FUNCTION pf_SalesByYear()
SPLIT RANGE ('2027-01-01');
GO

INSERT INTO Sales VALUES
(9, 'Kiran', '2027-01-15', 7500),
(10, 'Lakshmi', '2027-05-20', 9500);
GO

--Checking

SELECT
    OrderID,
    OrderDate,
    $PARTITION.pf_SalesByYear(OrderDate) AS PartitionNumber
FROM Sales
ORDER BY OrderDate;

SELECT *
FROM Sales
WHERE OrderDate >= '2025-01-01'
  AND OrderDate < '2026-01-01';
