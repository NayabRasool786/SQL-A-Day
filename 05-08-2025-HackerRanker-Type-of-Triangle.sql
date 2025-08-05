-- =================================================================
-- Problem: Write a query identifying the type of each record in
--          the TRIANGLES table using its three side lengths.
--
-- Output one of the following for each record:
-- - Equilateral: 3 sides of equal length.
-- - Isosceles: 2 sides of equal length.
-- - Scalene: 3 sides of differing lengths.
-- - Not A Triangle: The given values don't form a triangle.
-- =================================================================

-- SQL Server Schema and Solution for "Type of Triangle"

-- Drop the table if it already exists to ensure a clean setup
IF OBJECT_ID('dbo.TRIANGLES', 'U') IS NOT NULL
    DROP TABLE dbo.TRIANGLES;
GO

-- Create the TRIANGLES table
-- This table stores the lengths of the three sides of a triangle.
CREATE TABLE TRIANGLES (
    A INT,
    B INT,
    C INT
);
GO

-- Insert sample data into the TRIANGLES table
-- This includes the data from the explanation and other test cases.
INSERT INTO TRIANGLES (A, B, C) VALUES
(20, 20, 23), -- Isosceles
(20, 20, 20), -- Equilateral
(20, 21, 22), -- Scalene
(13, 14, 30), -- Not A Triangle
(10, 10, 10), -- Equilateral
(10, 11, 12), -- Scalene
(10, 10, 15), -- Isosceles
(5, 8, 20);   -- Not A Triangle
GO

-- Verify that the data has been inserted correctly
SELECT * FROM TRIANGLES;
GO

-- =======================
-- Solution Query
-- =======================

/* Write your T-SQL query statement below */
SELECT
  CASE
    WHEN A = B AND B = C THEN 'Equilateral'
    WHEN A != B AND B != C AND A != C THEN 'Scalene'
	WHEN A + B <= C OR A + C <= B OR B + C <= A THEN 'Not A Triangle'
    ELSE 'Isosceles'
  END AS Triangle_Type
FROM TRIANGLES;