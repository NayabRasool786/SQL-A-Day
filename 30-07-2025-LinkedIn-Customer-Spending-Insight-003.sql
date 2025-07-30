
-- =================================================================
-- Problem: What is the average order value (AOV) per customer
--          in the last month?
--
-- For this query, we assume the current date is in July 2025,
-- so "last month" refers to June 2025 (2025-06).
-- =================================================================

-- SQL Server Schema and Solution for Customer Spending Insight

-- Drop tables if they exist for a clean run
IF OBJECT_ID('dbo.Orders', 'U') IS NOT NULL
    DROP TABLE dbo.Orders;
GO
IF OBJECT_ID('dbo.Customers', 'U') IS NOT NULL
    DROP TABLE dbo.Customers;
GO

-- Create the Customers table
-- This table stores basic information about each customer.
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(255),
    JoinDate DATE
);
GO

-- Create the Orders table
-- This table logs every order, linking back to the customer who made it.
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATETIME,
    TotalAmount DECIMAL(10, 2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID) -- Links to the Customers table
);
GO

-- Insert sample data
-- We'll add customers and a series of orders across different months.
-- Crucially, we'll add several orders in June 2025 (the "last month" relative to a July run date)
-- to test the AOV calculation accurately.
INSERT INTO Customers (CustomerID, CustomerName, JoinDate) VALUES
(101, 'Priya Sharma', '2025-01-10'),
(102, 'Rohan Gupta', '2025-02-20'),
(103, 'Anjali Mehta', '2025-04-05');
GO

INSERT INTO Orders (OrderID, CustomerID, OrderDate, TotalAmount) VALUES
-- Orders from previous months
(1, 101, '2025-05-15 10:00:00', 1200.50),
(2, 102, '2025-05-20 11:30:00', 800.00),
-- Orders from "last month" (June 2025)
(3, 101, '2025-06-05 09:45:00', 2500.00), -- Priya's first June order
(4, 103, '2025-06-10 14:00:00', 550.75),  -- Anjali's only June order
(5, 101, '2025-06-18 18:20:00', 1500.00), -- Priya's second June order
(6, 102, '2025-06-22 12:10:00', 1100.25), -- Rohan's first June order
(7, 102, '2025-06-28 20:00:00', 950.75),  -- Rohan's second June order
-- Orders from the current month (for context, will be excluded by the query)
(8, 101, '2025-07-02 15:00:00', 300.00);
GO

-- Verify data insertion
SELECT * FROM Customers;
SELECT * FROM Orders;
GO

-- =====================
-- Solution Query
-- This query identifies all customers who placed an order last month
-- and calculates their average spending per order for that period.
-- =====================
SELECT
    c.CustomerName,
    AVG(o.TotalAmount) AS AverageOrderValueLastMonth
FROM
    Customers c
JOIN
    Orders o ON c.CustomerID = o.CustomerID
WHERE
    -- Filter orders to only include those from the last full month
    FORMAT(o.OrderDate, 'yyyy-MM') = FORMAT(DATEADD(month, -1, GETDATE()), 'yyyy-MM')
GROUP BY
    c.CustomerID, c.CustomerName
ORDER BY
    c.CustomerName;
GO