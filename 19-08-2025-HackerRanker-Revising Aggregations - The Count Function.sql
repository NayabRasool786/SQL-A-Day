-- =================================================================
-- Problem: Query a count of the number of cities in CITY having a
--          Population larger than 100,000.
-- =================================================================

-- SQL Server Schema and Solution for "Revising Aggregations - The Count Function"

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
-- This includes cities with populations above and below 100,000 to test the filter.
INSERT INTO CITY (ID, NAME, COUNTRYCODE, DISTRICT, POPULATION) VALUES
(3878, 'Scottsdale', 'USA', 'Arizona', 202705),   -- Meets criteria
(3965, 'Corona', 'USA', 'California', 124966),     -- Meets criteria
(3973, 'Concord', 'USA', 'California', 121780),     -- Meets criteria
(6, 'Rotterdam', 'NLD', 'Zuid-Holland', 593321),    -- Meets criteria
(3982, 'Coral Springs', 'USA', 'Florida', 97549),   -- Fails: population too low
(1661, 'Sayama', 'JPN', 'Saitama', 99979);          -- Fails: population too low
GO

-- Verify that the data has been inserted correctly
SELECT * FROM CITY;
GO

-- ====================
-- Solution Query 
-- ====================

/* Write your T-SQL query statement below */

SELECT
    COUNT(*) AS CityCount
FROM
    CITY
WHERE
    POPULATION > 100000;
GO

