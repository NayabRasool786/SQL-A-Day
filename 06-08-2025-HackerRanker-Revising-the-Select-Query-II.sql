-- =================================================================
-- Problem: Query the NAME field for all American cities in the
--          CITY table with populations larger than 120000.
--          The CountryCode for America is USA.
-- =================================================================

-- SQL Server Schema and Solution for "Revising the Select Query I"

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
-- This includes American cities with populations above and below 120,000,
-- as well as non-American cities to test the filter.
INSERT INTO CITY (ID, NAME, COUNTRYCODE, DISTRICT, POPULATION) VALUES
(3878, 'Scottsdale', 'USA', 'Arizona', 202705),   -- Meets criteria
(3965, 'Corona', 'USA', 'California', 124966),     -- Meets criteria
(3973, 'Concord', 'USA', 'California', 121780),     -- Meets criteria
(3977, 'Cedar Rapids', 'USA', 'Iowa', 120758),     -- Meets criteria
(3982, 'Coral Springs', 'USA', 'Florida', 117549),  -- Fails: population too low
(1661, 'Sayama', 'JPN', 'Saitama', 161979);         -- Fails: not in USA
GO

-- Verify that the data has been inserted correctly
SELECT * FROM CITY;
GO

-- =======================
-- Solution Query
-- =======================

/* Write your T-SQL query statement below */
SELECT
    NAME
FROM
    CITY
WHERE
    COUNTRYCODE = 'USA' AND POPULATION > 120000;