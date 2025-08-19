-- =================================================================
-- Problem: Write a solution to find managers with at least five
--          direct reports.
-- =================================================================

-- SQL Server Schema and Solution for "Managers with at Least 5 Direct Reports"

-- Drop the table if it already exists to ensure a clean setup
IF OBJECT_ID('dbo.Employee', 'U') IS NOT NULL
    DROP TABLE dbo.Employee;
GO

-- Create the Employee table
-- This table stores information about employees and their managers.
CREATE TABLE Employee (
    id INT PRIMARY KEY,
    name VARCHAR(255),
    department VARCHAR(255),
    managerId INT
);
GO

-- Insert sample data into the Employee table
-- Includes the example case and another manager (Jane) with 5 reports.
INSERT INTO Employee (id, name, department, managerId) VALUES
(101, 'John', 'A', NULL),
(102, 'Dan', 'A', 101),
(103, 'James', 'A', 101),
(104, 'Amy', 'A', 101),
(105, 'Anne', 'A', 101),
(106, 'Ron', 'B', 101),
(107, 'Jane', 'B', NULL),
(108, 'Mark', 'B', 107),
(109, 'Tom', 'B', 107),
(110, 'Bill', 'C', 107),
(111, 'Sue', 'C', 107),
(112, 'Kate', 'C', 107),
(113, 'Will', 'C', 101); -- John's 6th report
GO

-- Verify that the data has been inserted correctly
SELECT * FROM Employee;
GO

-- ====================
-- Solution Query 1  
-- ====================

/* Write your T-SQL query statement below */
SELECT 
    DISTINCT(e1.name)
FROM
    Employee e1
JOIN
    Employee e2 ON e1.id = e2.managerId;

-- ====================
-- Solution Query 2  
-- ====================

/* Write your T-SQL query statement below */
-- Optimized Solution using a Subquery
-- This approach is efficient because it first identifies the qualifying manager IDs in a subquery and then retrieves their names. This can be faster than a self-join, especially with proper indexing.
SELECT
    name
FROM
    Employee
WHERE
    id IN (
        SELECT
            managerId
        FROM
            Employee
        GROUP BY
            managerId
        HAVING
            COUNT(*) >= 5
    );