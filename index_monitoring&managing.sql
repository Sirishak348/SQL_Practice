--finding all the indexes on table

CREATE TABLE Employeess
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

INSERT INTO Employeess
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

select *
from sys.indexes
where object_id=object_id('Employeess');

--view all the tables in database

select * from
sys.tables;

--view all the indexes in ddatabase

select *
from sys.indexes;

select *
from Employeess
where Salary=90000;

select * 
from sys.dm_db_index_usage_stats
where object_id=object_id('Employeess'); --used for monitoring index usage

--monitor missing indexes

select * 
from sys.dm_db_missing_index_details
where database_id=DB_Id() And object_id=object_id('Employeess');

select * from Employees wgere City='Hyderabad';

--monitor duplicated indexes

create Nonclustered index index1 on Employeess(Department);

create Nonclustered index index2 on Employeess(Department);

select * 
from sys.indexes
where object_id=object_id('Employeess');

--update statistics

SELECT
    name AS StatisticsName,
    STATS_DATE(object_id, stats_id) AS LastUpdated
FROM sys.stats
WHERE object_id = OBJECT_ID('Employeess');

--how to update statistics
 
 update Statistics Employeess _WA_Sys_00000005_3A81B327

 --update all statistics of one table

 update statistics Employeess

 --update all the statistics in database

 exec sp_updatestats

 --monitor index fragmentation

 select  * from sys.dm_db_index_physical_stats(DB_ID(),object_id('Employeess'),NULL,NULL,'Limited');

 --Reorganize

 alter index index1 on Employeess Reorganize;  --used this metjod when avg_fragmentation between 10-30

 --Rebuild

  alter index index1 on Employeess Rebuild;    --used this metjod when avg_fragmentation is greater than 30











