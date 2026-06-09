-- ============================================================================
-- SQL DAY 1: FUNDAMENTALS - EXECUTABLE TUTORIAL
-- ============================================================================
-- This SQL file contains all Day 1 concepts with executable queries
-- Copy and paste sections into your database client to learn SQL
-- ============================================================================

-- ============================================================================
-- PART 1: DATABASE & TABLE CREATION
-- ============================================================================

-- Create a sample database (optional, depending on your DBMS)
-- CREATE DATABASE SQLLearning;

-- Drop table if it exists (to start fresh)
DROP TABLE IF EXISTS Students;

-- Create Students table
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    Name VARCHAR(50),
    Age INT,
    Grade VARCHAR(1),
    City VARCHAR(50)
);

-- Insert sample data
INSERT INTO Students VALUES
(101, 'Alice', 20, 'A', 'New York'),
(102, 'Bob', 21, 'B', 'London'),
(103, 'Charlie', 19, 'A', 'New York'),
(104, 'David', 22, 'C', 'Paris'),
(105, 'Emma', 20, 'B', 'London'),
(106, 'Frank', 21, 'A', 'New York');

-- ============================================================================
-- PART 2: BASIC SELECT QUERIES
-- ============================================================================

-- Display all students (all columns)
SELECT * FROM Students;

-- Display specific columns only
SELECT Name, Age FROM Students;

-- Display single column
SELECT StudentID FROM Students;

-- ============================================================================
-- PART 3: WHERE CLAUSE - FILTERING DATA
-- ============================================================================

-- Get students older than 20
SELECT Name, Age FROM Students WHERE Age > 20;

-- Get students with grade A
SELECT Name, Grade FROM Students WHERE Grade = 'A';

-- Get students NOT with grade B
SELECT Name, Grade FROM Students WHERE Grade != 'B';
-- Alternative syntax
SELECT Name, Grade FROM Students WHERE Grade <> 'B';

-- Get students from New York
SELECT Name, City FROM Students WHERE City = 'New York';

-- Get students with age less than 21
SELECT Name, Age FROM Students WHERE Age < 21;

-- Get students aged 20 or older
SELECT Name, Age FROM Students WHERE Age >= 20;

-- ============================================================================
-- PART 4: COMBINING CONDITIONS - AND, OR, NOT
-- ============================================================================

-- Get students from New York AND with grade A (both conditions required)
SELECT Name, Grade, City FROM Students WHERE City = 'New York' AND Grade = 'A';

-- Get students with grade A OR B (either condition is okay)
SELECT Name, Grade FROM Students WHERE Grade = 'A' OR Grade = 'B';

-- Get students older than 20 AND from New York
SELECT Name, Age, City FROM Students WHERE Age > 20 AND City = 'New York';

-- Get students from Paris OR London
SELECT Name, City FROM Students WHERE City = 'Paris' OR City = 'London';

-- Get students NOT from New York
SELECT Name, City FROM Students WHERE NOT City = 'New York';

-- Get students NOT with grade C
SELECT Name, Grade FROM Students WHERE NOT Grade = 'C';

-- Complex condition: (from New York AND grade A) OR age > 21
SELECT Name, Age, Grade, City FROM Students 
WHERE (City = 'New York' AND Grade = 'A') OR Age > 21;

-- ============================================================================
-- PART 5: ORDER BY - SORTING RESULTS
-- ============================================================================

-- Sort by age in ascending order (default)
SELECT Name, Age FROM Students ORDER BY Age;

-- Sort by age in descending order (highest to lowest)
SELECT Name, Age FROM Students ORDER BY Age DESC;

-- Sort by name alphabetically
SELECT Name, Age FROM Students ORDER BY Name;

-- Sort by name in reverse alphabetical order
SELECT Name, Age FROM Students ORDER BY Name DESC;

-- Sort by grade, then by age (descending)
SELECT Name, Age, Grade FROM Students ORDER BY Grade, Age DESC;

-- Sort by age descending, then name ascending
SELECT Name, Age FROM Students ORDER BY Age DESC, Name ASC;

-- Get students sorted by city name
SELECT Name, City FROM Students ORDER BY City;

-- ============================================================================
-- PART 6: LIMIT - RESTRICTING NUMBER OF RESULTS
-- ============================================================================

-- Get first 3 students
SELECT * FROM Students LIMIT 3;

-- Get first 5 students sorted by age
SELECT Name, Age FROM Students ORDER BY Age LIMIT 5;

-- Get first 2 oldest students
SELECT Name, Age FROM Students ORDER BY Age DESC LIMIT 2;

-- Get first record
SELECT * FROM Students LIMIT 1;

-- Get 2 students starting from position 3 (OFFSET)
SELECT * FROM Students LIMIT 2 OFFSET 2;

-- ============================================================================
-- PART 7: DISTINCT - UNIQUE VALUES
-- ============================================================================

-- Get all unique grades
SELECT DISTINCT Grade FROM Students;

-- Get unique cities
SELECT DISTINCT City FROM Students;

-- Count unique grades
SELECT COUNT(DISTINCT Grade) FROM Students;

-- Count unique cities
SELECT COUNT(DISTINCT City) FROM Students;

-- Get unique age values
SELECT DISTINCT Age FROM Students;

-- ============================================================================
-- PART 8: AGGREGATE FUNCTIONS - CALCULATIONS
-- ============================================================================

-- Count total number of students
SELECT COUNT(*) FROM Students;

-- Count students with grade A
SELECT COUNT(*) FROM Students WHERE Grade = 'A';

-- Count unique names (should be same as total count for this table)
SELECT COUNT(DISTINCT Name) FROM Students;

-- Calculate average age
SELECT AVG(Age) FROM Students;

-- Find maximum (oldest) age
SELECT MAX(Age) FROM Students;

-- Find minimum (youngest) age
SELECT MIN(Age) FROM Students;

-- Sum of all ages
SELECT SUM(Age) FROM Students;

-- Average age with alias (temporary column name)
SELECT AVG(Age) AS AverageAge FROM Students;

-- Multiple aggregates at once
SELECT 
    COUNT(*) AS TotalStudents,
    AVG(Age) AS AverageAge,
    MAX(Age) AS OldestAge,
    MIN(Age) AS YoungestAge
FROM Students;

-- Average age for students from New York
SELECT AVG(Age) FROM Students WHERE City = 'New York';

-- Count of students by city
SELECT City, COUNT(*) AS StudentCount FROM Students GROUP BY City;

-- ============================================================================
-- PART 9: ALIAS - RENAMING COLUMNS
-- ============================================================================

-- Simple column alias
SELECT Name AS StudentName, Age AS StudentAge FROM Students;

-- Alias for aggregates
SELECT COUNT(*) AS TotalStudents FROM Students;

SELECT AVG(Age) AS AverageStudentAge FROM Students;

SELECT MAX(Age) AS OldestStudentAge FROM Students;

-- Multiple aliases
SELECT 
    Name AS StudentName,
    Age AS StudentAge,
    Grade AS StudentGrade,
    City AS StudentCity
FROM Students;

-- Alias for complex expressions
SELECT Name, Age, Grade AS GradeLevel FROM Students;

-- ============================================================================
-- PART 10: BETWEEN - RANGE QUERIES
-- ============================================================================

-- Get students aged between 19 and 21 (inclusive)
SELECT Name, Age FROM Students WHERE Age BETWEEN 19 AND 21;

-- Get students NOT between 20 and 22
SELECT Name, Age FROM Students WHERE Age NOT BETWEEN 20 AND 22;

-- Get students aged exactly between 19 and 21
SELECT Name, Age FROM Students WHERE Age >= 19 AND Age <= 21;

-- ============================================================================
-- PART 11: IN OPERATOR - MULTIPLE VALUES
-- ============================================================================

-- Get students with grade A or B
SELECT Name, Grade FROM Students WHERE Grade IN ('A', 'B');

-- Get students with specific student IDs
SELECT * FROM Students WHERE StudentID IN (101, 103, 105);

-- Get students from specific cities
SELECT Name, City FROM Students WHERE City IN ('New York', 'Paris');

-- Get students NOT in these grades
SELECT Name, Grade FROM Students WHERE Grade NOT IN ('A', 'B');

-- Get students NOT from London or Paris
SELECT Name, City FROM Students WHERE City NOT IN ('London', 'Paris');

-- ============================================================================
-- PART 12: LIKE - PATTERN MATCHING
-- ============================================================================

-- Names starting with 'A'
SELECT Name FROM Students WHERE Name LIKE 'A%';

-- Names ending with 'e'
SELECT Name FROM Students WHERE Name LIKE '%e';

-- Names containing 'a' (case-insensitive in most databases)
SELECT Name FROM Students WHERE Name LIKE '%a%';

-- Names ending with 'ie'
SELECT Name FROM Students WHERE Name LIKE '%ie';

-- Names starting with 'C'
SELECT Name FROM Students WHERE Name LIKE 'C%';

-- Names NOT starting with 'A'
SELECT Name FROM Students WHERE Name NOT LIKE 'A%';

-- Underscore (_) matches exactly one character
-- Names with exactly 3 characters
SELECT Name FROM Students WHERE Name LIKE '___';

-- Names with exactly 5 characters
SELECT Name FROM Students WHERE Name LIKE '_____';

-- Names with 'a' as second character
SELECT Name FROM Students WHERE Name LIKE '_a%';

-- ============================================================================
-- PRACTICE EXERCISES - TRY THESE QUERIES!
-- ============================================================================

-- EXERCISE 1: Basic SELECT
-- 1a. Write a query to get all students
SELECT * FROM Students;

-- 1b. Get only names and cities
SELECT Name, City FROM Students;


-- EXERCISE 2: WHERE Clause
-- 2a. Get students older than 20
SELECT Name, Age FROM Students WHERE Age > 20;

-- 2b. Get students from London
SELECT Name, City FROM Students WHERE City = 'London';

-- 2c. Get students with grade A or B
SELECT Name, Grade FROM Students WHERE Grade IN ('A', 'B');


-- EXERCISE 3: Combining Conditions
-- 3a. Get students from New York AND grade A
SELECT Name, Grade, City FROM Students WHERE City = 'New York' AND Grade = 'A';

-- 3b. Get students older than 20 OR from Paris
SELECT Name, Age, City FROM Students WHERE Age > 20 OR City = 'Paris';

-- 3c. Get students NOT from London
SELECT Name, City FROM Students WHERE NOT City = 'London';


-- EXERCISE 4: Sorting
-- 4a. Get all students sorted by age (ascending)
SELECT Name, Age FROM Students ORDER BY Age;

-- 4b. Get all students sorted by name (descending)
SELECT Name FROM Students ORDER BY Name DESC;

-- 4c. Get students sorted by grade, then name
SELECT Name, Grade FROM Students ORDER BY Grade, Name;


-- EXERCISE 5: Aggregate Functions
-- 5a. Count total number of students
SELECT COUNT(*) AS TotalStudents FROM Students;

-- 5b. Find the average age
SELECT AVG(Age) AS AverageAge FROM Students;

-- 5c. Find the oldest student's age
SELECT MAX(Age) AS OldestAge FROM Students;

-- 5d. Find the youngest student's age
SELECT MIN(Age) AS YoungestAge FROM Students;

-- 5e. Sum of all ages
SELECT SUM(Age) AS TotalAge FROM Students;


-- EXERCISE 6: LIMIT and DISTINCT
-- 6a. Get the first 3 students
SELECT * FROM Students LIMIT 3;

-- 6b. Get unique cities
SELECT DISTINCT City FROM Students;

-- 6c. Get unique grades
SELECT DISTINCT Grade FROM Students;

-- 6d. Count unique grades
SELECT COUNT(DISTINCT Grade) AS UniqueGrades FROM Students;


-- EXERCISE 7: Pattern Matching
-- 7a. Get students whose name starts with 'A'
SELECT Name FROM Students WHERE Name LIKE 'A%';

-- 7b. Get students whose name contains 'a'
SELECT Name FROM Students WHERE Name LIKE '%a%';

-- 7c. Get students whose name ends with 'e'
SELECT Name FROM Students WHERE Name LIKE '%e';


-- EXERCISE 8: BETWEEN and IN
-- 8a. Get students aged between 19 and 21
SELECT Name, Age FROM Students WHERE Age BETWEEN 19 AND 21;

-- 8b. Get students with ID 101, 103, 105
SELECT * FROM Students WHERE StudentID IN (101, 103, 105);

-- 8c. Get students NOT between age 20 and 22
SELECT Name, Age FROM Students WHERE Age NOT BETWEEN 20 AND 22;


-- ============================================================================
-- BONUS: COMPLEX QUERIES - COMBINING MULTIPLE CONCEPTS
-- ============================================================================

-- Get top 2 oldest students from New York
SELECT Name, Age, City FROM Students 
WHERE City = 'New York' 
ORDER BY Age DESC 
LIMIT 2;

-- Count students by grade
SELECT Grade, COUNT(*) AS StudentCount FROM Students GROUP BY Grade;

-- Get students older than average age
SELECT Name, Age FROM Students 
WHERE Age > (SELECT AVG(Age) FROM Students);

-- Get all information for students with highest grade
SELECT * FROM Students WHERE Grade = 'A' ORDER BY Name;

-- ============================================================================
-- QUICK REFERENCE - COMMON COMMANDS
-- ============================================================================

-- SELECT specific columns with WHERE
-- SELECT col1, col2 FROM table WHERE condition;

-- ORDER BY with LIMIT
-- SELECT * FROM table ORDER BY column DESC LIMIT 10;

-- COUNT with WHERE
-- SELECT COUNT(*) FROM table WHERE condition;

-- Multiple conditions
-- SELECT * FROM table WHERE col1 = 'value' AND col2 > 100 OR col3 LIKE 'A%';

-- ============================================================================
-- END OF DAY 1 TUTORIAL
-- ============================================================================
-- Concepts Covered:
-- ✓ CREATE TABLE and INSERT data
-- ✓ SELECT and WHERE filtering
-- ✓ AND, OR, NOT operators
-- ✓ ORDER BY sorting
-- ✓ LIMIT restricting results
-- ✓ DISTINCT unique values
-- ✓ Aggregate functions (COUNT, AVG, MAX, MIN, SUM)
-- ✓ ALIAS renaming columns
-- ✓ BETWEEN range queries
-- ✓ IN operator
-- ✓ LIKE pattern matching
-- ============================================================================
