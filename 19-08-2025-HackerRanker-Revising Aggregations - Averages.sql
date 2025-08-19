-- =================================================================
-- Problem: Query the average population of all cities in CITY
--          where District is California.
-- =================================================================

-- SQL Server Schema and Solution for "Revising Aggregations - The Averages Function"

-- Drop the table if it already exists to ensure a clean setup
IF OBJECT_ID('dbo.CITY', 'U') IS NOT NULL
    DROP TABLE dbo.CITY;
GO

-- Create the CITY table
-- This table stores information about various cities.
-- Data types are adapted for SQL Server.
CREATE TABLE CITY (
    ID INT PRIMARY KEY,
    NAME VARCHAR(17),
    COUNTRYCODE VARCHAR(3),
    DISTRICT VARCHAR(20),
    POPULATION INT
);
GO

-- Insert sample data into the CITY table
-- This includes cities in California and other districts to test the filter.
INSERT INTO CITY (ID, NAME, COUNTRYCODE, DISTRICT, POPULATION) VALUES
(3965, 'Corona', 'USA', 'California', 124966),     -- Meets criteria
(3973, 'Concord', 'USA', 'California', 121780),     -- Meets criteria
(3982, 'Coral Springs', 'USA', 'Florida', 117549),  -- Fails: not in California
(1661, 'Sayama', 'JPN', 'Saitama', 161979),         -- Fails: not in California
(3958, 'Long Beach', 'USA', 'California', 462257);  -- Meets criteria
GO

-- Verify that the data has been inserted correctly
SELECT * FROM CITY;
GO


-- ====================
-- Solution Query 
-- ====================

/* Write your T-SQL query statement below */
SELECT
    AVG(POPULATION) AS AvgPopulationCalifornia
FROM
    CITY
WHERE
    DISTRICT = 'California';
GO

