-- Drop the table if it already exists to prevent errors on re-running the script
IF OBJECT_ID('Products', 'U') IS NOT NULL
    DROP TABLE Products;
GO

-- Create the Products table
-- This table will store product information, including its ID and whether it's
-- low fat or recyclable.
CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    -- SQL Server does not have a native ENUM type.
    -- We use CHAR(1) and a CHECK constraint to ensure data integrity,
    -- allowing only 'Y' or 'N' as values.
    low_fats CHAR(1) NOT NULL CHECK (low_fats IN ('Y', 'N')),
    recyclable CHAR(1) NOT NULL CHECK (recyclable IN ('Y', 'N'))
);
GO

-- Insert an expanded set of sample data into the Products table
-- This provides more varied data for testing your query solution.
INSERT INTO Products (product_id, low_fats, recyclable) VALUES
(0, 'Y', 'N'),
(1, 'Y', 'Y'), -- Should be in the result
(2, 'N', 'Y'),
(3, 'Y', 'Y'), -- Should be in the result
(4, 'N', 'N'),
(5, 'Y', 'N'),
(6, 'Y', 'Y'), -- Should be in the result
(7, 'N', 'N'),
(8, 'N', 'Y'),
(9, 'Y', 'Y'), -- Should be in the result
(10, 'Y', 'N');
GO

-- Optional: Select all data from the table to verify the insertion
-- This allows you to see the full dataset before you write your solution.
SELECT * FROM Products;
GO