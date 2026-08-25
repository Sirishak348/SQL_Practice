
-- CTAS (CREATE TABLE AS SELECT)

-- Create Sample Table
CREATE TABLE Employees
(
    EmployeeID INT,
    EmployeeName VARCHAR(30),
    Department VARCHAR(20),
    Salary INT
);

INSERT INTO Employees VALUES
(101,'Amit','HR',45000),
(102,'Neha','IT',65000),
(103,'Rahul','IT',80000),
(104,'Priya','Sales',55000),
(105,'Anil','HR',40000);


-- Q1. Create a new table by copying
-- all records from Employees.

SELECT *
INTO EmployeeBackup
FROM Employees;

SELECT * FROM EmployeeBackup;

-- Q2. Create a table containing
-- only IT employees.

SELECT *
INTO ITEmployees
FROM Employees
WHERE Department='IT';

SELECT * FROM ITEmployees;

-- Q3. Create a table with only
-- Employee Name and Salary.


SELECT EmployeeName,Salary
INTO EmployeeSalary
FROM Employees;

SELECT * FROM EmployeeSalary;

-- Q4. Create a snapshot of employees
-- whose salary is above 50000.

SELECT *
INTO HighSalaryEmployees
FROM Employees
WHERE Salary>50000;

SELECT * FROM HighSalaryEmployees;

-- Q5. Create a department-wise
-- salary summary table.

SELECT Department,
SUM(Salary) AS TotalSalary,
AVG(Salary) AS AverageSalary
INTO DepartmentSummary
FROM Employees
GROUP BY Department;

SELECT * FROM DepartmentSummary;

-- Q6. Verify that CTAS creates
-- an independent table.

UPDATE Employees
SET Salary=90000
WHERE EmployeeID=102;

SELECT * FROM Employees;
SELECT * FROM ITEmployees;

-- ITEmployees will NOT change automatically.

-- Q7. Delete a CTAS table.

DROP TABLE EmployeeSalary;