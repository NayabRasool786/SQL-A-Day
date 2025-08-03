-- =================================================================
-- Problem: Query the list of CITY names from STATION that either
--          do not start with vowels or do not end with vowels.
--          Your result cannot contain duplicates.
-- =================================================================

-- SQL Server Schema and Solution for "Weather Observation Station 11"

-- Drop the table if it already exists to ensure a clean setup
IF OBJECT_ID('dbo.STATION', 'U') IS NOT NULL
    DROP TABLE dbo.STATION;
GO

-- Create the STATION table
-- This table stores data from different weather observation stations.
CREATE TABLE STATION (
    ID INT PRIMARY KEY,
    CITY VARCHAR(21),
    STATE VARCHAR(2),
    LAT_N DECIMAL(9, 4),
    LONG_W DECIMAL(9, 4)
);
GO

-- Insert sample data into the STATION table
-- This data includes cities to test all conditions:
-- - Doesn't start with a vowel (Boston, Dallas)
-- - Doesn't end with a vowel (Oakland, Elmont)
-- - Starts and ends with a vowel (Acme, Omaha) -> These should be excluded
-- - Duplicates are included to test the DISTINCT keyword.
INSERT INTO STATION (ID, CITY, STATE, LAT_N, LONG_W) VALUES
(1, 'Boston', 'MA', 42.3600, 71.0500),    -- Does not start with a vowel
(2, 'Oakland', 'CA', 37.8000, 122.2700), -- Does not end with a vowel
(3, 'Acme', 'ME', 44.2000, 69.9000),     -- Starts and ends with a vowel (exclude)
(4, 'Dallas', 'TX', 32.7700, 96.8000),   -- Does not start with a vowel
(5, 'Elmont', 'NY', 40.7000, 73.7100),   -- Does not end with a vowel
(6, 'Omaha', 'NE', 41.2500, 96.0000),    -- Starts and ends with a vowel (exclude)
(7, 'Boston', 'MA', 42.3600, 71.0500);    -- Duplicate
GO

-- Verify that the data has been inserted correctly
SELECT * FROM STATION;
GO

-- =======================
-- Solution Query
-- =======================

/* Write your T-SQL query statement below */
SELECT DISTINCT
    CITY
FROM
    STATION
WHERE
    LEFT(CITY, 1) NOT IN ('a', 'e', 'i', 'o', 'u')
    OR RIGHT(CITY, 1) NOT IN ('a', 'e', 'i', 'o', 'u');