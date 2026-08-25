
-- CTE (COMMON TABLE EXPRESSION)

-- Drop table if it already exists
IF OBJECT_ID('Employees', 'U') IS NOT NULL
DROP TABLE Employees;

-- Create Table
CREATE TABLE Employees
(
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(30),
    Salary INT,
    Department VARCHAR(30)
);

-- Insert Records
INSERT INTO Employees VALUES
(101,'Amit',45000,'HR'),
(102,'Neha',65000,'IT'),
(103,'Kiran',75000,'IT'),
(104,'Deepa',55000,'Sales'),
(105,'Rahul',85000,'IT'),
(106,'Anil',35000,'HR');

-- STANDALONE CTE

-- Q1. Display all employees using CTE.

WITH EmployeeCTE AS
(
    SELECT *
    FROM Employees
)
SELECT *
FROM EmployeeCTE;

-- Q2. Display employees earning more than 50000.

WITH EmployeeCTE AS
(
    SELECT *
    FROM Employees
)
SELECT *
FROM EmployeeCTE
WHERE Salary > 50000;

-- Q3. Display employees working in IT department.

WITH EmployeeCTE AS
(
    SELECT *
    FROM Employees
)
SELECT *
FROM EmployeeCTE
WHERE Department='IT';

-- AGGREGATE CTE

-- Q4. Find average salary.

WITH AvgSalary AS
(
    SELECT AVG(Salary) AS AvgSal
    FROM Employees
)
SELECT *
FROM AvgSalary;


-- Q5. Find employees earning more than average salary.

WITH AvgSalary AS
(
    SELECT AVG(Salary) AS AvgSal
    FROM Employees
)
SELECT *
FROM Employees
WHERE Salary >
(
SELECT AvgSal
FROM AvgSalary
);


-- Q6. Find maximum salary.

WITH MaxSalary AS
(
SELECT MAX(Salary) AS MaxSal
FROM Employees
)
SELECT *
FROM MaxSalary;

-- MULTIPLE CTE

-- Q7. Display average salary and maximum salary.

WITH AvgCTE AS
(
SELECT AVG(Salary) AvgSalary
FROM Employees
),

MaxCTE AS
(
SELECT MAX(Salary) MaxSalary
FROM Employees
)

SELECT *
FROM AvgCTE
CROSS JOIN MaxCTE;



-- Q8. Display employees earning greater than average salary
-- and less than maximum salary.

WITH AvgCTE AS
(
SELECT AVG(Salary) AvgSalary
FROM Employees
),

MaxCTE AS
(
SELECT MAX(Salary) MaxSalary
FROM Employees
)

SELECT *
FROM Employees
WHERE Salary >
(
SELECT AvgSalary
FROM AvgCTE
)
AND Salary <
(
SELECT MaxSalary
FROM MaxCTE
);

-- CTE WITH WINDOW FUNCTION

-- Q9. Rank employees based on salary.

WITH EmployeeRank AS
(
SELECT *,
RANK() OVER(ORDER BY Salary DESC) AS RankNo
FROM Employees
)

SELECT *
FROM EmployeeRank;


-- Q10. Display Top 3 highest-paid employees.

WITH EmployeeRank AS
(
SELECT *,
DENSE_RANK() OVER(ORDER BY Salary DESC) RankNo
FROM Employees
)

SELECT *
FROM EmployeeRank
WHERE RankNo<=3;

-- RECURSIVE CTE

-- Q11. Display numbers from 1 to 10.

WITH Numbers AS
(
SELECT 1 AS Num

UNION ALL

SELECT Num+1
FROM Numbers
WHERE Num<10
)

SELECT *
FROM Numbers
OPTION(MAXRECURSION 10);

-- Q12. Display numbers from 1 to 20.

WITH Series AS
(
SELECT 1 AS Number

UNION ALL

SELECT Number+1
FROM Series
WHERE Number<20
)

SELECT *
FROM Series
OPTION(MAXRECURSION 20);

-- CTE WITH GROUP BY

-- Q13. Find total salary of each department.

WITH DepartmentSalary AS
(
SELECT Department,
SUM(Salary) TotalSalary
FROM Employees
GROUP BY Department
)

SELECT *
FROM DepartmentSalary;

-- Q14. Find department having highest total salary.

WITH DepartmentSalary AS
(
SELECT Department,
SUM(Salary) TotalSalary
FROM Employees
GROUP BY Department
)

SELECT TOP 1 *
FROM DepartmentSalary
ORDER BY TotalSalary DESC;

-- Q15. Find departments whose average salary is greater than 50000.

WITH DepartmentAverage AS
(
SELECT Department,
AVG(Salary) AvgSalary
FROM Employees
GROUP BY Department
)

SELECT *
FROM DepartmentAverage
WHERE AvgSalary>50000;

--nested cte:not supported in sql server

WITH CTE1 AS
(
    SELECT Department,
           AVG(Salary) AS AvgSalary
    FROM Employees
    GROUP BY Department
),
CTE2 AS
(
    SELECT *
    FROM CTE1
    WHERE AvgSalary > 50000
)
SELECT *
FROM CTE2;