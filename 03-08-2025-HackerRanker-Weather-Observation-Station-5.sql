-- ======================================================================
-- Problem: Query the two cities in STATION with the shortest and
--          longest CITY names, as well as their respective lengths.
--          If there is more than one smallest or largest city,
--          choose the one that comes first when ordered alphabetically.
-- ======================================================================

-- SQL Server Schema and Solution for "Weather Observation Station 5"

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
-- This data includes cities with various name lengths, including ties,
-- to test the sorting logic correctly.
-- Shortest names: 'Amo', 'Lee', 'Roy' (3 letters)
-- Longest name: 'Marine On Saint Croix' (21 letters)
INSERT INTO STATION (ID, CITY, STATE, LAT_N, LONG_W) VALUES
(1, 'Roy', 'MT', 48.0000, 109.8000),
(2, 'Lee', 'MA', 42.3000, 73.2000),
(3, 'Amo', 'IN', 39.7000, 86.6000),
(4, 'Marine On Saint Croix', 'MN', 45.2000, 92.8000),
(5, 'Greensboro', 'NC', 36.1000, 79.8000),
(6, 'Springfield', 'IL', 39.8000, 89.6000);
GO

-- Verify that the data has been inserted correctly
SELECT * FROM STATION;
GO

-- ========================
-- Solution Query
-- ========================
/* Write your T-SQL query statement below */
SELECT TOP 1
    CITY,
    LEN(CITY) AS NameLength
FROM
    STATION
ORDER BY
    NameLength ASC, CITY ASC;
    
SELECT TOP 1
    CITY,
    LEN(CITY) AS NameLength
FROM
    STATION
ORDER BY
    NameLength DESC, CITY ASC;
