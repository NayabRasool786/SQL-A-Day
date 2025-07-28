-- =================================================================
-- Problem: Query all columns (attributes) for every row in the CITY table.
-- =================================================================
-- SQL Server Schema and Solution for Querying the CITY Table

-- Drop the table if it already exists to ensure a clean setup
IF OBJECT_ID('dbo.CITY', 'U') IS NOT NULL
    DROP TABLE dbo.CITY;
GO

-- Create the CITY table
-- This table stores information about various cities, including their ID, name,
-- country code, district, and population.
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
-- This data includes a variety of cities from different countries and districts
-- to provide a good example dataset.
INSERT INTO CITY (ID, NAME, COUNTRYCODE, DISTRICT, POPULATION) VALUES
(6, 'Rotterdam', 'NLD', 'Zuid-Holland', 593321),
(3878, 'Scottsdale', 'USA', 'Arizona', 202705),
(3965, 'Corona', 'USA', 'California', 124966),
(3973, 'Concord', 'USA', 'California', 121780),
(3977, 'Cedar Rapids', 'USA', 'Iowa', 120758),
(3982, 'Coral Springs', 'USA', 'Florida', 117549),
(4068, 'Jabalpur', 'IND', 'Madhya Pradesh', 1055525),
(1661, 'Sayama', 'JPN', 'Saitama', 161979);
GO

-- Verify that the data has been inserted correctly
SELECT * FROM CITY;
GO


-- =================
-- Solution Query
-- =================
SELECT * FROM CITY;
GO