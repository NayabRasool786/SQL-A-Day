-- =================================================================
-- Problem: Query the list of CITY names from STATION that do not
--          start with vowels. Your result cannot contain duplicates.
-- =================================================================

-- SQL Server Schema and Solution for "Weather Observation Station 9"

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
-- This data includes cities starting with vowels and consonants,
-- as well as duplicate names to test the query logic.
INSERT INTO STATION (ID, CITY, STATE, LAT_N, LONG_W) VALUES
(1, 'Asheville', 'NC', 35.6000, 82.6000),
(2, 'Boston', 'MA', 42.3600, 71.0500),    -- Starts with a consonant
(3, 'Chicago', 'IL', 41.8700, 87.6200),   -- Starts with a consonant
(4, 'Denver', 'CO', 39.7300, 104.9900),  -- Starts with a consonant
(5, 'El Paso', 'TX', 31.7600, 106.4800),
(6, 'Fairfield', 'CA', 38.3000, 122.0000),-- Starts with a consonant
(7, 'Boston', 'MA', 42.3600, 71.0500);    -- Duplicate city starting with a consonant
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
    LEFT(CITY, 1) NOT IN ('a', 'e', 'i', 'o', 'u');