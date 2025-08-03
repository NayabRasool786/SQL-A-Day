-- =================================================================
-- Problem: Query a list of CITY names from STATION for cities that
--          have an even ID number. Print the results in any order,
--          but exclude duplicates from the answer.
-- =================================================================

-- SQL Server Schema and Solution for "Weather Observation Station 3"

-- Drop the table if it already exists to ensure a clean setup
IF OBJECT_ID('dbo.STATION', 'U') IS NOT NULL
    DROP TABLE dbo.STATION;
GO

-- Create the STATION table
-- This table stores data from different weather observation stations.
-- Data types are adapted for SQL Server.
CREATE TABLE STATION (
    ID INT PRIMARY KEY,
    CITY VARCHAR(21),
    STATE VARCHAR(2),
    LAT_N DECIMAL(9, 4),
    LONG_W DECIMAL(9, 4)
);
GO

-- Insert sample data into the STATION table
-- Includes a mix of even and odd IDs, and duplicate city names
-- to ensure the query logic is tested correctly.
INSERT INTO STATION (ID, CITY, STATE, LAT_N, LONG_W) VALUES
(1, 'Asheville', 'NC', 35.6000, 82.6000),
(2, 'Burlington', 'VT', 44.5000, 73.2000),  -- Even ID
(3, 'Clarksdale', 'MS', 34.2000, 90.6000),
(4, 'Devils Lake', 'ND', 48.1000, 98.9000),  -- Even ID
(5, 'Fairfield', 'CA', 38.3000, 122.0000),
(6, 'Burlington', 'IA', 40.8000, 91.1000);   -- Even ID, duplicate city name
GO

-- Verify that the data has been inserted correctly
SELECT * FROM STATION;
GO

-- ========================
-- Solution Query
-- ========================
/* Write your T-SQL query statement below */
SELECT DISTINCT
    CITY
FROM
    STATION
WHERE
    ID % 2 = 0;