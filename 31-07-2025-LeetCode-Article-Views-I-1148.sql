-- =================================================================
-- Problem: Find all the authors that viewed at least one of their
--          own articles. Return the result table sorted by id
--          in ascending order.
-- =================================================================

-- SQL Server Schema and Solution for "Article Views I"

-- Drop the table if it already exists to ensure a clean setup
IF OBJECT_ID('dbo.Views', 'U') IS NOT NULL
    DROP TABLE dbo.Views;
GO

-- Create the Views table
-- This table logs each time an article is viewed.
-- Note: There is no primary key, so duplicate rows are possible.
CREATE TABLE Views (
    article_id INT,
    author_id INT,
    viewer_id INT,
    view_date DATE
);
GO

-- Insert sample data into the Views table
-- This data matches the example provided in the problem statement.
-- It includes cases where authors view their own articles (e.g., author 7, author 4)
-- and cases where they view others' articles.
INSERT INTO Views (article_id, author_id, viewer_id, view_date) VALUES
(1, 3, 5, '2019-08-01'),
(1, 3, 6, '2019-08-02'),
(2, 7, 7, '2019-08-01'), -- Author 7 viewed their own article
(2, 7, 6, '2019-08-02'),
(4, 7, 1, '2019-07-22'),
(3, 4, 4, '2019-07-21'), -- Author 4 viewed their own article
(3, 4, 4, '2019-07-21'); -- Duplicate entry, also author 4 viewing their own
GO

-- Verify the data has been inserted correctly
SELECT * FROM Views;
GO

-- ========================
-- Solution Query
-- ========================

/* Write your T-SQL query statement below */
SELECT
    author_id as id
FROM
    Views
WHERE
    author_id = viewer_id
GROUP  BY
    author_id
HAVING
    COUNT(*)>=1;


