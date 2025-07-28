-- =================================================================
-- Problem: Find the names of all customers who were either:
--          1. Not referred by the customer with id = 2.
--          2. Not referred by any customer at all (referee_id is NULL).
-- =================================================================
-- SQL Server Schema for "Find Customer Referee"

-- Drop the table if it already exists to ensure a clean setup
IF OBJECT_ID('dbo.Customer', 'U') IS NOT NULL
    DROP TABLE dbo.Customer;
GO

-- Create the Customer table
-- This table stores customer information including their ID, name,
-- and the ID of the customer who referred them.
CREATE TABLE Customer (
    id INT PRIMARY KEY,
    name VARCHAR(255),
    referee_id INT
);
GO

-- Insert extended sample data into the Customer table
-- We are adding more data than the example to test the query logic thoroughly.
-- This includes customers referred by id 2, customers referred by other ids,
-- and customers with no referee (NULL).
INSERT INTO Customer (id, name, referee_id) VALUES
(1, 'Will', NULL),
(2, 'Jane', NULL),
(3, 'Alex', 2),
(4, 'Bill', NULL),
(5, 'Zack', 1),
(6, 'Mark', 2),
(7, 'Alice', 1),
(8, 'Bob', 3),
(9, 'Charlie', NULL),
(10, 'David', 2),
(11, 'Eve', 4);
GO

-- Verify the data has been inserted correctly
SELECT * FROM Customer;
GO


-- ====================
-- Solution:
-- ====================
SELECT name
FROM Customer
WHERE referee_id IS NULL OR referee_id != 2;