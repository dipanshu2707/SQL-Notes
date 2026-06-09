# SQL Day 1: Fundamentals Lecture Notes

## Table of Contents
1. [What is SQL?](#what-is-sql)
2. [Core Concepts](#core-concepts)
3. [SQL Basics](#sql-basics)
4. [Basic Queries](#basic-queries)
5. [Practice Exercises](#practice-exercises)

---

## What is SQL?

**SQL** stands for **Structured Query Language**. It is the standard language used to interact with relational databases.

### Key Points:
- SQL is used to **retrieve**, **insert**, **update**, and **delete** data
- Works with **relational databases** (organized in tables/rows/columns)
- **Database-independent** (works with MySQL, PostgreSQL, SQL Server, Oracle, etc.)
- **Case-insensitive** (SELECT = select = SeLeCt)
- Uses **semicolon (;)** to end statements

---

## Core Concepts

### 1. Database
A collection of organized data stored on a computer system.

### 2. Table
A structure with rows and columns, like a spreadsheet.
```
Example: Students Table

| StudentID | Name       | Age | Grade |
|-----------|------------|-----|-------|
| 101       | Alice      | 20  | A     |
| 102       | Bob        | 21  | B     |
| 103       | Charlie    | 19  | A     |
```

### 3. Key Terms
- **Column/Field**: Vertical structure representing a specific attribute (e.g., Name, Age)
- **Row/Record**: Horizontal structure representing a complete entry
- **Primary Key**: Unique identifier for each row (e.g., StudentID)
- **Data Type**: Type of data a column can hold (INT, VARCHAR, DATE, etc.)

### 4. Common Data Types
| Data Type | Description | Example |
|-----------|------------|---------|
| INT | Integer numbers | 25, 100, -50 |
| VARCHAR(n) | Text with max length n | 'Alice', 'SQL' |
| DECIMAL(m,n) | Decimal numbers | 19.99, 3.14 |
| DATE | Date values | 2024-01-15 |
| BOOLEAN | True/False values | TRUE, FALSE |

---

## SQL Basics

### Structure of a Simple Query
```sql
SELECT column1, column2, ...
FROM table_name
WHERE condition;
```

### 1. SELECT Statement
Retrieves data from a database.

**Syntax:**
```sql
SELECT column1, column2, ...
FROM table_name;
```

**Examples:**
```sql
-- Get all columns
SELECT * FROM Students;

-- Get specific columns
SELECT Name, Age FROM Students;

-- Get single column
SELECT StudentID FROM Students;
```

### 2. WHERE Clause
Filters records based on conditions.

**Syntax:**
```sql
SELECT column1, column2, ...
FROM table_name
WHERE condition;
```

**Comparison Operators:**
| Operator | Meaning |
|----------|---------|
| = | Equal to |
| != or <> | Not equal to |
| > | Greater than |
| < | Less than |
| >= | Greater than or equal to |
| <= | Less than or equal to |

**Examples:**
```sql
-- Get students older than 20
SELECT Name, Age FROM Students WHERE Age > 20;

-- Get students with grade A
SELECT Name FROM Students WHERE Grade = 'A';

-- Get students not from grade A
SELECT Name FROM Students WHERE Grade != 'A';
```

### 3. AND, OR, NOT Operators
Combine multiple conditions.

**Examples:**
```sql
-- AND: Both conditions must be true
SELECT Name FROM Students WHERE Age > 20 AND Grade = 'A';

-- OR: At least one condition must be true
SELECT Name FROM Students WHERE Grade = 'A' OR Age < 20;

-- NOT: Negates a condition
SELECT Name FROM Students WHERE NOT Grade = 'B';
```

### 4. ORDER BY Clause
Sorts results in ascending or descending order.

**Syntax:**
```sql
SELECT column1, column2, ...
FROM table_name
ORDER BY column1 ASC|DESC;
```

**Examples:**
```sql
-- Sort by age in ascending order (default)
SELECT Name, Age FROM Students ORDER BY Age;

-- Sort by age in descending order
SELECT Name, Age FROM Students ORDER BY Age DESC;

-- Sort by multiple columns
SELECT Name, Age FROM Students ORDER BY Grade, Age DESC;
```

### 5. LIMIT Clause
Limits the number of results returned.

**Syntax:**
```sql
SELECT column1, column2, ...
FROM table_name
LIMIT number;
```

**Examples:**
```sql
-- Get first 5 students
SELECT * FROM Students LIMIT 5;

-- Get top 3 students by age
SELECT Name, Age FROM Students ORDER BY Age DESC LIMIT 3;
```

### 6. DISTINCT Keyword
Returns unique/different values only.

**Syntax:**
```sql
SELECT DISTINCT column1, column2, ...
FROM table_name;
```

**Examples:**
```sql
-- Get unique grades
SELECT DISTINCT Grade FROM Students;

-- Count unique grades
SELECT COUNT(DISTINCT Grade) FROM Students;
```

---

## Basic Queries

### Aggregate Functions
Used to perform calculations on data.

| Function | Purpose |
|----------|---------|
| COUNT() | Counts rows |
| SUM() | Adds up values |
| AVG() | Calculates average |
| MAX() | Finds maximum |
| MIN() | Finds minimum |

**Examples:**
```sql
-- Count total students
SELECT COUNT(*) FROM Students;

-- Count students with grade A
SELECT COUNT(*) FROM Students WHERE Grade = 'A';

-- Average age of all students
SELECT AVG(Age) FROM Students;

-- Find oldest student's age
SELECT MAX(Age) FROM Students;

-- Total sum of ages
SELECT SUM(Age) FROM Students;
```

### Alias (AS)
Give a column or table a temporary name.

**Examples:**
```sql
-- Column alias
SELECT Name AS StudentName, Age AS StudentAge FROM Students;

-- Function with alias
SELECT COUNT(*) AS TotalStudents FROM Students;
SELECT AVG(Age) AS AverageAge FROM Students;
```

### BETWEEN Operator
Selects values within a range.

**Syntax:**
```sql
SELECT column1, column2, ...
FROM table_name
WHERE column BETWEEN value1 AND value2;
```

**Examples:**
```sql
-- Get students aged between 19 and 21
SELECT Name, Age FROM Students WHERE Age BETWEEN 19 AND 21;

-- Get students NOT between these ages
SELECT Name, Age FROM Students WHERE Age NOT BETWEEN 19 AND 21;
```

### IN Operator
Allows multiple values in WHERE clause.

**Syntax:**
```sql
SELECT column1, column2, ...
FROM table_name
WHERE column IN (value1, value2, ...);
```

**Examples:**
```sql
-- Get students with grades A or B
SELECT Name, Grade FROM Students WHERE Grade IN ('A', 'B');

-- Get students with specific StudentIDs
SELECT * FROM Students WHERE StudentID IN (101, 103, 105);
```

### LIKE Operator
Pattern matching for text.

**Syntax:**
```sql
SELECT column1, column2, ...
FROM table_name
WHERE column LIKE pattern;
```

**Wildcards:**
- `%` = zero or more characters
- `_` = exactly one character

**Examples:**
```sql
-- Names starting with 'A'
SELECT Name FROM Students WHERE Name LIKE 'A%';

-- Names ending with 'e'
SELECT Name FROM Students WHERE Name LIKE '%e';

-- Names containing 'ar'
SELECT Name FROM Students WHERE Name LIKE '%ar%';

-- Names with exactly 3 characters
SELECT Name FROM Students WHERE Name LIKE '___';
```

---

## Practice Exercises

### Setup: Sample Students Table
```sql
CREATE TABLE Students (
    StudentID INT,
    Name VARCHAR(50),
    Age INT,
    Grade VARCHAR(1),
    City VARCHAR(50)
);

INSERT INTO Students VALUES
(101, 'Alice', 20, 'A', 'New York'),
(102, 'Bob', 21, 'B', 'London'),
(103, 'Charlie', 19, 'A', 'New York'),
(104, 'David', 22, 'C', 'Paris'),
(105, 'Emma', 20, 'B', 'London'),
(106, 'Frank', 21, 'A', 'New York');
```

### Exercise Questions (Try these!)

1. **Basic SELECT**
   - Write a query to get all students
   - Write a query to get only names and ages

2. **WHERE Clause**
   - Get students older than 20
   - Get students from New York
   - Get students with grade A or B

3. **Combining Conditions**
   - Get students from New York AND grade A
   - Get students older than 20 OR from Paris
   - Get students NOT from London

4. **Sorting**
   - Get all students sorted by age (ascending)
   - Get all students sorted by name (descending)

5. **Aggregate Functions**
   - Count total number of students
   - Find the average age
   - Find the oldest student's age
   - Find the youngest student's age

6. **LIMIT and DISTINCT**
   - Get the first 3 students
   - Get unique cities
   - Get unique grades

7. **Pattern Matching**
   - Get students whose name starts with 'A'
   - Get students whose name contains 'a'

8. **BETWEEN and IN**
   - Get students aged between 19 and 21
   - Get students with ID 101, 103, 105

---

## Quick Reference Guide

### Most Common SQL Commands (Day 1)
```sql
SELECT * FROM table_name;                           -- Get all data
SELECT col1, col2 FROM table_name;                 -- Get specific columns
SELECT * FROM table_name WHERE condition;          -- Filter by condition
SELECT * FROM table_name ORDER BY col ASC;         -- Sort ascending
SELECT * FROM table_name ORDER BY col DESC;        -- Sort descending
SELECT * FROM table_name LIMIT 10;                 -- Limit results
SELECT COUNT(*) FROM table_name;                   -- Count rows
SELECT AVG(col) FROM table_name;                   -- Average
SELECT DISTINCT col FROM table_name;               -- Unique values
```

---

## Key Takeaways

✓ SQL is used to interact with relational databases
✓ SELECT retrieves data, WHERE filters, ORDER BY sorts
✓ Use AND/OR/NOT to combine conditions
✓ Aggregate functions (COUNT, AVG, MAX, MIN, SUM) perform calculations
✓ LIKE is used for pattern matching
✓ LIMIT restricts number of results
✓ Semicolon ends SQL statements
✓ SQL is database-independent

---

## Next Steps (Day 2+)
- INSERT, UPDATE, DELETE statements
- GROUP BY and HAVING
- JOIN operations (INNER, LEFT, RIGHT, FULL)
- Subqueries
- Views
- Creating and modifying tables

---

**Happy Learning! 🚀**
