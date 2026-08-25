
-- CREATE TABLES

CREATE TABLE Teams
(
    TeamID INT PRIMARY KEY,
    TeamName VARCHAR(30)
);

INSERT INTO Teams VALUES
(1,'Development'),
(2,'Testing'),
(3,'Support');

CREATE TABLE Staff
(
    StaffID INT PRIMARY KEY,
    StaffName VARCHAR(30),
    Income INT,
    TeamID INT
);

INSERT INTO Staff VALUES
(101,'Amit',45000,1),
(102,'Neha',65000,2),
(103,'Kiran',75000,2),
(104,'Deepa',55000,3),
(105,'Rahul',85000,2),
(106,'Anil',35000,1);


-- SCALAR SUBQUERY

-- Q1. Find staff earning more than the average income.

SELECT *
FROM Staff
WHERE Income >
(
    SELECT AVG(Income)
    FROM Staff
);

-- Q2. Find staff earning the highest income.

SELECT *
FROM Staff
WHERE Income =
(
    SELECT MAX(Income)
    FROM Staff
);

-- ROW SUBQUERY

-- Q3. Find staff having the same income and team as Neha.

SELECT *
FROM Staff
WHERE Income =
(
    SELECT Income
    FROM Staff
    WHERE StaffName='Neha'
)
AND TeamID =
(
    SELECT TeamID
    FROM Staff
    WHERE StaffName='Neha'
);

-- SUBQUERY IN WHERE

-- Q4. Find staff working in the Testing team.

SELECT *
FROM Staff
WHERE TeamID =
(
    SELECT TeamID
    FROM Teams
    WHERE TeamName='Testing'
);

-- IN OPERATOR

-- Q5. Find staff working in Development or Testing.

SELECT *
FROM Staff
WHERE TeamID IN
(
    SELECT TeamID
    FROM Teams
    WHERE TeamName IN ('Development','Testing')
);

-- ANY OPERATOR

-- Q6. Find staff earning more than ANY staff member in Development.

SELECT *
FROM Staff
WHERE Income > ANY
(
    SELECT Income
    FROM Staff
    WHERE TeamID=1
);


-- ALL OPERATOR

-- Q7. Find staff earning more than ALL staff members in Development.

SELECT *
FROM Staff
WHERE Income > ALL
(
    SELECT Income
    FROM Staff
    WHERE TeamID=1
);


-- EXISTS

-- Q8. Display teams that have staff.

SELECT *
FROM Teams t
WHERE EXISTS
(
    SELECT *
    FROM Staff s
    WHERE s.TeamID=t.TeamID
);


-- NOT EXISTS


-- Q9. Display teams that do not have staff.

SELECT *
FROM Teams t
WHERE NOT EXISTS
(
    SELECT *
    FROM Staff s
    WHERE s.TeamID=t.TeamID
);


-- CORRELATED SUBQUERY

-- Q10. Find staff earning more than the average income of their own team.

SELECT *
FROM Staff s
WHERE Income >
(
    SELECT AVG(Income)
    FROM Staff
    WHERE TeamID=s.TeamID
);

-- Q11. Find the highest-paid staff member in each team.

SELECT *
FROM Staff s
WHERE Income =
(
    SELECT MAX(Income)
    FROM Staff
    WHERE TeamID=s.TeamID
);