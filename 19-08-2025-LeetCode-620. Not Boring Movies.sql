-- =================================================================
-- Problem: Report the movies with an odd-numbered ID and a
--          description that is not "boring". Return the result
--          table ordered by rating in descending order.
-- =================================================================

-- SQL Server Schema and Solution for "Not Boring Movies"

-- Drop the table if it already exists to ensure a clean setup
IF OBJECT_ID('dbo.Cinema', 'U') IS NOT NULL
    DROP TABLE dbo.Cinema;
GO

-- Create the Cinema table
-- This table contains information about movies.
CREATE TABLE Cinema (
    id INT PRIMARY KEY,
    movie VARCHAR(255),
    description VARCHAR(255),
    rating FLOAT
);
GO

-- Insert sample data into the Cinema table
INSERT INTO Cinema (id, movie, description, rating) VALUES
(1, 'War', 'great 3D', 8.9),
(2, 'Science', 'fiction', 8.5),
(3, 'irish', 'boring', 6.2),
(4, 'Ice song', 'Fantacy', 8.6),
(5, 'House card', 'Interesting', 9.1);
GO

-- Verify that the data has been inserted correctly
SELECT * FROM Cinema;
GO

-- ====================
-- Solution Query 
-- ====================

/* Write your T-SQL query statement below */
SELECT
    id,
    movie,
    description,
    rating
FROM
    Cinema
WHERE
    id % 2 != 0
    AND description != 'boring'
ORDER BY
    rating DESC;