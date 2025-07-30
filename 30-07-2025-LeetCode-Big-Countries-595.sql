-- =================================================================
-- Problem: Find the name, population, and area of all "big countries".
-- A country is considered "big" if:
-- 1. It has an area of at least 3,000,000 km².
-- OR
-- 2. It has a population of at least 25,000,000.
-- =================================================================

-- Drop the table if it already exists to ensure a clean setup.
IF OBJECT_ID('dbo.World', 'U') IS NOT NULL
    DROP TABLE dbo.World;
GO

-- Create the World table
-- This table stores key statistics for various countries.
-- 'name' is the primary key, ensuring each country is unique.
CREATE TABLE World (
    name VARCHAR(255) PRIMARY KEY,
    continent VARCHAR(255),
    area INT,
    population INT,
    gdp BIGINT
);
GO

-- Insert sample data into the World table
-- This includes the examples provided plus additional countries to test all conditions:
-- - Large area, large population (Russia)
-- - Large area only (Australia)
-- - Large population only (Nigeria)
-- - Neither (Germany)
INSERT INTO World (name, continent, area, population, gdp) VALUES
('Afghanistan', 'Asia', 652230, 25500100, 20343000000),
('Albania', 'Europe', 28748, 2831741, 12960000000),
('Algeria', 'Africa', 2381741, 37100000, 188681000000),
('Andorra', 'Europe', 468, 78115, 3712000000),
('Angola', 'Africa', 1246700, 20609294, 100990000000),
('Russia', 'Europe', 17098242, 146599183, 1699870000000),
('Australia', 'Oceania', 7692024, 25687041, 1392680000000),
('Nigeria', 'Africa', 923768, 206139589, 448120000000),
('Germany', 'Europe', 357022, 83783942, 3845630000000);
GO

-- Verify the data has been inserted correctly
SELECT * FROM World;
GO

-- ===================
-- Solution Query
-- ===================

/* Write your T-SQL query statement below */
SELECT 
    name,
    population,
    area
FROM
    World
WHERE 
    area >= 3000000 OR population >= 25000000;

