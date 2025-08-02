-- =================================================================
-- Problem: Query a list of CITY and STATE from the STATION table.
-- =================================================================

-- SQL Server Schema and Solution for "Weather Observation Station 1"

-- Drop the table if it already exists to ensure a clean setup
IF OBJECT_ID('dbo.STATION', 'U') IS NOT NULL
    DROP TABLE dbo.STATION;
GO

-- Create the STATION table
-- This table stores data from different weather observation stations.
-- Data types are adapted for SQL Server. LAT_N and LONG_W use DECIMAL for precision.
CREATE TABLE STATION (
    ID INT PRIMARY KEY,
    CITY VARCHAR(21),
    STATE VARCHAR(2),
    LAT_N DECIMAL(9, 4),
    LONG_W DECIMAL(9, 4)
);
GO

-- Insert sample data into the STATION table
-- This data represents various weather stations across different cities and states.
INSERT INTO STATION (ID, CITY, STATE, LAT_N, LONG_W) VALUES
(794, 'Kissee Mills', 'MO', 36.6000, 93.0000),
(823, 'Loma Mar', 'CA', 37.3000, 122.3000),
(661, 'Pfeifer', 'KS', 38.7000, 99.5000),
(725, 'Guthrie', 'KY', 36.7000, 87.2000),
(836, 'Defiance', 'MO', 38.6000, 90.8000);
GO

-- Verify that the data has been inserted correctly
SELECT * FROM STATION;
GO

-- =======================
-- Solution Query
-- =======================

/* Write your T-SQL query statement below */
SELECT
    CITY, STATE
FROM
    STATION;