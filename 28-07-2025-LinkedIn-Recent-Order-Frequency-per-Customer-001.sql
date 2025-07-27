----------------------------------------------------------------------------------
-- Schema For Problem Statement
----------------------------------------------------------------------------------
-- Create a table for customers
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY IDENTITY(1,1),
    FirstName NVARCHAR(50),
    LastName NVARCHAR(50),
    Email NVARCHAR(100) UNIQUE
);
GO

-- Create a table for orders
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY IDENTITY(1,1),
    CustomerID INT FOREIGN KEY REFERENCES Customers(CustomerID),
    OrderDate DATETIME,
    OrderTotal DECIMAL(10, 2)
);
GO
-- Recommended index for peak performance
CREATE INDEX IX_Orders_CustomerID_OrderDate ON dbo.Orders(CustomerID, OrderDate);

-- Insert sample customers
INSERT INTO Customers (FirstName, LastName, Email) VALUES
('John', 'Doe', 'john.doe@example.com'),
('Jane', 'Smith', 'jane.smith@example.com'),
('Peter', 'Jones', 'peter.jones@example.com');
GO

-- Insert sample orders
-- Note: GETDATE() is used to simulate orders relative to the current date.
INSERT INTO Orders (CustomerID, OrderDate, OrderTotal) VALUES
(1, GETDATE(), 150.75),           -- John, today (within 30 days)
(1, DATEADD(day, -25, GETDATE()), 89.50),   -- John, 25 days ago (within 30 days)
(2, GETDATE(), 200.00),           -- Jane, today (within 30 days)
(1, DATEADD(day, -45, GETDATE()), 110.00),  -- John, 45 days ago (OUTSIDE 30 days)
(2, DATEADD(day, -10, GETDATE()), 35.20),   -- Jane, 10 days ago (within 30 days)
(3, DATEADD(day, -60, GETDATE()), 500.00);  -- Peter, 60 days ago (OUTSIDE 30 days)
GO

----------------------------------------------------------------------------------
-- Solution For Problem Statement
----------------------------------------------------------------------------------
SELECT
    C.CustomerID,
    C.FirstName,
    C.LastName,
    COUNT(O.OrderID) AS NumberOfOrders
FROM
    dbo.Customers AS C
INNER JOIN
    dbo.Orders AS O ON C.CustomerID = O.CustomerID
WHERE
    O.OrderDate >= DATEADD(day, -30, GETDATE()) -- Filters for the last 30 days
GROUP BY
    C.CustomerID,
    C.FirstName,
    C.LastName
ORDER BY
    NumberOfOrders DESC;