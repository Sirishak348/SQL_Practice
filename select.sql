CREATE TABLE Employees (
    emp_id INT,
    emp_name VARCHAR(50),
    department VARCHAR(50),
    salary INT,
    city VARCHAR(50),
    experience INT
);
--using INSERT--
INSERT INTO Employees VALUES
(101, 'Rahul', 'IT', 75000, 'Hyderabad', 5),
(102, 'Anjali', 'HR', 45000, 'Chennai', 3),
(103, 'Kiran', 'IT', 82000, 'Bangalore', 6),
(104, 'Sneha', 'Finance', 67000, 'Hyderabad', 4),
(105, 'Aman', 'HR', 39000, 'Pune', 2),
(106, 'Ravi', 'Finance', 91000, 'Mumbai', 8),
(107, 'Divya', 'IT', 55000, 'Chennai', 3),
(108, 'Meena', 'Sales', 48000, 'Bangalore', 2),
(109, 'Arjun', 'Sales', 61000, 'Hyderabad', 5),
(110, 'Pooja', 'IT', 73000, 'Mumbai', 4),
(111, 'Vikas', 'HR', 52000, 'Pune', 3),
(112, 'Nisha', 'Finance', 88000, 'Bangalore', 7),
(113, 'Tarun', 'Sales', 46000, 'Chennai', 2),
(114, 'Kavya', 'IT', 97000, 'Hyderabad', 9),
(115, 'Manoj', 'Finance', 58000, 'Mumbai', 4);
--select statement--
select * from EMPLOYEES;
select emp_name,salary from Employees;
select * from Employees where department='IT';
select emp_name, experience from Employees;
--where clause--
select * from Employees where salary>70000;
select * from Employees where city='Hyderabad';
select * from  Employees where experience<4;
select * from Employees where department='Finance';
select * from Employees where salary='52000';
--Groupby--
select department,sum(salary) as total_salary
from Employees 
Group by department;
select city,count(*)
from Employees 
group by city;
select department,Max(salary)
from Employees 
group by department;
select department,Min(experience)
from Employees 
group by department;
--having--
select department,count(*) as count
from Employees
group by department
having count>3;
select department,Avg(salary) as avg_salary
from Employees 
group by department 
having avg_salary>60000;
select city,count(emp_name) as count
from Employees 
group by city 
having count>2;
select department,sum(salary) as total_salary
from Employees 
group by department 
having total_salary>200000;
select department,Max(salary) as max_salary
from Employees 
group by department 
having max_salary>90000
--top--
select *
from Employees 
order by salary desc
fetch first 5 rows only;
select *
from Employees 
order by  experience desc
fetch first 3 rows only;
select salary 
from Employees 
where department='Finance'
order by salary desc
fetch first 2 rows only;
select *
from Employees 
where city='Hyderabad'
fetch first 4 rows only;
select * 
from Employees 
order by salary desc 
fetch first row only;
--Distinct--
select distinct department
from Employees;
select distinct city
from Employees;
select distinct salary
from Employees;
select distinct department,city
from Employees;
select distinct EXPERIENCE
from Employees;
--comparision operator--
select *
from Employees 
where salary>=80000
select *
from Employees 
where experience<=3;
select *
from Employees 
where salary <>45000;
select *
from Employees 
where salary<50000;
select *
from Employees 
where experience>5;
--logical operators--
select *
from Employees 
where department='IT' and salary>=80000;
select *
from Employees 
where city='Hyderabad' or city='Bangalore';
select *
from Employees 
where department='HR' and experience<3;
select *
from Employees 
where salary>60000 or experience>6;
select *
from Employees 
where not department='Sales';
--membership operators--
select *
from Employees 
where city in('Hyderabad','Mumbai');
select *
from Employees 
where department in('IT','Finance');
select *
from Employees 
where city not in('Chennai','Pune');
select *
from Employees 
where salary in(45000,75000,91000);
select *
from Employees 
where department not in('HR','Sales');
--Between operator--
select *
from Employees 
where salary Between 50000 and 80000;
select *
from Employees 
where experience between 3 and 6;
select *
from Employees 
where emp_id Between 105 and 112;
select *
from Employees 
where salary  not Between 40000 and 60000;
--like operator--
select *
from Employees 
where emp_name like 'R%';
select *
from Employees 
where emp_name like '%a';
select *
from Employees 
where emp_name like '%v%';
select *
from Employees 
where city like 'B%';
select *
from Employees 
where department like '%s';















