CREATE DATABASE IndexPractice;
GO

USE IndexPractice;
GO

CREATE TABLE Employees
(
    EmployeeID INT IDENTITY(1,1),
    EmployeeName VARCHAR(50),
    Email VARCHAR(100),
    Department VARCHAR(50),
    Salary INT,
    City VARCHAR(50),
    Age INT,
    IsActive BIT
);
INSERT INTO Employees
(EmployeeName, Email, Department, Salary, City, Age, IsActive)
VALUES
('Rahul','rahul@gmail.com','IT',70000,'Hyderabad',25,1),
('Priya','priya@gmail.com','HR',50000,'Chennai',28,1),
('Arjun','arjun@gmail.com','IT',80000,'Bangalore',30,1),
('Sneha','sneha@gmail.com','Finance',65000,'Hyderabad',26,1),
('Kiran','kiran@gmail.com','IT',90000,'Chennai',32,1),
('Anjali','anjali@gmail.com','HR',55000,'Bangalore',27,0),
('Ravi','ravi@gmail.com','Finance',75000,'Hyderabad',35,1),
('Meena','meena@gmail.com','IT',85000,'Vijayawada',29,1),
('Suresh','suresh@gmail.com','Sales',60000,'Chennai',40,0),
('Divya','divya@gmail.com','Sales',62000,'Hyderabad',31,1);

--chech whether Employee is currently a heap

select *
from sys.indexes
where object_id=object_id('Employees');

select * 
from Employees
where EmployeeID=5;

--creating clustered index on EmployeeId

create clustered index cluster_index on Employees(EmployeeID);

drop index cluster_index on Employees;

create clustered index cluster_index1 on Employees(Department); --we cannot creater mutiple clustered indexes--

--Non clustered Index

create nonclustered index Noncluster_index on Employees(Department);

create nonclustered index Noncluster_index1 on Employees(Employeename); --we can create multiple Noncluster indexes for a table--

--unique index

create unique nonclustered index unique_index on Employees(Email);

--try to insert duplicate email

insert into Employees (EmployeeName, Email, Department, Salary, City, Age, IsActive)
values('Rahul','rahul@gmail.com','IT',70000,'Hyderabad',25,1); --Error occured

insert into Employees (EmployeeName, Email, Department, Salary, City, Age, IsActive)
values('Rahul','siri@gmail.com','IT',70000,'Hyderabad',25,1); --no error

--filtered index

create nonclustered index filtered_index on Employees(Department)
where isactive=1;    

--composite index

create nonclustered index Noncluster_index_composite on Employees(Department,city);

select * from Employees
where department='IT'
and city='chennai';     --In composite index left most prefix rule is used

--column store

CREATE TABLE Sales
(
    SaleID INT,
    ProductID INT,
    CustomerID INT,
    SaleDate DATE,
    Quantity INT,
    Amount DECIMAL(10,2),
    Region VARCHAR(30)
);

INSERT INTO Sales
VALUES
(1,101,201,'2026-01-01',2,500,'South'),
(2,102,202,'2026-01-02',5,1200,'North'),
(3,103,203,'2026-01-03',3,800,'South'),
(4,101,204,'2026-01-04',7,1500,'East'),
(5,104,205,'2026-01-05',4,900,'South');

create clustered columnstore index ccl on Sales;

drop index ccl on sales;

select *
from sys.indexes
where object_id=object_id('Sales');

create nonclustered columnstore index nccl on Sales(productID); --we cannot create the multiple column store indexes for a  table














