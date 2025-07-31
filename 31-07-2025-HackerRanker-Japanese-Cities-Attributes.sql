
-- =================================================================
-- Problem: Query all attributes of every Japanese city in the
--          CITY table. The COUNTRYCODE for Japan is 'JPN'.
-- =================================================================

-- SQL Server Schema and Solution for "Japanese Cities' Attributes"

-- Drop the table if it already exists to ensure a clean setup
IF OBJECT_ID('dbo.CITY', 'U') IS NOT NULL
    DROP TABLE dbo.CITY;
GO

-- Create the CITY table
-- This table stores information about various cities.
-- The data types are adapted for SQL Server from the provided schema.
CREATE TABLE CITY (
    ID INT PRIMARY KEY,
    NAME VARCHAR(17),
    COUNTRYCODE VARCHAR(3),
    DISTRICT VARCHAR(20),
    POPULATION INT
);
GO

-- Insert sample data into the CITY table
-- This data includes several Japanese cities (COUNTRYCODE = 'JPN')
-- as well as cities from other countries to ensure the query filter works correctly.
INSERT INTO CITY (ID, NAME, COUNTRYCODE, DISTRICT, POPULATION) VALUES
(1661, 'Sayama', 'JPN', 'Saitama', 161979),
(1613, 'Neyagawa', 'JPN', 'Osaka', 257315),
(1581, 'Kyoto', 'JPN', 'Kyoto', 1459640),
(3878, 'Scottsdale', 'USA', 'Arizona', 202705),
(3965, 'Corona', 'USA', 'California', 124966),
(1532, 'Takamatsu', 'JPN', 'Kagawa', 327633);
GO

-- Verify that the data has been inserted correctly
SELECT * FROM CITY;
GO

-- ========================
-- Solution Query
-- ========================
/* Write your T-SQL query statement below */
SELECT *
FROM
    CITY
WHERE
    COUNTRYCODE = 'JPN';