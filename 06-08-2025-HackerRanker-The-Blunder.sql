-- =================================================================
-- Problem: Samantha made a mistake by calculating the average salary
--          after removing all the zeros from the salary figures.
--          Find the difference between the actual average salary and
--          the miscalculated average salary, and round it up to the
--          next integer.
-- =================================================================

-- SQL Server Schema and Solution for "The Blunder"

-- Drop the table if it already exists to ensure a clean setup
IF OBJECT_ID('dbo.EMPLOYEES', 'U') IS NOT NULL
    DROP TABLE dbo.EMPLOYEES;
GO

-- Create the EMPLOYEES table
-- This table stores employee information, including their salary.
CREATE TABLE EMPLOYEES (
    ID INT PRIMARY KEY,
    Name VARCHAR(255),
    Salary INT
);
GO

-- Insert sample data into the EMPLOYEES table
INSERT INTO EMPLOYEES (ID, Name, Salary) VALUES
(1, 'Kristeen', 1420),
(2, 'Ashley', 2006),
(3, 'Julia', 2210),
(4, 'Maria', 3000);
GO

-- Verify that the data has been inserted correctly
SELECT * FROM EMPLOYEES;
GO

-- =======================
-- Solution Query
-- =======================

/* Write your T-SQL query statement below */
SELECT
    CEILING(
        AVG(CAST(Salary AS DECIMAL)) - AVG(CAST(REPLACE(CAST(Salary AS VARCHAR), '0', '') AS DECIMAL))
    ) AS SalaryError
FROM
    EMPLOYEES;