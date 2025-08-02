-- =================================================================
-- Problem: Report the product_name, year, and price for each
--          sale_id in the Sales table.
-- =================================================================

-- SQL Server Schema and Solution for "Product Sales Analysis I"

-- Drop tables in the correct order (child first, then parent) to avoid foreign key errors.
IF OBJECT_ID('dbo.Sales', 'U') IS NOT NULL
    DROP TABLE dbo.Sales;
GO
IF OBJECT_ID('dbo.Product', 'U') IS NOT NULL
    DROP TABLE dbo.Product;
GO

-- Create the Product table
-- This table acts as a lookup for product names.
CREATE TABLE Product (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(255)
);
GO

-- Create the Sales table
-- This table contains transactional data for each sale.
CREATE TABLE Sales (
    sale_id INT,
    product_id INT,
    year INT,
    quantity INT,
    price INT,
    PRIMARY KEY (sale_id, year), -- Composite primary key
    FOREIGN KEY (product_id) REFERENCES Product(product_id) -- Foreign key link to Product table
);
GO

-- Insert sample data into the Product table
INSERT INTO Product (product_id, product_name) VALUES
(100, 'Nokia'),
(200, 'Apple'),
(300, 'Samsung');
GO

-- Insert sample data into the Sales table
INSERT INTO Sales (sale_id, product_id, year, quantity, price) VALUES
(1, 100, 2008, 10, 5000),
(2, 100, 2009, 12, 5000),
(7, 200, 2011, 15, 9000);
GO

-- Verify the data has been inserted correctly
SELECT * FROM Product;
SELECT * FROM Sales;
GO


-- =======================
-- Solution Query
-- =======================

/* Write your T-SQL query statement below */
SELECT 
    P.product_name,
    S.year,
    S.price
FROM Product P
INNER JOIN 
    Sales S ON P.product_id = S.product_id ;

