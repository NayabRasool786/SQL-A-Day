----------------------------------------------------------------------------------
-- Schema For Problem Statement
----------------------------------------------------------------------------------
-- Drop the table if it already exists to prevent errors on re-running the script
IF OBJECT_ID('CITY', 'U') IS NOT NULL
    DROP TABLE CITY;
GO

-- Create the CITY table based on the provided schema
-- ID is the primary key.
-- Data types are mapped from the provided image to SQL Server equivalents.
CREATE TABLE CITY (
    ID INT PRIMARY KEY,
    NAME VARCHAR(17) NOT NULL,
    COUNTRYCODE CHAR(3) NOT NULL,
    DISTRICT VARCHAR(20) NOT NULL,
    POPULATION INT NOT NULL
);
GO

-- Insert sample data into the CITY table
-- Includes US cities above and below 100,000 population, and non-US cities.
INSERT INTO CITY (ID, NAME, COUNTRYCODE, DISTRICT, POPULATION) VALUES
(1661, 'New York', 'USA', 'New York', 8419000),
(3878, 'Los Angeles', 'USA', 'California', 3979000),
(3793, 'Chicago', 'USA', 'Illinois', 2716000),
(3960, 'Houston', 'USA', 'Texas', 2328000),
(3959, 'Phoenix', 'USA', 'Arizona', 1680000),
(4060, 'Philadelphia', 'USA', 'Pennsylvania', 1584000),
(456, 'London', 'GBR', 'England', 8982000),
(135, 'Tokyo', 'JPN', 'Tokyo-to', 13929000),
(2710, 'San Jose', 'USA', 'California', 1030000),
(2711, 'Pasadena', 'USA', 'California', 141000),
(2712, 'Boulder', 'USA', 'Colorado', 107000),
(2713, 'Santa Fe', 'USA', 'New Mexico', 84000),
(2714, 'Ann Arbor', 'USA', 'Michigan', 121000),
(2715, 'Gary', 'USA', 'Indiana', 75000);
GO

-- Optional: A SELECT statement to verify the data has been inserted correctly
SELECT * FROM CITY;
GO

----------------------------------------------------------------------------------
-- Solution For Problem Statement
----------------------------------------------------------------------------------
SELECT *
FROM CITY
WHERE POPULATION > 100000 AND COUNTRYCODE = 'USA';