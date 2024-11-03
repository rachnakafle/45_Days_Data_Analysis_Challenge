CREATE TABLE Employees2 (
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(50),
    Age INT,
    DepartmentID INT,
    Salary DECIMAL(10, 2)
);

INSERT INTO Employees2 (EmployeeID, Name, Age, DepartmentID, Salary) VALUES
(1, 'Alice', 29, 1, 55000),
(2, 'Bob', 34, 2, 62000),
(3, 'Charlie', 28, NULL, 75000),
(4, 'David', 31, 1, 58000),
(5, 'Emma', 27, 3, 78000);


INSERT INTO Employees (EmployeeID, Name, Age, DepartmentID, Salary) VALUES (1, 'Alice', 29, 1, 55000), (2, 'Bob', 34, 2, 62000), (3, 'Charlie', 28, NULL, 75000), (4, 'David', 31, 1, 58000), (5, 'Emma', 27, 3, 78000)


DESCRIBE Employees;

ALTER TABLE Employees
ADD COLUMN DepartmentID INT;

SELECT * FROM Employees2;

INSERT INTO Employees (EmployeeID, Name, Age, DepartmentID, Salary) VALUES
(1, 'Alice', 29, 1, 55000),
(2, 'Bob', 34, 2, 62000),
(3, 'Charlie', 28, NULL, 75000),
(4, 'David', 31, 1, 58000),
(5, 'Emma', 27, 3, 78000);

CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50)
);
INSERT INTO Departments (DepartmentID, DepartmentName) VALUES
(1, 'Sales'),
(2, 'HR'),
(3, 'IT'),
(4, 'Marketing');
SELECT * FROM Departments;

-- TYPES OF JOINS : 1. INNER JOIN & 2. OUTER JOIN

--  1. INNER JOIN

SELECT Employees2.Name, Departments.DepartmentName
FROM Employees2
INNER JOIN Departments ON Employees2.DepartmentID = Departments.DepartmentID;

-- 2. LEFT JOIN

SELECT Employees2.Name, Departments.DepartmentName
FROM Employees2
LEFT JOIN Departments ON Employees2.DepartmentID = Departments.DepartmentID;

-- 3. RIGHT JOIN
SELECT Employees2.Name, Departments.DepartmentName
FROM Employees2
RIGHT JOIN Departments ON Employees2.DepartmentID = Departments.DepartmentID;

-- 4. FULL JOIN
SELECT Employees2.Name, Departments.DepartmentName
FROM Employees2
FULL JOIN Departments ON Employees2.DepartmentID = Departments.DepartmentID;

DESCRIBE Employees2;

SELECT Employees2.Name, Departments.DepartmentName
FROM Employees2
FULL JOIN Departments ON Employees2.DepartmentID = Departments.DepartmentID
LIMIT 0, 1000;


-- Subqueries and Nested Queries

SELECT AVG(Salary) FROM Employees;

-- SUB QUERY
SELECT Name, Salary
FROM Employees
WHERE Salary > (SELECT AVG(Salary) FROM Employees);

-- Nested Query in FROM Clause

SELECT DepartmentID, AVG(Salary) AS AvgSalary
FROM Employees
GROUP BY DepartmentID
HAVING AVG(Salary) > (SELECT AVG(Salary) FROM Employees);

-- 4. UNION and UNION ALL

-- The UNION operator combines the results of two queries. UNION removes duplicates, while UNION ALL includes all rows.

-- Combine Employees with External Contractors

CREATE TABLE Contractors (
    ContractorID INT PRIMARY KEY,
    Name VARCHAR(50),
    Project VARCHAR(50),
    Salary DECIMAL(10, 2)
);

INSERT INTO Contractors (ContractorID, Name, Project, Salary) VALUES
(1, 'Jake', 'Sales Support', 50000),
(2, 'Lily', 'IT Support', 60000);

SELECT Name FROM Employees2
UNION
SELECT Name FROM Contractors;

-- UNION ALL to Include All Rows, Including Duplicates:
SELECT Name FROM Employees
UNION ALL
SELECT Name FROM Contractors;

