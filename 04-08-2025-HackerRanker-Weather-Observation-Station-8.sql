-- =================================================================
-- Problem: Query the list of CITY names from STATION which have
--          vowels (i.e., a, e, i, o, u) as both their first and
--          last characters. Your result cannot contain duplicates.
-- =================================================================

-- SQL Server Schema and Solution for "Weather Observation Station 8"

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
-- This data includes cities that start and end with vowels,
-- cities that only start or only end with vowels, and duplicates.
INSERT INTO STATION (ID, CITY, STATE, LAT_N, LONG_W) VALUES
(1, 'Acme', 'ME', 44.2000, 69.9000),     -- Starts and ends with a vowel
(2, 'Omaha', 'NE', 41.2500, 96.0000),    -- Starts and ends with a vowel
(3, 'Boston', 'MA', 42.3600, 71.0500),
(4, 'Urbana', 'IL', 40.1100, 88.2000),   -- Starts and ends with a vowel
(5, 'Oakland', 'CA', 37.8000, 122.2700), -- Only starts with a vowel
(6, 'Samoa', 'CA', 38.3000, 122.0000),    -- Only ends with a vowel
(7, 'Acme', 'ME', 44.2000, 69.9000);     -- Duplicate city that meets criteria
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
    LEFT(CITY, 1) IN ('a', 'e', 'i', 'o', 'u')
    AND RIGHT(CITY, 1) IN ('a', 'e', 'i', 'o', 'u');