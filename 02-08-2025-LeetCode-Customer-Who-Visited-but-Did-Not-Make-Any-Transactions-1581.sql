-- =================================================================
-- Problem: Find the IDs of the users who visited without making any
--          transactions and the number of times they made these
--          types of visits.
-- =================================================================

-- SQL Server Schema and Solution for "Customer Who Visited but Did Not Make Any Transactions"

-- Drop tables in the correct order to avoid foreign key constraints if they exist
IF OBJECT_ID('dbo.Transactions', 'U') IS NOT NULL
    DROP TABLE dbo.Transactions;
GO
IF OBJECT_ID('dbo.Visits', 'U') IS NOT NULL
    DROP TABLE dbo.Visits;
GO

-- Create the Visits table
-- This table logs each time a customer visits the mall.
CREATE TABLE Visits (
    visit_id INT PRIMARY KEY,
    customer_id INT
);
GO

-- Create the Transactions table
-- This table logs each transaction, linked to a specific visit.
CREATE TABLE Transactions (
    transaction_id INT PRIMARY KEY,
    visit_id INT,
    amount INT
);
GO

-- Insert sample data into the Visits table
INSERT INTO Visits (visit_id, customer_id) VALUES
(1, 23),
(2, 9),
(4, 30),
(5, 54),
(6, 96),
(7, 54),
(8, 54);
GO

-- Insert sample data into the Transactions table
INSERT INTO Transactions (transaction_id, visit_id, amount) VALUES
(2, 5, 310),
(3, 5, 300),
(9, 5, 200),
(12, 1, 910),
(13, 2, 970);
GO

-- Verify the data has been inserted correctly
SELECT * FROM Visits;
SELECT * FROM Transactions;
GO

-- =======================
-- Solution Query
-- =======================
/* Write your T-SQL query statement below */
SELECT
    v.customer_id,
    COUNT(v.visit_id) AS count_no_trans
FROM
    Visits v
LEFT JOIN
    Transactions t ON v.visit_id = t.visit_id
WHERE
    t.transaction_id IS NULL
GROUP BY
    v.customer_id
ORDER BY
    count_no_trans DESC, v.customer_id ASC;
