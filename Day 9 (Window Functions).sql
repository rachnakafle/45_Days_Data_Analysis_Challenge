CREATE TABLE LUEmployees (
    EmployeeID INT,
    Name VARCHAR(50),
    DepartmentID INT,
    Salary DECIMAL(10, 2),
    JoiningDate DATE
);

INSERT INTO LUEmployees (EmployeeID, Name, DepartmentID, Salary, JoiningDate) VALUES
(1, 'Alice', 1, 55000, '2021-02-15'),
(2, 'Bob', 2, 62000, '2021-05-22'),
(3, 'Charlie', 1, 75000, '2022-01-10'),
(4, 'David', 2, 58000, '2021-07-01'),
(5, 'Emma', 3, 78000, '2021-03-18');

SELECT * FROM LUEmployees;

-- ROW NUMBERING :  Assigning a rank based on salary in descending order.
SELECT 
	EmployeeID,
    Name,
    Salary,
    ROW_NUMBER() OVER (ORDER BY Salary Desc) AS RowNumber
FROM Employees;

/*  
RANKING FUNCTIONS
    ROW_NUMBER(): Assigns a unique sequential number to each row.
    RANK(): Assigns the same rank to duplicate values but skips subsequent numbers.
    DENSE_RANK(): Similar to RANK() but does not skip numbers after duplicates.
*/ 
SELECT 
    EmployeeID,
    Name,
    Salary,
    RANK() OVER (ORDER BY Salary DESC) AS RankOrder,
    DENSE_RANK() OVER (ORDER BY Salary DESC) AS DenseRank
FROM Employees;

-- Aggregation with Window Functions

-- Cumulative Salary Total by Department
SELECT 
    DepartmentID,
    Name,
    Salary,
    SUM(Salary) OVER (PARTITION BY DepartmentID ORDER BY Salary) AS CumulativeSalary
FROM Employees;

-- The LEAD() and LAG() functions lets us access values from other rows.

SELECT 
    EmployeeID,
    Name,
    Salary,
    LAG(Salary, 1) OVER (ORDER BY Salary) AS PreviousSalary,
    LEAD(Salary, 1) OVER (ORDER BY Salary) AS NextSalary
FROM Employees;

-- Segment Data with NTILE : The NTILE(n) function divides data into n segments, which is useful for creating percentiles.

SELECT 
    EmployeeID,
    Name,
    Salary,
    NTILE(4) OVER (ORDER BY Salary DESC) AS SalaryQuartile
FROM Employees;

