-- 1: Inserting Data with INSERT INTO
INSERT INTO Employees2 (EmployeeID, Name, Age, DepartmentID, Salary)
VALUES (6, 'Frank', 32, 2, 64000);

-- Multiple Inserts
INSERT INTO Employees2 (EmployeeID, Name, Age, DepartmentID, Salary)
VALUES (7, 'Grace', 29, 3, 70000),
       (8, 'Hannah', 26, 1, 54000);
       
SELECT * FROM Employees2;

-- 2: Updating Data with UPDATE
UPDATE Employees2
SET Age = 33
WHERE Name = 'Frank';

-- Multiple Updates
UPDATE Employees2
SET Salary = 66000, DepartmentID = 3
WHERE Name = 'Frank';

-- 3: Deleting Data with DELETE
DELETE FROM Employees
WHERE Name = 'Hannah';

-- Deleting All Rows: 
DELETE FROM Employees2;

SELECT * FROM Employees;

-- PRACTICE EXAMPLE

INSERT INTO Employees2 (EmployeeID, Name, Age, DepartmentID, Salary)
VALUES (9, 'Lan', 30, 2, 64000);

UPDATE Employees2
SET Salary = Salary + 5000 
WHERE DepartmentID = 1;

DELETE FROM Employees2
WHERE Salary < 55000;

--  4. Conditional Updates with CASE in UPDATE

SELECT * FROM Employees;

UPDATE Employees
SET Salary = CASE
                WHEN DepartmentID = 1 THEN Salary * 1.10
                WHEN DepartmentID = 2 THEN Salary * 1.08
                ELSE Salary * 1.05
            END;

-- 5. INSERT INTO with SELECT

CREATE TABLE EmployeesBackup (
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(50),
    Age INT,
    DepartmentID VARCHAR(50),
    Salary DECIMAL(10, 2)
);

INSERT INTO EmployeesBackup (EmployeeID, Name, Age, DepartmentID, Salary)
SELECT EmployeeID, Name, Age, DepartmentID, Salary
FROM Employees
WHERE DepartmentID = 3;

SELECT * FROM EmployeesBackup;

-- 6. Using DELETE with Joins
ALTER TABLE Employees
ADD Status VARCHAR(100) ;

update Employees
set Status = 'Inactive'
where DepartmentID is null;

DELETE Employees
FROM Employees
JOIN Departments ON Employees.DepartmentID = Departments.DepartmentID
WHERE Departments.Status = 'Inactive';

SELECT * FROM Employees;

-- 7. Bulk Updates with Subqueries

UPDATE Employees
SET DepartmentID = 99
WHERE Salary > (SELECT AVG(Salary) FROM Employees WHERE DepartmentID = Employees.DepartmentID);

