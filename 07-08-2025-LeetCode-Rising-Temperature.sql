-- =================================================================
-- Problem: Write a solution to find all dates' id with higher
--          temperatures compared to its previous dates (yesterday).
-- =================================================================

-- SQL Server Schema and Solution for "Rising Temperature"

-- Drop the table if it already exists to ensure a clean setup
IF OBJECT_ID('dbo.Weather', 'U') IS NOT NULL
    DROP TABLE dbo.Weather;
GO

-- Create the Weather table
-- This table contains information about the temperature on a certain day.
CREATE TABLE Weather (
    id INT PRIMARY KEY,
    recordDate DATE,
    temperature INT
);
GO

-- Insert sample data into the Weather table
INSERT INTO Weather (id, recordDate, temperature) VALUES
(1, '2015-01-01', 10),
(2, '2015-01-02', 25),
(3, '2015-01-03', 20),
(4, '2015-01-04', 30);
GO

-- Verify that the data has been inserted correctly
SELECT * FROM Weather;
GO

-- =========================
-- Solution Query
-- =========================
WITH PreviousDayWeather AS (
    SELECT
        id,
        recordDate,
        temperature,
        LAG(temperature, 1) OVER (ORDER BY recordDate) AS prev_temp,
        LAG(recordDate, 1) OVER (ORDER BY recordDate) AS prev_date
    FROM
        Weather
)
SELECT
    id
FROM
    PreviousDayWeather
WHERE
    temperature > prev_temp
    AND DATEDIFF(day, prev_date, recordDate) = 1;