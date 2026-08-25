
-- VIEWS 

-- Drop table if it exists
IF OBJECT_ID('Employees','U') IS NOT NULL
DROP TABLE Employees;

-- Create Table
CREATE TABLE Employees
(
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(30),
    Department VARCHAR(20),
    Salary INT
);

-- Insert Records
INSERT INTO Employees VALUES
(101,'Amit','HR',45000),
(102,'Neha','IT',65000),
(103,'Kiran','IT',75000),
(104,'Deepa','Sales',55000),
(105,'Rahul','IT',85000),
(106,'Anil','HR',35000);

-- ==========================================
-- Q1. Create a View to display all employees.
-- ==========================================

CREATE VIEW EmployeeView
AS
SELECT *
FROM Employees;

SELECT *
FROM EmployeeView;

-- ==========================================
-- Q2. Create a View to display only IT employees.
-- ==========================================

CREATE VIEW ITEmployees
AS
SELECT *
FROM Employees
WHERE Department='IT';

SELECT *
FROM ITEmployees;

-- ==========================================
-- Q3. Create a View to display employees
-- earning more than 50000.
-- ==========================================

CREATE VIEW HighSalaryEmployees
AS
SELECT *
FROM Employees
WHERE Salary>50000;

SELECT *
FROM HighSalaryEmployees;


-- Q4. Create a View to display
-- Employee Name and Salary only.


CREATE VIEW EmployeeSalary
AS
SELECT EmployeeName,Salary
FROM Employees;

SELECT *
FROM EmployeeSalary;

-- ==========================================
-- Q5. Find the average salary using a View.
-- ==========================================

CREATE VIEW AverageSalary
AS
SELECT AVG(Salary) AS AverageSalary
FROM Employees;

SELECT *
FROM AverageSalary;

-- ==========================================
-- Q6. Find the maximum salary using a View.
-- ==========================================

CREATE VIEW MaximumSalary
AS
SELECT MAX(Salary) AS MaximumSalary
FROM Employees;

SELECT *
FROM MaximumSalary;

-- ==========================================
-- Q7. Create a View for department-wise
-- average salary.
-- ==========================================

CREATE VIEW DepartmentAverage
AS
SELECT Department,
AVG(Salary) AS AverageSalary
FROM Employees
GROUP BY Department;

SELECT *
FROM DepartmentAverage;

-- ==========================================
-- Q8. Rename a column using View.
-- ==========================================

CREATE VIEW EmployeeDetails
AS
SELECT
EmployeeID AS ID,
EmployeeName AS Name,
Department AS Team,
Salary AS Income
FROM Employees;

SELECT *
FROM EmployeeDetails;

-- ==========================================
-- Q9. Update data through View.
-- ==========================================

UPDATE ITEmployees
SET Salary=70000
WHERE EmployeeName='Neha';

SELECT *
FROM Employees;

-- ==========================================
-- Q10. Delete a View.
-- ==========================================

DROP VIEW EmployeeSalary;

-- ==========================================
-- Q11. Find all employees using View
-- ordered by Salary.
-- ==========================================

SELECT *
FROM EmployeeView
ORDER BY Salary DESC;

-- ==========================================
-- Q12. Display only HR employees
-- using the View.
-- ==========================================

SELECT *
FROM EmployeeView
WHERE Department='HR';

