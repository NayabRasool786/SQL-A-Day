-- =================================================================
-- Problem: Find the number of times each student attended each exam.
--          The result table should contain all students and all
--          subjects, ordered by student_id and subject_name.
-- =================================================================

-- SQL Server Schema and Solution for "Students and Examinations"

-- Drop tables in the correct order to avoid foreign key constraints if they exist
IF OBJECT_ID('dbo.Examinations', 'U') IS NOT NULL
    DROP TABLE dbo.Examinations;
GO
IF OBJECT_ID('dbo.Students', 'U') IS NOT NULL
    DROP TABLE dbo.Students;
GO
IF OBJECT_ID('dbo.Subjects', 'U') IS NOT NULL
    DROP TABLE dbo.Subjects;
GO

-- Create the Students table
CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(255)
);
GO

-- Create the Subjects table
CREATE TABLE Subjects (
    subject_name VARCHAR(255) PRIMARY KEY
);
GO

-- Create the Examinations table
CREATE TABLE Examinations (
    student_id INT,
    subject_name VARCHAR(255)
);
GO

-- Insert sample data
INSERT INTO Students (student_id, student_name) VALUES
(1, 'Alice'),
(2, 'Bob'),
(13, 'John'),
(6, 'Alex');
GO

INSERT INTO Subjects (subject_name) VALUES
('Math'),
('Physics'),
('Programming');
GO

INSERT INTO Examinations (student_id, subject_name) VALUES
(1, 'Math'),
(1, 'Physics'),
(1, 'Programming'),
(2, 'Programming'),
(1, 'Physics'),
(1, 'Math'),
(13, 'Math'),
(13, 'Programming'),
(13, 'Physics'),
(2, 'Math'),
(1, 'Math');
GO

-- Verify data insertion
SELECT * FROM Students;
SELECT * FROM Subjects;
SELECT * FROM Examinations;
GO


-- ====================
-- Solution Query
--=====================

/* Write your T-SQL query statement below */

WITH ExamCounts AS (
    SELECT
        student_id,
        subject_name,
        COUNT(*) as attended_exams
    FROM
        Examinations
    GROUP BY
        student_id, subject_name
)
SELECT
    s.student_id,
    s.student_name,
    sub.subject_name,
    ISNULL(ec.attended_exams, 0) AS attended_exams
FROM
    Students s
CROSS JOIN
    Subjects sub
LEFT JOIN
    ExamCounts ec ON s.student_id = ec.student_id AND sub.subject_name = ec.subject_name
ORDER BY
    s.student_id, sub.subject_name;