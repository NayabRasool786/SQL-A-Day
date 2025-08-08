-- =================================================================
-- Problem: Find the average time each machine takes to complete a process.
--          The time to complete a process is the 'end' timestamp minus
--          the 'start' timestamp. The average time is the total time
--          divided by the number of processes. Round the result to 3
--          decimal places.
-- =================================================================

-- SQL Server Schema and Solution for "Average Time of Process per Machine"

-- Drop the table if it already exists to ensure a clean setup
IF OBJECT_ID('dbo.Activity', 'U') IS NOT NULL
    DROP TABLE dbo.Activity;
GO

-- Create the Activity table
-- This table logs the start and end activities for processes on various machines.
-- The primary key ensures each activity for a given process is unique.
CREATE TABLE Activity (
    machine_id INT,
    process_id INT,
    activity_type VARCHAR(10), -- Using VARCHAR as a substitute for ENUM
    timestamp FLOAT,
    PRIMARY KEY (machine_id, process_id, activity_type)
);
GO

-- Insert sample data into the Activity table
INSERT INTO Activity (machine_id, process_id, activity_type, timestamp) VALUES
(0, 0, 'start', 0.712),
(0, 0, 'end', 1.520),
(0, 1, 'start', 3.140),
(0, 1, 'end', 4.120),
(1, 0, 'start', 0.550),
(1, 0, 'end', 1.550),
(1, 1, 'start', 0.430),
(1, 1, 'end', 1.420),
(2, 0, 'start', 4.100),
(2, 0, 'end', 4.512),
(2, 1, 'start', 2.500),
(2, 1, 'end', 5.000);
GO

-- Verify that the data has been inserted correctly
SELECT * FROM Activity;
GO

-- ======================
-- Solution Query
-- ======================
SELECT
    a1.machine_id,
    ROUND(AVG(a2.timestamp - a1.timestamp ),3) as processing_time
FROM 
    Activity a1
JOIN 
    Activity a2 ON a1.machine_id=a2.machine_id AND a1.process_id=a2.process_id AND a1.activity_type = 'start' AND a2.activity_type= 'end'
GROUP BY
    a1.machine_id
