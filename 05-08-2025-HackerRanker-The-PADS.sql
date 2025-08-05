-- =================================================================
-- Problem: Generate two result sets:
-- 1. An alphabetically ordered list of names followed by the first
--    letter of their profession in parentheses.
-- 2. A count of each occupation, sorted by count then by occupation
--    name, formatted as a sentence.
-- =================================================================

-- SQL Server Schema and Solution for "The PADS"

-- Drop the table if it already exists to ensure a clean setup
IF OBJECT_ID('dbo.OCCUPATIONS', 'U') IS NOT NULL
    DROP TABLE dbo.OCCUPATIONS;
GO

-- Create the OCCUPATIONS table
-- This table stores the name and occupation of individuals.
CREATE TABLE OCCUPATIONS (
    Name VARCHAR(255),
    Occupation VARCHAR(255)
);
GO

-- Insert sample data into the OCCUPATIONS table
INSERT INTO OCCUPATIONS (Name, Occupation) VALUES
('Samantha', 'Doctor'),
('Julia', 'Actor'),
('Maria', 'Actor'),
('Meera', 'Singer'),
('Ashely', 'Professor'),
('Ketty', 'Professor'),
('Christeen', 'Professor'),
('Jane', 'Actor'),
('Jenny', 'Doctor'),
('Priya', 'Singer');
GO

-- Verify that the data has been inserted correctly
SELECT * FROM OCCUPATIONS;
GO

-- =======================
-- Solution Query
-- =======================

/* Write your T-SQL query statement below */
SELECT
    Name + '(' + LEFT(Occupation, 1) + ')' AS NameWithOccupation
FROM
    OCCUPATIONS
ORDER BY
    Name ASC;

SELECT
    'There are a total of ' + CAST(COUNT(Occupation) AS VARCHAR) + ' ' + LOWER(Occupation) + 's.' AS CountOfOccupations
FROM
    OCCUPATIONS
GROUP BY
    Occupation
ORDER BY
    COUNT(Occupation) ASC, Occupation ASC;

