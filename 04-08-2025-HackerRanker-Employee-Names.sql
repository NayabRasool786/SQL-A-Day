-- =================================================================
-- Problem: Write a query that prints a list of employee names
--          (i.e.: the name attribute) from the Employee table
--          in alphabetical order.
-- =================================================================

-- SQL Server Schema and Solution for "Employee Names"

-- Drop the table if it already exists to ensure a clean setup
IF OBJECT_ID('dbo.Employee', 'U') IS NOT NULL
    DROP TABLE dbo.Employee;
GO

-- Create the Employee table
-- This table stores employee data for a company.
CREATE TABLE Employee (
    employee_id INT PRIMARY KEY,
    name VARCHAR(255),
    months INT,
    salary INT
);
GO

-- Insert sample data into the Employee table
-- This data is based on the sample output provided in the problem.
INSERT INTO Employee (employee_id, name, months, salary) VALUES
(1, 'Angela', 12, 4500),
(2, 'Bonnie', 6, 3000),
(3, 'Frank', 24, 6000),
(4, 'Joe', 18, 5500),
(5, 'Kimberly', 3, 2500),
(6, 'Lisa', 9, 4000),
(7, 'Michael', 36, 8000),
(8, 'Patrick', 15, 5000),
(9, 'Rose', 20, 5800),
(10, 'Todd', 8, 3500);
GO

-- Verify that the data has been inserted correctly
SELECT * FROM Employee;
GO

-- =======================
-- Solution Query
-- =======================

/* Write your T-SQL query statement below */
SELECT
    name
FROM
    Employee
ORDER BY
    name ASC;