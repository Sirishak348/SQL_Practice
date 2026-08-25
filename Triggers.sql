CREATE DATABASE TriggerPractice;
GO

USE TriggerPractice;
GO

CREATE TABLE Employees
(
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(100),
    Salary DECIMAL(10,2),
    Department VARCHAR(50)
);
GO

INSERT INTO Employees
VALUES
(1, 'Rahul', 30000, 'IT'),
(2, 'Priya', 40000, 'HR'),          
(3, 'John', 50000, 'Finance');
GO

--creating log table

CREATE TABLE EmployeeLog
(
    LogID INT IDENTITY(1,1) PRIMARY KEY,
    EmployeeID INT,
    ActionType VARCHAR(20),
    ActionDate DATETIME DEFAULT GETDATE()
);
GO

--creation of trigger

CREATE TRIGGER trg_Employee_Insert
ON Employees
AFTER INSERT
AS
BEGIN

    INSERT INTO EmployeeLog
    (
        EmployeeID,
        ActionType
    )
    SELECT
        EmployeeID,
        'INSERT'
    FROM inserted;

END;

INSERT INTO Employees
VALUES
(4, 'David', 45000, 'Sales');

GO

SELECT *
FROM EmployeeLog;

--After update

CREATE TRIGGER trg_Employee_Update
ON Employees
AFTER UPDATE
AS
BEGIN

    INSERT INTO EmployeeLog
    (
        EmployeeID,
        ActionType
    )
    SELECT
        EmployeeID,
        'UPDATE'
    FROM inserted;

END;
GO

UPDATE Employees
SET Salary = 60000
WHERE EmployeeID = 1;

--After Delete

CREATE TRIGGER trg_Employee_Delete
ON Employees
AFTER DELETE
AS
BEGIN

    INSERT INTO EmployeeLog
    (
        EmployeeID,
        ActionType
    )
    SELECT
        EmployeeID,
        'DELETE'
    FROM deleted;

END;
GO
