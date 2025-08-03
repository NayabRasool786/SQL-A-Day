-- =================================================================
-- Problem: Find the difference between the total number of CITY
--          entries in the table and the number of distinct CITY
--          entries in the table.
-- =================================================================

-- SQL Server Schema and Solution for "Weather Observation Station 4"

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
-- This data includes duplicate city names to test the query logic,
-- as described in the problem example.
INSERT INTO STATION (ID, CITY, STATE, LAT_N, LONG_W) VALUES
(1, 'New York', 'NY', 40.7128, 74.0060),
(2, 'New York', 'NY', 40.7128, 74.0060),
(3, 'Bengaluru', 'KA', 12.9716, 77.5946),
(4, 'Chicago', 'IL', 41.8781, 87.6298),
(5, 'Denver', 'CO', 39.7392, 104.9903),
(6, 'Denver', 'CO', 39.7392, 104.9903),
(7, 'Denver', 'CO', 39.7392, 104.9903);
GO

-- Verify that the data has been inserted correctly
SELECT * FROM STATION;
GO


-- ========================
-- Solution Query
-- ========================
/* Write your T-SQL query statement below */
SELECT
    COUNT(CITY) - COUNT(DISTINCT(CITY)) AS CityCountDifference
FROM STATION