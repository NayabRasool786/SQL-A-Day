-- =================================================================
-- Problem: Pivot the Occupation column so that each Name is sorted
--          alphabetically and displayed underneath its corresponding
--          Occupation. The output should consist of four columns:
--          Doctor, Professor, Singer, and Actor.
-- =================================================================

-- SQL Server Schema and Solution for "Pivoting Occupations"

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
WITH RankedOccupations AS (
    SELECT
        Name,
        Occupation,
        ROW_NUMBER() OVER (PARTITION BY Occupation ORDER BY Name) as rn
    FROM
        OCCUPATIONS
)
SELECT
    MAX(CASE WHEN Occupation = 'Doctor' THEN Name END) AS Doctor,
    MAX(CASE WHEN Occupation = 'Professor' THEN Name END) AS Professor,
    MAX(CASE WHEN Occupation = 'Singer' THEN Name END) AS Singer,
    MAX(CASE WHEN Occupation = 'Actor' THEN Name END) AS Actor
FROM
    RankedOccupations
GROUP BY
    rn
ORDER BY
    rn;