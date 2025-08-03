-- =================================================================
-- Problem: Write a query that prints a list of employee names for
--          employees having a salary greater than $2000 per month
--          who have been employees for less than 10 months. Sort
--          your result by ascending employee_id.
-- =================================================================

-- SQL Server Schema and Solution for "Employee Salaries"

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
-- This data includes the examples from the problem description plus others
-- to ensure the filtering logic is tested correctly.
INSERT INTO Employee (employee_id, name, months, salary) VALUES
(20, 'Angela', 8, 2210),    -- Meets criteria
(44, 'Michael', 7, 3878),   -- Meets criteria
(45, 'Todd', 5, 2344),      -- Meets criteria
(61, 'Joe', 9, 3575),       -- Meets criteria
(5, 'Samantha', 12, 3500),  -- Fails: months >= 10
(12, 'Rose', 8, 1900),      -- Fails: salary <= 2000
(15, 'Frank', 15, 5000);    -- Fails: months >= 10
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
WHERE
    salary > 2000 AND months < 10
ORDER BY
    employee_id ASC;