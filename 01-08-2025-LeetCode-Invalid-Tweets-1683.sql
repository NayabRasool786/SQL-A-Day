-- =================================================================
-- Problem: Find the IDs of all invalid tweets.
-- A tweet is considered invalid if the number of characters in its
-- content is strictly greater than 15.
-- =================================================================

-- SQL Server Schema and Solution for "Invalid Tweets"

-- Drop the table if it already exists to ensure a clean setup
IF OBJECT_ID('dbo.Tweets', 'U') IS NOT NULL
    DROP TABLE dbo.Tweets;
GO

-- Create the Tweets table
-- This table stores tweet information.
-- tweet_id is the primary key to uniquely identify each tweet.
CREATE TABLE Tweets (
    tweet_id INT PRIMARY KEY,
    content VARCHAR(MAX) -- Using VARCHAR(MAX) to accommodate potentially long strings
);
GO

-- Insert sample data into the Tweets table
-- This includes the examples provided in the problem statement.
INSERT INTO Tweets (tweet_id, content) VALUES
(1, 'Let us Code'),
(2, 'More than fifteen chars are here!'),
(3, 'This is a valid one'),
(4, 'This one is definitely going to be too long for the app');
GO

-- Verify the data has been inserted correctly
SELECT tweet_id, content, LEN(content) as CharacterCount FROM Tweets;
GO

-- =======================
-- Solution Query
-- =======================

/* Write your T-SQL query statement below */
SELECT 
    tweet_id
FROM
    Tweets
WHERE
    LEN(content) > 15;