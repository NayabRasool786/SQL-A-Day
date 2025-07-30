-- =================================================================
-- Problem: Query all columns for a city in the CITY table
--          with the ID 1661.
-- =================================================================
-- SQL Server Schema and Solution for Querying a City by ID

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
-- This data includes a variety of cities, specifically including
-- the city with ID 1661 (Sayama) to ensure the query can be tested.
INSERT INTO CITY (ID, NAME, COUNTRYCODE, DISTRICT, POPULATION) VALUES
(6, 'Rotterdam', 'NLD', 'Zuid-Holland', 593321),
(3878, 'Scottsdale', 'USA', 'Arizona', 202705),
(3973, 'Concord', 'USA', 'California', 121780),
(1661, 'Sayama', 'JPN', 'Saitama', 161979), -- The target city for the query
(4068, 'Jabalpur', 'IND', 'Madhya Pradesh', 1055525);
GO

-- Verify that the data has been inserted correctly
SELECT * FROM CITY;
GO

-- ====================
-- Solution Query
-- ====================
SELECT *
FROM CITY
WHERE ID = 1661;