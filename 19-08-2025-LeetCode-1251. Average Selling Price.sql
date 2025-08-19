-- =================================================================
-- Problem: Find the average selling price for each product.
--          average_price = (Total Price of Product) / (Number of products sold)
--          Round to 2 decimal places. If a product was never sold,
--          its average price is 0.
-- =================================================================

-- SQL Server Schema and Solution for "Average Selling Price"

-- Drop tables in the correct order to avoid foreign key errors
IF OBJECT_ID('dbo.UnitsSold', 'U') IS NOT NULL
    DROP TABLE dbo.UnitsSold;
GO
IF OBJECT_ID('dbo.Prices', 'U') IS NOT NULL
    DROP TABLE dbo.Prices;
GO

-- Create the Prices table
CREATE TABLE Prices (
    product_id INT,
    start_date DATE,
    end_date DATE,
    price INT,
    PRIMARY KEY (product_id, start_date, end_date)
);
GO

-- Create the UnitsSold table
CREATE TABLE UnitsSold (
    product_id INT,
    purchase_date DATE,
    units INT
);
GO

-- Insert sample data
INSERT INTO Prices (product_id, start_date, end_date, price) VALUES
(1, '2019-02-17', '2019-02-28', 5),
(1, '2019-03-01', '2019-03-22', 20),
(2, '2019-02-01', '2019-02-20', 15),
(2, '2019-02-21', '2019-03-31', 30),
(3, '2020-01-01', '2020-12-31', 100); -- Product with no sales
GO

INSERT INTO UnitsSold (product_id, purchase_date, units) VALUES
(1, '2019-02-25', 100),
(1, '2019-03-01', 15),
(2, '2019-02-10', 200),
(2, '2019-03-22', 30);
GO

-- Verify data insertion
SELECT * FROM Prices;
SELECT * FROM UnitsSold;
GO

-- ====================
-- Solution Query 
-- ====================

/* Write your T-SQL query statement below */
SELECT
    p.product_id,
    ISNULL(
        ROUND(
            SUM(CAST(p.price AS FLOAT) * us.units) / SUM(us.units),
        2),
    0) AS average_price
FROM
    Prices p
LEFT JOIN
    UnitsSold us ON p.product_id = us.product_id AND us.purchase_date BETWEEN p.start_date AND p.end_date
GROUP BY
    p.product_id;
