-- =================================================================
-- Problem: Find the highest single purchase amount made by any
--          customer in the last 30 days(Top Spending Event Last Month).
--
-- For this query, we assume the current date is August 1, 2025.
-- =================================================================

-- SQL Server Schema and Solution for Finding the Maximum Purchase Amount

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
    CustomerName VARCHAR(255)
);
GO

-- Create the Orders table
-- This table logs every order, linking back to the customer who made it.
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    TotalAmount DECIMAL(10, 2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);
GO

-- Insert sample data
-- We will add customers and a series of orders. The dates are set relative
-- to a hypothetical run date of August 1, 2025, to test the "last 30 days" logic.
INSERT INTO Customers (CustomerID, CustomerName) VALUES
(1, 'Sameer Singh'),
(2, 'Priya Rao'),
(3, 'Amit Patel');
GO

INSERT INTO Orders (OrderID, CustomerID, OrderDate, TotalAmount) VALUES
-- Orders outside the last 30 days
(101, 1, '2025-06-15', 5000.00),
(102, 2, '2025-05-20', 8000.00),

-- Orders within the last 30 days (July 2025)
(103, 1, '2025-07-05', 2500.00),
(104, 3, '2025-07-10', 9500.50), -- The highest purchase amount in the last 30 days
(105, 2, '2025-07-18', 7800.75),
(106, 1, '2025-07-28', 4200.00);
GO

-- Verify data insertion
SELECT * FROM Customers;
SELECT * FROM Orders;
GO

-- =======================
-- Solution Query
-- =======================

/* Write your T-SQL query statement below */
SELECT
    MAX(TotalAmount) AS MaxPurchaseLast30Days
FROM
    Orders
WHERE
    OrderDate >= DATEADD(day, -30, GETDATE());