CREATE TABLE Employes_Details (
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(50),
    Department VARCHAR(30),
    Salary DECIMAL(10,2),
    JoinDate DATE,
    City VARCHAR(30)
);

INSERT INTO Employes_Details VALUES
(101, 'John Smith', 'IT', 55000, '2022-03-15', 'Hyderabad'),
(102, 'Emma Watson', 'HR', 48000, '2021-07-20', 'Chennai'),
(103, 'David Miller', 'Finance', 62000, '2020-11-10', 'Mumbai'),
(104, 'Sophia Brown', 'IT', 58000, '2023-01-05', 'Bangalore'),
(105, 'Michael Clark', 'Sales', 51000, '2019-09-25', 'Delhi'),
(106, 'Olivia Davis', 'HR', 47000, '2024-02-12', 'Hyderabad'),
(107, 'James Wilson', 'Finance', 67500, '2022-06-18', 'Pune'),
(108, 'Emily Taylor', 'Sales', 52500, '2023-08-30', 'Chennai');

select * from EMployes_Details;

--String functions

--UPPER

select Employes_Details.*,
UPPER(EmployeeName) as UpperName
from Employes_Details;

--LOWER

select Employes_Details.*,
Lower(City) as Lowercity
from Employes_Details;

--LENGTH

select Employes_Details.*,
LEN(EmployeeName) as lengthName
from Employes_Details;

--left

select Employes_Details.*,
left(EmployeeName,4) as FirstCharacters
from Employes_Details;

--right

select Employes_Details.*,
right(City,4) as lastaracters
from Employes_Details;

--Replace

select EmployeeName,
REPLACE( Department,'IT','Information Technology') as  Departmnet
from Employes_Details;

select EmployeeName,
REPLACE(replace(Department,'IT','Information Technology'),'HR','Human Resource') as replaced
from Employes_Details;

--substring

select substring(EmployeeName,1,4) as sub
from Employes_Details;

--substring() and charindex()

select EmployeeName,
SubString(EmployeeName,1,CharIndex(' ',EmployeeName)-1) as first_name
from Employes_details;

--trim

select trim(EmployeeName) as clean_name
from Employes_Details;

select ltrim(rtrim(EmployeeName)) as clean_name
from Employes_Details;

select EmployeeName
from Employes_details
where EmployeeName like 'j%';

--Number Functions

--round

select round(Salary,0) as Salary from Employes_Details;

select round(Salary,2) as Salary2 from Employes_Details;

--ceiling

select salary,ceiling(Salary) as salary3 from Employes_Details;

--floor

select salary,floor(Salary) as salary3 from Employes_Details;

--Absolute

select '-10',
abs('10') as abs;

--power

select Salary,
power(Salary,3) as power
from Employes_Details;

--sqrt

select Salary,
sqrt(Salary) as Sqrt
from Employes_Details;

--sign

select Salary,
sign(Salary) as Sign
from Employes_Details;

--rand

select rand() as random_number;

select floor(Rand()*100)+1 as random;

--date functions

--day

select EmployeeName,JoinDate,
day(JoinDate) as join_day
from Employes_Details;

--month

select EmployeeName,JoinDate,
month(JoinDate) as join_month
from Employes_Details;

--year

select EmployeeName,JoinDate,
year(JoinDate) as join_year
from Employes_Details;

--Datepart
 
select EmployeeName,JoinDate,
Datepart(year,JoinDate) as join_year
from Employes_Details;

--datename

select EmployeeName,JoinDate,
Datename(month,joindate) as Monthname
from Employes_Details;

--eomonth

select EmployeeName,JoinDate,
eomonth(JoinDate) as monthend
from Employes_Details;

--format

select EmployeeName,JoinDate,
format(JoinDate,'dd-MM-yyyy') as format_date
from Employes_Details;

--cast

select EmployeeName,JoinDate,
cast(JoinDate as date) as join_date    
from Employes_Details;

--convert

select EmployeeName,JoinDate,
convert(date,JoinDate) as join_date
from Employes_Details;

--dateadd

select EmployeeName,JoinDate,
dateadd(month,2,joinDate) as add_months
from Employes_Details;

--datediff

select EmployeeName,JoinDate,
datediff(day,joinDate,getdate()) as diff
from Employes_Details;

--isdate

select isdate('2026-06-8') as valid

--null functions


-- 1. Display employee name and department.
-- If Department is NULL, display 'Not Assigned'.

SELECT EmployeeName,
       ISNULL(Department, 'Not Assigned') AS Department
FROM Employes_Details;


-- 2. Display employee name and city.
-- If City is NULL, display 'Not Available'.

SELECT EmployeeName,
       ISNULL(City, 'Not Available') AS City
FROM Employes_Details;


-- 3. Display employee name and salary.
-- If Salary is NULL, display 0.

SELECT EmployeeName,
       ISNULL(Salary, 0) AS Salary
FROM Employes_Details;


-- 4. Display City if available.
-- Otherwise display Department.
-- If both are NULL, display 'Unknown'.

SELECT EmployeeName,
       COALESCE(City, Department, 'Unknown') AS Location
FROM Employes_Details;


-- 5. Display Department if available.
-- Otherwise display City.
-- If both are NULL, display 'Not Available'.

SELECT EmployeeName,
       COALESCE(Department, City, 'Not Available') AS Details
FROM Employes_Details;


-- 6. Replace salary 50000 with NULL in the output.

SELECT EmployeeName,
       Salary,
       NULLIF(Salary, 50000) AS NewSalary
FROM Employes_Details;


-- 7. Replace Department 'IT' with NULL in the output.

SELECT EmployeeName,
       Department,
       NULLIF(Department, 'IT') AS NewDepartment
FROM Employes_Details;


-- 8. Find employees whose Department is NULL.

SELECT *
FROM Employes_Details
WHERE Department IS NULL;


-- 9. Find employees whose Department is NOT NULL.

SELECT *
FROM Employes_Details
WHERE Department IS NOT NULL;


-- 10. Find employees whose City is NULL.

SELECT *
FROM Employes_Details
WHERE City IS NULL;


-- 11. Find employees whose City is NOT NULL.

SELECT *
FROM Employes_Details
WHERE City IS NOT NULL;


-- 12. If JoinDate is NULL, display a default date.

SELECT EmployeeName,
       ISNULL(JoinDate, '2000-01-01') AS JoinDate
FROM Employes_Details;


























