-- =================================================================
-- Problem: Report the name and bonus amount of each employee with
--          a bonus less than 1000.
-- =================================================================

-- SQL Server Schema and Solution for "Employee Bonus"

-- Drop tables in the correct order to avoid foreign key errors
IF OBJECT_ID('dbo.Bonus', 'U') IS NOT NULL
    DROP TABLE dbo.Bonus;
GO
IF OBJECT_ID('dbo.Employee', 'U') IS NOT NULL
    DROP TABLE dbo.Employee;
GO

-- Create the Employee table
-- This table stores information about each employee.
CREATE TABLE Employee (
    empId INT PRIMARY KEY,
    name VARCHAR(255),
    supervisor INT,
    salary INT
);
GO

-- Create the Bonus table
-- This table stores bonus information for employees.
CREATE TABLE Bonus (
    empId INT PRIMARY KEY,
    bonus INT,
    FOREIGN KEY (empId) REFERENCES Employee(empId)
);
GO

-- Insert sample data into the Employee table
INSERT INTO Employee (empId, name, supervisor, salary) VALUES
(3, 'Brad', NULL, 4000),
(1, 'John', 3, 1000),
(2, 'Dan', 3, 2000),
(4, 'Thomas', 3, 4000);
GO

-- Insert sample data into the Bonus table
INSERT INTO Bonus (empId, bonus) VALUES
(2, 500),
(4, 2000);
GO

-- Verify the data has been inserted correctly
SELECT * FROM Employee;
SELECT * FROM Bonus;
GO

-- ====================
-- Solution Query
--=====================

/* Write your T-SQL query statement below */
SELECT 
    name, bonus
FROM
    Employee E
LEFT JOIN
    Bonus B ON E.empId = B.empId
WHERE
    B.bonus < 1000 OR B.bonus IS NULL;