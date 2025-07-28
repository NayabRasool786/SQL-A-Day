-- =================================================================
-- Monthly Revenue Analysis
-- Problem: Calculate the total revenue generated per month to
--          understand business performance and identify trends.
-- =================================================================
-- SQL Server Schema and Solution for E-commerce Monthly Revenue Analysis

-- To ensure a fresh start, we'll drop the tables if they already exist.
IF OBJECT_ID('dbo.Orders', 'U') IS NOT NULL
    DROP TABLE dbo.Orders;
GO

-- Create the Orders table
-- This table will store individual order records, which are essential for
-- calculating revenue. Each row represents a completed transaction.
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,      -- A unique identifier for each order
    OrderDate DATETIME,           -- The exact date and time the order was placed
    TotalAmount DECIMAL(10, 2)    -- The total monetary value of the order
);
GO

-- Insert sample data into the Orders table
-- This data simulates transactions over several months (Jan-Apr 2025)
-- to provide a basis for trend analysis. The amounts and dates are varied
-- to mimic real-world e-commerce activity.
INSERT INTO Orders (OrderID, OrderDate, TotalAmount) VALUES
(1, '2025-01-05 10:30:00', 150.50),
(2, '2025-01-15 14:00:00', 75.00),
(3, '2025-01-22 18:45:00', 220.00),
(4, '2025-02-02 09:00:00', 300.20),
(5, '2025-02-10 11:20:00', 45.80),
(6, '2025-02-18 20:10:00', 199.99),
(7, '2025-02-25 12:00:00', 85.50),
(8, '2025-03-04 16:50:00', 550.00),
(9, '2025-03-12 13:15:00', 12.75),
(10, '2025-03-28 22:05:00', 99.95),
(11, '2025-04-01 08:00:00', 450.00),
(12, '2025-04-02 17:30:00', 25.00),
(13, '2025-04-15 19:25:00', 320.40),
(14, '2025-04-29 10:10:00', 180.75);
GO

-- Verify the data has been inserted correctly
SELECT * FROM Orders;
GO

-- ================
-- Solution:
-- ================
SELECT 
	FORMAT(OrderDate,'yyyy-MM') AS RevenueMonth,
	SUM(TotalAmount) AS TotalRevenue
FROM 
	Orders
GROUP BY 
	FORMAT(OrderDate,'yyyy-MM')
ORDER BY
	RevenueMonth;


