CREATE DATABASE StoredProcedurePractice;
GO

USE StoredProcedurePractice;
GO

CREATE TABLE Customers
(
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100),
    Country VARCHAR(50),
    Age INT
);
GO

INSERT INTO Customers VALUES
(1, 'Rahul', 'India', 22),
(2, 'Priya', 'India', 25),
(3, 'John', 'USA', 30),
(4, 'David', 'UK', 28),
(5, 'Sara', 'USA', 24);
GO

--creating stored procedure

CREATE PROCEDURE GetAllCustomers
AS
BEGIN
    SELECT *
    FROM Customers;
END;
GO

--executing

EXEC GetAllCustomers;

--stored procedure with parameter

CREATE PROCEDURE GetCustomersByCountry
    @Country VARCHAR(50)
AS
BEGIN
    SELECT CustomerID, CustomerName, Country, Age
    FROM Customers
    WHERE Country = @Country;
END;
GO

EXEC GetCustomersByCountry @Country = 'India';

--default parameter

CREATE PROCEDURE GetCustomers
    @Country VARCHAR(50) = 'India'
AS
BEGIN
    SELECT *
    FROM Customers
    WHERE Country = @Country;
END;
GO

--multiple statements

CREATE PROCEDURE CustomerSummary
    @Country VARCHAR(50)
AS
BEGIN

    SELECT *
    FROM Customers
    WHERE Country = @Country;

    SELECT COUNT(*) AS TotalCustomers
    FROM Customers
    WHERE Country = @Country;

END;
GO

EXEC CustomerSummary @Country='India';

--variables

CREATE PROCEDURE GetCustomerCount
AS
BEGIN

    DECLARE @TotalCustomers INT;

    SELECT @TotalCustomers = COUNT(*)
    FROM Customers;

    PRINT 'Total Customers: ' + CAST(@TotalCustomers AS VARCHAR(10));

END;
GO

EXEC GetCustomerCount;

--If else

CREATE PROCEDURE CheckCustomerCount
AS
BEGIN

    DECLARE @TotalCustomers INT;

    SELECT @TotalCustomers = COUNT(*)
    FROM Customers;

    IF @TotalCustomers > 3
        PRINT 'More than 3 customers exist';
    ELSE
        PRINT '3 or fewer customers exist';

END;
GO

EXEC CheckCustomerCount;

--Try Catch

CREATE PROCEDURE TestErrorHandling
AS
BEGIN

    BEGIN TRY

        SELECT 10 / 0 AS Result;

    END TRY

    BEGIN CATCH

        PRINT 'An error occurred';
        PRINT ERROR_MESSAGE();

    END CATCH

END;
GO

EXEC TestErrorHandling;