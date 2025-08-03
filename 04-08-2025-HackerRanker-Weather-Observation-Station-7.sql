-- =================================================================
-- Problem: Query the list of CITY names ending with vowels
--          (i.e., a, e, i, o, or u) from STATION. Your result
--          cannot contain duplicates.
-- =================================================================

-- SQL Server Schema and Solution for "Weather Observation Station 7"

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
-- This data includes cities ending with vowels and consonants,
-- as well as duplicate names to test the query logic.
INSERT INTO STATION (ID, CITY, STATE, LAT_N, LONG_W) VALUES
(1, 'Samoa', 'CA', 38.3000, 122.0000), -- Ends with a vowel
(2, 'Boston', 'MA', 42.3600, 71.0500),
(3, 'Rome', 'NY', 43.2100, 75.4500),    -- Ends with a vowel
(4, 'Denver', 'CO', 39.7300, 104.9900),
(5, 'Indiana', 'PA', 40.6200, 79.1500), -- Ends with a vowel
(6, 'Samoa', 'CA', 38.3000, 122.0000); -- Duplicate city ending with a vowel
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
    RIGHT(CITY, 1) IN ('a', 'e', 'i', 'o', 'u');