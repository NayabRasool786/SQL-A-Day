-- =================================================================
-- Problem: Query the Name of any student in STUDENTS who scored
--          higher than 75 Marks. Order your output by the last
--          three characters of each name. If two or more students
--          both have names ending in the same last three characters,
--          secondary sort them by ascending ID.
-- =================================================================

-- SQL Server Schema and Solution for "Higher Than 75 Marks"

-- Drop the table if it already exists to ensure a clean setup
IF OBJECT_ID('dbo.STUDENTS', 'U') IS NOT NULL
    DROP TABLE dbo.STUDENTS;
GO

-- Create the STUDENTS table
-- This table stores student information including their ID, name, and marks.
CREATE TABLE STUDENTS (
    ID INT PRIMARY KEY,
    Name VARCHAR(50),
    Marks INT
);
GO

-- Insert sample data into the STUDENTS table
-- This includes the provided sample data plus additional records
-- to test the secondary sorting condition (e.g., Bobby and Robby).
INSERT INTO STUDENTS (ID, Name, Marks) VALUES
(1, 'Ashley', 81),
(2, 'Samantha', 75), -- Should be excluded (Marks not > 75)
(3, 'Belvet', 84),
(4, 'Julia', 76),
(5, 'Stuart', 77),
(6, 'Robby', 88),   -- Ends in 'bby'
(7, 'Bobby', 88),   -- Ends in 'bby', lower ID than Robby
(8, 'Kristeen', 74); -- Should be excluded (Marks not > 75)
GO

-- Verify that the data has been inserted correctly
SELECT * FROM STUDENTS;
GO

-- =======================
-- Solution Query
-- =======================

/* Write your T-SQL query statement below */
SELECT
    Name
FROM
    STUDENTS
WHERE
    Marks > 75
ORDER BY
    RIGHT(Name, 3) ASC, ID ASC;