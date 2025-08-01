-- =================================================================
-- Problem: Show the unique ID of each user. If a user does not have
--          a unique ID, show null instead.
-- =================================================================

-- SQL Server Schema and Solution for "Replace Employee ID With The Unique Identifier"

-- Drop tables if they already exist to ensure a clean setup
IF OBJECT_ID('dbo.EmployeeUNI', 'U') IS NOT NULL
    DROP TABLE dbo.EmployeeUNI;
GO
IF OBJECT_ID('dbo.Employees', 'U') IS NOT NULL
    DROP TABLE dbo.Employees;
GO

-- Create the Employees table
-- This table stores the basic information for each employee.
CREATE TABLE Employees (
    id INT PRIMARY KEY,
    name VARCHAR(255)
);
GO

-- Create the EmployeeUNI table
-- This table stores the unique identifier for an employee, if one exists.
CREATE TABLE EmployeeUNI (
    id INT,
    unique_id INT,
    PRIMARY KEY (id, unique_id) -- Composite primary key
);
GO

-- Insert sample data into the Employees table
INSERT INTO Employees (id, name) VALUES
(1, 'Alice'),
(7, 'Bob'),
(11, 'Meir'),
(90, 'Winston'),
(3, 'Jonathan');
GO

-- Insert sample data into the EmployeeUNI table
-- Note that Alice (id 1) and Bob (id 7) do not have a unique_id.
INSERT INTO EmployeeUNI (id, unique_id) VALUES
(3, 1),
(11, 2),
(90, 3);
GO

-- Verify the data has been inserted correctly
SELECT * FROM Employees;
SELECT * FROM EmployeeUNI;
GO

-- =======================
-- Solution Query
-- =======================

/* Write your T-SQL query statement below */
/* Write your T-SQL query statement below */
SELECT 
    U.unique_id, E.name
FROM
    Employees E
LEFT JOIN
    EmployeeUNI U ON U.id = E.id;