
-- TEMPORARY TABLES (SQL SERVER)

-- Create Permanent Table

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

-- Q1. Create a temporary table and copy
-- all employee records.


SELECT *
INTO #TempEmployees
FROM Employees;

SELECT *
FROM #TempEmployees;

-- Q2. Create a temporary table containing
-- only IT employees.

SELECT *
INTO #ITEmployees
FROM Employees
WHERE Department='IT';

SELECT *
FROM #ITEmployees;

-- Q3. Insert a new record into
-- the temporary table.

INSERT INTO #ITEmployees
VALUES
(106,'Kiran','IT',70000);

SELECT *
FROM #ITEmployees;

-- Q4. Update salary in the
-- temporary table.

UPDATE #ITEmployees
SET Salary=75000
WHERE EmployeeName='Kiran';

SELECT *
FROM #ITEmployees;

-- Q5. Delete a record from
-- the temporary table.

DELETE
FROM #ITEmployees
WHERE EmployeeName='Neha';

SELECT *
FROM #ITEmployees;


-- Q6. Load data from the temporary
-- table into a permanent table.

CREATE TABLE EmployeeBackup
(
    EmployeeID INT,
    EmployeeName VARCHAR(30),
    Department VARCHAR(20),
    Salary INT
);

INSERT INTO EmployeeBackup
SELECT *
FROM #ITEmployees;

SELECT *
FROM EmployeeBackup;

-- Q7. Drop the temporary table.

DROP TABLE #ITEmployees;

DROP TABLE #TempEmployees;