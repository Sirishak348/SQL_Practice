
--Table 1: Departments

CREATE TABLE Departments(
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50),
    Location VARCHAR(50)
);

INSERT INTO Departments VALUES
(1,'HR','New York'),
(2,'Finance','Chicago'),
(3,'IT','Dallas'),
(4,'Marketing','Boston'),
(5,'Sales','Seattle'),
(6,'Operations','Atlanta');

select * from Departments;

--Table 2: Employ

CREATE TABLE Employ (
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(50),
    DepartmentID INT,
    Salary DECIMAL(10,2),
    ManagerID INT,
    JoiningDate DATE
);

INSERT INTO Employ VALUES
(101,'John',1,50000,NULL,'2020-01-15'),
(102,'Emma',2,65000,101,'2021-03-10'),
(103,'David',3,70000,101,'2019-07-22'),
(104,'Sophia',3,72000,103,'2022-05-01'),
(105,'Michael',5,55000,102,'2021-09-18'),
(106,'Olivia',NULL,48000,102,'2023-01-12'),
(107,'James',4,60000,103,'2022-10-20'),
(108,'William',7,75000,101,'2020-08-11'),
(109,'Ava',NULL,52000,NULL,'2024-02-15'),
(110,'Isabella',5,68000,105,'2021-06-05');

select * from Employ;

--Table 3: Projects

CREATE TABLE Projects (
    ProjectID INT PRIMARY KEY,
    ProjectName VARCHAR(50),
    DepartmentID INT,
    Budget DECIMAL(12,2)
);

INSERT INTO Projects VALUES
(201,'Payroll System',1,150000),
(202,'Audit System',2,200000),
(203,'Website Redesign',4,100000),
(204,'ERP Upgrade',3,500000),
(205,'Sales Dashboard',5,175000),
(206,'Automation',6,250000),
(207,'AI Chatbot',8,300000);

select * from Projects;

--Table 4: EmployeeProjects

CREATE TABLE EmployeeProjects (
    EmployeeID INT,
    ProjectID INT
);

INSERT INTO EmployeeProjects VALUES
(101,201),
(102,202),
(103,204),
(104,204),
(105,205),
(107,203),
(110,205),
(103,207),
(108,207),
(109,202);

select * from Employeeprojects;

--Inner join

--Display employee names with department names

select Employ.EmployeeName,Departments.DepartmentName
from Employ Inner Join Departments
on Employ.DepartmentID=Departments.DepartmentID;

--Display project names with department names

select Projects.ProjectName,Departments.DepartmentName
from Projects Inner Join Departments
on Projects.DepartmentID=Departments.DepartmentID;

--Show Employees along with project names

select Employ.*, Projects.ProjectName
from Employ Inner Join Projects
on Projects.DepartmentID=Employ.DepartmentID;

--show employ salary and department location

select Employ.salary,Departments.Location
from Employ Inner Join Departments
on Employ.DepartmentID=Departments.DepartmentID;

--display all employees woring on projects

select e.EmployeeName,p.ProjectName 
from EmployeeProjects ep
inner join Employ e
on ep.EmployeeID=e.EmployeeID
Inner join Projects p
on ep.projectID=p.projectID;

--left join

--show all the employees even if they don not belong to any department

select Employ.* 
from Employ left join Departments
on Employ.DepartmentID=Departments.DepartmentID;

--Show all departments even if no employee works there.

select Departments.*,Employ.EmployeeName
from Departments left join Employ
on  Departments.DepartmentID=Employ.DepartmentID;

--Display every department and employees.

select Departments.*,Employ.*
from Departments left join Employ
on  Departments.DepartmentID=Employ.DepartmentID;

--Show all projects with departments.

select Departments.*,Projects.*
from Departments left join Projects
on  Departments.DepartmentID=Projects.DepartmentID;

--Show every project assignment including projects without employees.

select Projects.ProjectID,Employ.EmployeeName
from Projects left join EmployeeProjects 
on Projects.ProjectID=EmployeeProjects.ProjectID
left join Employ
on EmployeeProjects.EmployeeID=Employ.EmployeeID;

--right join

--Show all departments even if there are no employees.

select Departments.*,Employ.EmployeeName
from Employ right join Departments
on Employ.DepartmentID=Departments.DepartmentID

--Show all projects even if no employee is assigned.

select Projects.ProjectName,Employ.EmployeeName
from EmployeeProjects right join Employ 
on EmployeeProjects.EmployeeId=Employ.EmployeeID
right join Projects
on EmployeeProjects.ProjectID=Projects.ProjectID

--Display every department and employees.

select Departments.DepartmentName,Employ.EmployeeName
from Employ right join Departments 
on Departments.DepartmentID=Employ.DEpartmentID;

--Show all projects with departments.

select  Projects.ProjectID,ProjectName,Departments.DepartmentName
from Departments right join Projects
on Departments.DepartmentID=Projects.DepartmentID;

--full join

--Show all employees and all departments.

select Departments.DepartmentName,Employ.EmployeeName
from Employ full join Departments
on Employ.DepartmentID=Departments.DepartmentID

--Show all departments and projects.

select  Projects.ProjectID,ProjectName,Departments.DepartmentName
from Departments full join  Projects
on Departments.DepartmentID=Projects.DepartmentID

--Display all employees and projects.

select Projects.ProjectName,Employ.EmployeeName
from EmployeeProjects full join Employ 
on EmployeeProjects.EmployeeId=Employ.EmployeeID
full join Projects
on EmployeeProjects.ProjectID=Projects.ProjectID;

--Show every department whether employees exist or not.

select Departments.departmentId,Employ.EmployeeName
from Departments full join Employ
on Departments.DepartmentId=Employ.DepartmentID;

--INTERMEDIATE ASSSIGNMENT

--inner join

--Show employees whose department is IT.

select Employ.EmployeeName,Departments.DepartmentName
from Departments inner join Employ
on Employ.DepartmentId=Departments.DepartmentID
where Departments.DepartmentName='IT'

--Display employees working on projects with budget above 200000.

select Employ.EmployeeName,Projects.ProjectName,Projects.Budget
from Employ inner join EmployeeProjects 
on Employ.EmployeeID=EmployeeProjects.EmployeeID
inner join Projects
on EmployeeProjects.ProjectID=Projects.ProjectID
where Projects.Budget>200000

--Show employee names, department names and project names.

SELECT Employ.EmployeeName,
       Departments.DepartmentName,
       Projects.ProjectName
FROM Employ
INNER JOIN Departments
ON Employ.DepartmentID = Departments.DepartmentID
INNER JOIN EmployeeProjects
ON Employ.EmployeeID = EmployeeProjects.EmployeeID
INNER JOIN Projects
ON EmployeeProjects.ProjectID = Projects.ProjectID;

--Display total employees in each department.

select count(Employ.EmployeeID) as total_Employes, Departments.DepartmentName
from Employ inner join Departments
on Employ.DepartmentID=Departments.DepartmentID
group by departments.DepartmentName

--Show average salary department-wise.

select avg(Employ.salary) as avg_salary, Departments.DepartmentName
from Employ inner join Departments
on Employ.DepartmentID=Departments.DepartmentID
group by departments.DepartmentName

--left join

--Find employees without departments.

select  Employ.EmployeeName
from Employ left join Departments
on Employ.DepartmentID=Departments.DepartmentID
where Departments.DepartmentID is null

--Find employees without projects.

select Employ.EmployeeName
from Employ left join EmployeeProjects
on EmployeeProjects.EmployeeId=Employ.EmployeeID
where EmployeeProjects.ProjectID is null

--Find departments without employees.

select Departments.DepartmentName
from Departments left join Employ
on Departments.DepartmentID=Employ.DepartmentID
where Employ.EmployeeID is null

--Find projects without departments.

select Projects.ProjectName
from Projects left join Departments
on Departments.DepartmentID=Projects.DepartmentID
where Departments.DepartmentID is null

--Show departments with total employees including zero employees.

select count(Employ.EmployeeID) as total_Employes, Departments.DepartmentName
from Departments left join Employ
on Employ.DepartmentID=Departments.DepartmentID
group by departments.DepartmentName

--right join

--Find departments having no employees.
 
 select Departments.DepartmentName,Employ.EmployeeName
 from Employ right join Departments
 on Departments.DepartmentID=Employ.DepartmentID
 where Employ.EMployeeName is null

 --Find projects without employees.

select Projects.ProjectName,Employ.EmployeeName
from EmployeeProjects right join Employ
on EmployeeProjects.EmployeeID=Employ.EmployeeID
right join Projects
on EmployeeProjects.ProjectId=Projects.ProjectID
where Employ.EmployeeName is null

--Show departments even if no projects exist.

 select Departments.DepartmentName,Projects.ProjectName
 from Projects right join Departments
 on Departments.DepartmentID=Projects.DepartmentID

 --Count employees in every department.

 select count(employ.EmployeeID) as count,departments.DepartmentName
 from Employ right join Departments
 on Employ.DepartmentID=Departments.DepartmentID
 group by Departments.DepartmentName

 --List every project whether employees are assigned or not.

 select Projects.ProjectName,Employ.EmployeeName
from EmployeeProjects right join Employ
on EmployeeProjects.EmployeeID=Employ.EmployeeID
right join Projects
on EmployeeProjects.ProjectId=Projects.ProjectID

--full join

--Display all departments and employees.

select Departments.DepartmentName,Employ.EmployeeName
from Departments full join Employ
on Employ.DepartmentID=Departments.DepartmentID

--Show unmatched employees.

select Departments.DepartmentName,Employ.EmployeeName
from Departments full join Employ
on Employ.DepartmentID=Departments.DepartmentID
where Departments.DepartmentID is null
 
--Show unmatched departments.

select Departments.DepartmentName,Employ.EmployeeName
from Departments full join Employ
on Employ.DepartmentID=Departments.DepartmentID
where Employ.EmployeeID is null

--Show all employees and departments with NULL handling.

select coalesce(employ.EmployeeName,'No Employ') as EmployName,coalesce(Departments.DepartmentName,'No Department') as DepartmentName
from Departments full join Employ
on Employ.DepartmentID=Departments.DepartmentID

--Display departments and projects including unmatched rows.

select  Projects.ProjectID,ProjectName,Departments.DepartmentName
from Departments full join  Projects
on Departments.DepartmentID=Projects.DepartmentID

--Advanced joins

--inner join

--Find highest-paid employee in every department.

select top 5 Employ.EmployeeName,Departments.DepartmentName
from Employ inner join Departments
on Employ.DepartmentID=Employ.DepartmentID
inner join(select DepartmentID,Max(SAlary) as max_salary
from EMploy 
group by DepartmentID) m
on Employ.DepartmentId=m.DepartmentID

--Find department having highest average salary.

select top 1
Departments.DepartmentName,Avg(salary) as avg_salary
from Employ inner join Departments
on Employ.DepartmentID=Departments.DepartmentID
group by Departments.DepartmentName
order by avg_salary desc

--Find employee working on highest-budget project.

select Employ.EmployeeName,Projects.ProjectName,Projects.Budget
from Employ inner join EmployeeProjects 
on Employ.EmployeeID=EmployeeProjects.EmployeeID
inner join  Projects
on EmployeeProjects.ProjectId=Projects.ProjectID
where Projects.Budget=(select Max(Budget) from Projects);

--Show managers and their employees.

select e.EmployeeName,m.EmployeeName as ManagerName
from Employ as e inner join Employ as m
on m.ManagerID=e.EmployeeId

--Find employees working on more than one project.

select Employ.EmployeeName,count(EmployeeProjects.EmployeeID) as count
from Employ inner join EmployeeProjects 
on Employ.EmployeeID=EmployeeProjects.EmployeeID
group by Employ.EmployeeID,Employ.EmployeeName
having count(EmployeeProjects.EmployeeID)>1

--left join

--Find employees not assigned to any project.

select Employ.EmployeeName
from Employ left join  EmployeeProjects
on Employ.EmployeeID=EmployeeProjects.EmployeeID
where EmployeeProjects.ProjectID is null

--finding departments having no projects

select Departments.DepartmentName
from Departments left join Projects
on Departments.DepartmentID=Projects.DepartmentID
where projects.ProjectID is null

--Find departments having employees but no projects.

select Employ.EmployeeName,Departments.DepartmentName
from Departments left join Employ 
on Departments.DEpartmentID=Employ.DepartmentID
left join Projects
on Departments.DepartmentID=Projects.DepartmentID
where Projects.ProjectID is null
and Employ.EmployeeID is not null

--Show employees with project count.

select Employ.EmployeeName,Count(EmployeeProjects.ProjectID)
from Employ  left join EmployeeProjects
on Employ.EmployeeID=EmployeeProjects.EmployeeID
group by Employ.EmployeeName,Employ.EmployeeID

--Show project count department-wise including zero.

select Departments.DepartmentName,Count(Projects.ProjectID)
from Departments left join Projects
on Departments.DepartmentID=Projects.DepartmentID
group by Departments.DepartmentName

--Right join

--Find projects without employees.

SELECT p.ProjectID, p.ProjectName
FROM EmployeeProjects ep
RIGHT JOIN Projects p
ON ep.ProjectID = p.ProjectID
WHERE ep.EmployeeID IS NULL;

--Find departments without projects.

SELECT d.DepartmentID, d.DepartmentName
FROM Projects p
RIGHT JOIN Departments d
ON p.DepartmentID = d.DepartmentID
WHERE p.ProjectID IS NULL;
 
--Find projects whose department doesn't exist.

SELECT p.ProjectID, p.ProjectName
FROM Departments d
RIGHT JOIN Projects p
ON d.DepartmentID = p.DepartmentID
WHERE d.DepartmentID IS NULL
and p.DepartmentID is not null

--Find orphan employee records.

SELECT e.EmployeeID,
       e.EmployeeName,
       e.DepartmentID
FROM Departments d
RIGHT JOIN Employ e
ON d.DepartmentID = e.DepartmentID
WHERE d.DepartmentID IS NULL
AND e.DepartmentID IS NOT NULL;

--Display every department and employee count.

SELECT d.DepartmentName,
       COUNT(e.EmployeeID) AS EmployeeCount
FROM Employ e
RIGHT JOIN Departments d
ON e.DepartmentID = d.DepartmentID
GROUP BY d.DepartmentID, d.DepartmentName;

--left anti join

-- 1. Find employees without departments

SELECT e.EmployeeID,
       e.EmployeeName
FROM Employ e
LEFT JOIN Departments d
ON e.DepartmentID = d.DepartmentID
WHERE d.DepartmentID IS NULL;


-- 2. Find departments without employees

SELECT d.DepartmentID,
       d.DepartmentName
FROM Departments d
LEFT JOIN Employ e
ON d.DepartmentID = e.DepartmentID
WHERE e.EmployeeID IS NULL;


-- 3. Find employees without projects

SELECT e.EmployeeID,
       e.EmployeeName
FROM Employ e
LEFT JOIN EmployeeProjects ep
ON e.EmployeeID = ep.EmployeeID
WHERE ep.ProjectID IS NULL;


-- 4. Find departments without projects

SELECT d.DepartmentID,
       d.DepartmentName
FROM Departments d
LEFT JOIN Projects p
ON d.DepartmentID = p.DepartmentID
WHERE p.ProjectID IS NULL;


-- 5. Find projects without departments

SELECT p.ProjectID,
       p.ProjectName
FROM Projects p
LEFT JOIN Departments d
ON p.DepartmentID = d.DepartmentID
WHERE d.DepartmentID IS NULL;

--right anti join

-- 1. Departments without employees

SELECT d.DepartmentID,
       d.DepartmentName
FROM Employ e
RIGHT JOIN Departments d
ON e.DepartmentID = d.DepartmentID
WHERE e.EmployeeID IS NULL;


-- 2. Projects without employees

SELECT p.ProjectID,
       p.ProjectName
FROM EmployeeProjects ep
RIGHT JOIN Projects p
ON ep.ProjectID = p.ProjectID
WHERE ep.EmployeeID IS NULL;


-- 3. Departments without projects

SELECT d.DepartmentID,
       d.DepartmentName
FROM Projects p
RIGHT JOIN Departments d
ON p.DepartmentID = d.DepartmentID
WHERE p.ProjectID IS NULL;


-- 4. Employees whose departments don't exist

SELECT e.EmployeeID,
       e.EmployeeName,
       e.DepartmentID
FROM Departments d
RIGHT JOIN Employ e
ON d.DepartmentID = e.DepartmentID
WHERE d.DepartmentID IS NULL
AND e.DepartmentID IS NOT NULL;


-- 5. Projects whose departments don't exist

SELECT p.ProjectID,
       p.ProjectName,
       p.DepartmentID
FROM Departments d
RIGHT JOIN Projects p
ON d.DepartmentID = p.DepartmentID
WHERE d.DepartmentID IS NULL
AND p.DepartmentID IS NOT NULL;

-- FULL ANTI

-- 1. Find all unmatched employees and departments

SELECT e.EmployeeID,
       e.EmployeeName,
       d.DepartmentID,
       d.DepartmentName
FROM Employ e
FULL JOIN Departments d
ON e.DepartmentID = d.DepartmentID
WHERE e.EmployeeID IS NULL
   OR d.DepartmentID IS NULL;


-- 2. Find all unmatched departments and employees

SELECT d.DepartmentID,
       d.DepartmentName,
       e.EmployeeID,
       e.EmployeeName
FROM Departments d
FULL JOIN Employ e
ON d.DepartmentID = e.DepartmentID
WHERE d.DepartmentID IS NULL
   OR e.EmployeeID IS NULL;


-- 3. Find projects without departments
--    AND departments without projects

SELECT p.ProjectID,
       p.ProjectName,
       p.DepartmentID AS ProjectDepartmentID,
       d.DepartmentID AS DepartmentID,
       d.DepartmentName
FROM Projects p
FULL JOIN Departments d
ON p.DepartmentID = d.DepartmentID
WHERE p.ProjectID IS NULL
   OR d.DepartmentID IS NULL;


-- 4. Find employees without projects
--    AND projects without employees

SELECT e.EmployeeID,
       e.EmployeeName,
       p.ProjectID,
       p.ProjectName
FROM Employ e
FULL JOIN EmployeeProjects ep
ON e.EmployeeID = ep.EmployeeID
FULL JOIN Projects p
ON ep.ProjectID = p.ProjectID
WHERE e.EmployeeID IS NULL
OR p.ProjectID IS NULL;


   


-- 5. Show all orphan records across Employees and Departments

SELECT e.EmployeeID,
       e.EmployeeName,
       e.DepartmentID AS EmployeeDepartmentID,
       d.DepartmentID AS DepartmentID,
       d.DepartmentName
FROM Employ e
FULL JOIN Departments d
ON e.DepartmentID = d.DepartmentID
WHERE (d.DepartmentID IS NULL AND e.DepartmentID IS NOT NULL)
   OR e.EmployeeID IS NULL;
















 
 

 
































