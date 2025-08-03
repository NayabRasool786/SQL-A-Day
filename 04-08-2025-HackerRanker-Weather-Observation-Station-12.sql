-- =================================================================
-- Problem: Query the list of CITY names from STATION that do not
--          start with vowels and do not end with vowels. Your
--          result cannot contain duplicates.
-- =================================================================

-- SQL Server Schema and Solution for "Weather Observation Station 12"

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
-- - Starts and ends with a consonant (Boston, Dallas, Fairfield) -> Should be included
-- - Starts with a vowel (Oakland, Acme) -> Should be excluded
-- - Ends with a vowel (Samoa) -> Should be excluded
-- - Duplicates are included to test the DISTINCT keyword.
INSERT INTO STATION (ID, CITY, STATE, LAT_N, LONG_W) VALUES
(1, 'Boston', 'MA', 42.3600, 71.0500),    -- Starts and ends with a consonant
(2, 'Oakland', 'CA', 37.8000, 122.2700), -- Starts with a vowel
(3, 'Acme', 'ME', 44.2000, 69.9000),     -- Starts and ends with a vowel
(4, 'Dallas', 'TX', 32.7700, 96.8000),   -- Starts and ends with a consonant
(5, 'Samoa', 'CA', 38.3000, 122.0000),    -- Ends with a vowel
(6, 'Fairfield', 'CA', 38.3000, 122.0000),-- Starts and ends with a consonant
(7, 'Boston', 'MA', 42.3600, 71.0500);    -- Duplicate that meets criteria
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
    AND RIGHT(CITY, 1) NOT IN ('a', 'e', 'i', 'o', 'u');