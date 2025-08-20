-- =================================================================
-- Problem: Report the average experience years of all the employees
--          for each project, rounded to 2 digits.
-- =================================================================

-- SQL Server Schema and Solution for "Project Employees I"

-- Drop tables in the correct order to avoid foreign key errors
IF OBJECT_ID('dbo.Project', 'U') IS NOT NULL
    DROP TABLE dbo.Project;
GO
IF OBJECT_ID('dbo.Employee', 'U') IS NOT NULL
    DROP TABLE dbo.Employee;
GO

-- Create the Employee table
CREATE TABLE Employee (
    employee_id INT PRIMARY KEY,
    name VARCHAR(255),
    experience_years INT
);
GO

-- Create the Project table
CREATE TABLE Project (
    project_id INT,
    employee_id INT,
    PRIMARY KEY (project_id, employee_id),
    FOREIGN KEY (employee_id) REFERENCES Employee(employee_id)
);
GO

-- Insert sample data
INSERT INTO Employee (employee_id, name, experience_years) VALUES
(1, 'Khaled', 3),
(2, 'Ali', 2),
(3, 'John', 1),
(4, 'Doe', 2);
GO

INSERT INTO Project (project_id, employee_id) VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 1),
(2, 4);
GO

-- Verify data insertion
SELECT * FROM Employee;
SELECT * FROM Project;
GO

-- ==============================
-- Solution Query
-- ==============================

/* Write your T-SQL query statement below */
SELECT
    p.project_id,
    ROUND(AVG(CAST(e.experience_years AS FLOAT)), 2) AS average_years
FROM
    Project p
INNER JOIN
    Employee e ON p.employee_id = e.employee_id
GROUP BY
    p.project_id;
GO
