CREATE TABLE Employe_Details (
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(50),
    Department VARCHAR(30),
    Salary DECIMAL(10,2),
    JoinDate DATE,
    City VARCHAR(30)
);

INSERT INTO Employe_Details VALUES
(101, 'John Smith', 'IT', 55000, '2022-03-15', 'Hyderabad'),
(102, 'Emma Watson', 'HR', 48000, '2021-07-20', 'Chennai'),
(103, 'David Miller', 'Finance', 62000, '2020-11-10', 'Mumbai'),
(104, 'Sophia Brown', 'IT', 58000, '2023-01-05', 'Bangalore'),
(105, 'Michael Clark', 'Sales', 51000, '2019-09-25', 'Delhi'),
(106, 'Olivia Davis', 'HR', 47000, '2024-02-12', 'Hyderabad'),
(107, 'James Wilson', 'Finance', 67500, '2022-06-18', 'Pune'),
(108, 'Emily Taylor', 'Sales', 52500, '2023-08-30', 'Chennai');

select * from Employe_Details;

--display all the Employees along with the  total salary of all employees using a window function

select EmployeeName,Salary,sum(Salary) OVER() as total_salary
FROM Employe_Details;

-- Employees along with the  total salary of all employees using a window function

select EmployeeName,Salary,avg(Salary) OVER() as total_salary
FROM Employe_Details;

--display each employee with total salary of their department

select EmployeeName,Salary,sum(Salary) over(Partition by Department) as total
from Employe_Details;

--display each employee with avg salary of their department

select EmployeeName,Salary,avg(Salary) over(Partition by Department) as total
from Employe_Details;

--display each employee with max salary in their department

select EmployeeName,Department,Max(Salary) over(partition by Department) as max
from Employe_Details;

--display each employee with min salary in their department

select EmployeeName,Department,min(Salary) over(partition by Department) as min
from Employe_Details;

--asssign a rank to each Employee Acc to Salary from high to low

select EmployeeName,Salary,Row_Number() over(order by Salary desc) as row_number
from Employe_Details;

--assign a row number within each department based on salary

select EmployeeName,Salary,Department ,Row_Number()over(partition by Department order by Salary desc) as row_number
from Employe_Details;

--rank all the employees based on salary from high to low

select EmployeeName,Salary,Rank() over(order by Salary desc) as rank
from Employe_Details;

--rank all the Employees using dense rank

select EmployeeName,Salary,Dense_Rank() over(order by Salary desc) as Denserank
from Employe_Details;

--compare between rank() and dense_rank()

select EmployeeName,Salary,Rank() over(order by Salary desc) as rank,
Dense_Rank() over(order by Salary desc) as Denserank
from Employe_Details;

--divide the Employees into 4 groups

select EmployeeName,Salary,ntile(4) over (order by Salary asc) as ntile
from Employe_Details;

--divide the Employees into 2 groups with in department

select EmployeeName,Department,Salary,ntile(2) over (partition by Department order by Salary asc) as ntile
from Employe_Details;

--display the previous Employes Salry usimg LAG()

select EmployeeName,Salary,lag(Salary) over(order by EmployeeID) as lag
from Employe_Details;

--display the next Employes Salary usimg LEAD()

select EmployeeName,Salary,lead(Salary) over(order by EmployeeID) as lead
from Employe_Details;


--display the firt Employes Salary using first_value

select EmployeeName,Salary,First_Value(Salary) over(order by EmployeeId) as fv
from Employe_Details;

--display the last Employes Salary using last_value

select EmployeeName,Salary,Last_Value(Salary) over(order by EmployeeId) as lv
from Employe_Details;

--calculate the running total separately for each Department

select EmployeeName,Salary,sum(Salary) over(partition by Department order by EmployeeID
                                           Rows between unbounded preceding and current row) as running_total
from Employe_Details;


--calculate the sum of current salary and previous Salary

select EmployeeName,Salary,sum(Salary) over(partition by Department order by EmployeeID
                                           Rows between 1 preceding and current row) as prev_total
from Employe_Details;


--calculate the sum of current salary and next Salary

select EmployeeName,Salary,sum(Salary) over(partition by Department order by EmployeeID
                                           Rows between current row and 1 following) as next_total
from Employe_Details;

--percentage ranking

select EmployeeName,Salary,Percent_Rank() over(order by Salary desc) as Percent_rank
from Employe_Details;

--cume_dist

select EmployeeName,Salary,cume_dist() over(order by Salary) as cume_dist
from Employe_Details;






                                      















