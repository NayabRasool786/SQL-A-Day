----------------------------------------------------------------------------------
-- Schema For Problem Statement
----------------------------------------------------------------------------------
-- Drop the table if it already exists to prevent errors on re-running the script
IF OBJECT_ID('Products', 'U') IS NOT NULL
    DROP TABLE Products;
GO

-- Create the Products table
-- product_id is the primary key.
-- low_fats and recyclable columns have CHECK constraints to emulate the ENUM type,
-- ensuring they only accept 'Y' or 'N'.
CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    low_fats CHAR(1) NOT NULL,
    recyclable CHAR(1) NOT NULL,
    CONSTRAINT CK_Products_low_fats CHECK (low_fats IN ('Y', 'N')),
    CONSTRAINT CK_Products_recyclable CHECK (recyclable IN ('Y', 'N'))
);
GO

-- Insert sample data into the Products table
INSERT INTO Products (product_id, low_fats, recyclable) VALUES
(0, 'Y', 'N'),
(1, 'Y', 'Y'),
(2, 'N', 'Y'),
(3, 'Y', 'Y'),
(4, 'N', 'N'),
(5, 'Y', 'Y'),
(6, 'N', 'N'),
(7, 'Y', 'N'),
(8, 'N', 'Y'),
(9, 'Y', 'Y'),
(10, 'N', 'N'),
(11, 'Y', 'N'),
(12, 'N', 'Y'),
(13, 'Y', 'Y'),
(14, 'N', 'N'),
(15, 'Y', 'Y');
GO

-- Optional: A SELECT statement to verify the data has been inserted correctly
SELECT * FROM Products;
GO


----------------------------------------------------------------------------------
-- Solution For Problem Statement
----------------------------------------------------------------------------------
/* Write your T-SQL query statement below */
SELECT product_id
FROM Products
WHERE low_fats = 'Y' AND recyclable = 'Y';