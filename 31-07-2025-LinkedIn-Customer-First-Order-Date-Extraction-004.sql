-- =================================================================
-- Problem: Find the earliest order date for each customer to
--          determine when they placed their first order.
-- =================================================================

-- SQL Server Schema and Solution for Customer First Order Date Extraction

-- Drop tables if they exist to ensure a clean start
IF OBJECT_ID('dbo.Orders', 'U') IS NOT NULL
    DROP TABLE dbo.Orders;
GO
IF OBJECT_ID('dbo.Customers', 'U') IS NOT NULL
    DROP TABLE dbo.Customers;
GO

-- Create the Customers table
-- This table will store information about each customer.
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(255),
    Email VARCHAR(255)
);
GO

-- Create the Orders table
-- This table will log every transaction, linking back to a customer.
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    TotalAmount DECIMAL(10, 2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);
GO

-- Insert sample data
-- We'll create a few customers and give them multiple orders on different dates
-- to ensure our query correctly identifies the earliest date.
INSERT INTO Customers (CustomerID, CustomerName, Email) VALUES
(1, 'Aarav Sharma', 'aarav.sharma@email.com'),
(2, 'Diya Patel', 'diya.patel@email.com'),
(3, 'Rohan Kumar', 'rohan.kumar@email.com');
GO

INSERT INTO Orders (OrderID, CustomerID, OrderDate, TotalAmount) VALUES
-- Aarav's Orders
(101, 1, '2025-03-15', 1500.00), -- Aarav's first order
(102, 1, '2025-05-20', 250.50),
(103, 1, '2025-06-11', 800.75),

-- Diya's Orders
(104, 2, '2025-02-10', 5000.00), -- Diya's first order
(105, 2, '2025-02-28', 1200.00),
(106, 2, '2025-04-19', 3500.25),

-- Rohan's only order (which is also his first)
(107, 3, '2025-07-01', 450.00);
GO

-- Verify data insertion
SELECT * FROM Customers;
SELECT * FROM Orders;
GO

-- ========================
-- Solution Query
-- ========================
/* Write your T-SQL query statement below */
SELECT
    c.CustomerName,
    MIN(o.OrderDate) AS FirstOrderDate
FROM
    Customers c
LEFT JOIN
    Orders o ON c.CustomerID = o.CustomerID
GROUP BY
    c.CustomerID, c.CustomerName 
ORDER BY
    FirstOrderDate;

