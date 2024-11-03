CREATE DATABASE PracticeDB;

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(50),
    Age INT,
    Department VARCHAR(50),
    Salary DECIMAL(10, 2)
);

INSERT INTO Employees (EmployeeID, Name, Age, Department, Salary) VALUES
(1, 'Alice', 29, 'Sales', 55000),
(2, 'Bob', 34, 'HR', 62000),
(3, 'Charlie', 28, 'IT', 75000),
(4, 'David', 31, 'Sales', 58000),
(5, 'Emma', 27, 'IT', 78000);

SELECT * FROM Employees;

SELECT Name, Salary FROM Employees;

SELECT * FROM Employees WHERE Age > 30;

SELECT * FROM Employees WHERE Department = 'Sales';

SELECT * FROM Employees WHERE Department = 'Sales' AND Age > 30;

SELECT * FROM Employees WHERE Department = 'IT' OR Age < 30;

SELECT * FROM Employees WHERE NOT Department = 'HR';

-- 1. Aggregate Functions

SELECT COUNT(*) AS TotalEmployees FROM Employees;
SELECT SUM(Salary) AS TotalSalary FROM Employees;
SELECT AVG(Salary) AS AverageSalary FROM Employees;
SELECT MAX(Salary) AS MaxSalary, MIN(Salary) AS MinSalary FROM Employees;

-- 2. GROUP BY Clause

SELECT Department, SUM(Salary) AS TotalSalary
FROM Employees
GROUP BY Department;

-- 4. HAVING Clause

SELECT Department, SUM(Salary) AS TotalSalary
FROM Employees
GROUP BY Department
HAVING SUM(Salary) > 60000;

-- 5. ORDER BY Clause

SELECT * FROM Employees ORDER BY Salary;
SELECT * FROM Employees ORDER BY Salary DESC;

-- Combining ORDER BY with Grouped Data

SELECT Department, SUM(Salary) AS TotalSalary
FROM Employees
GROUP BY Department
ORDER BY TotalSalary DESC;

-- Count the Number of Employees in Each Department
SELECT Department, COUNT(*) AS EmployeeCount
FROM Employees
GROUP BY Department;

-- Calculate the Average Salary by Department

SELECT Department, AVG(Salary) AS AverageSalary
FROM Employees
GROUP BY Department;

-- Find Departments with a Total Salary Less Than 70,000

SELECT Department, SUM(Salary) AS TotalSalary
FROM Employees
GROUP BY Department
HAVING SUM(Salary) < 70000;

-- SORT Employees by descending order

SELECT * FROM Employees
ORDER BY Age DESC;




















