-- PROJECT: DATA TRANSFORMER


-- Create and use database

CREATE DATABASE DataTransformer;

-- o/p:-Query OK, 1 row affected (0.379 sec)


USE DataTransformer;

-- o/p:-Database changed




-- 1. CUSTOMERS TABLE
-- Create Customers Table

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    RegistrationDate DATE
);

-- o/p:-Query OK, 0 rows affected (0.404 sec)



-- Insert sample data into Customers Table

INSERT INTO Customers (CustomerID, FirstName, LastName, Email, RegistrationDate)
VALUES
(1, 'John', 'Doe', 'john.doe@email.com', '2022-03-15'),
(2, 'Jane', 'Smith', 'jane.smith@email.com', '2021-11-02');

-- o/p:-Query OK, 2 rows affected (0.106 sec)
Records: 2  Duplicates: 0  Warnings: 0

--Table: 

 select * from Customers;
-- --+------------+-----------+----------+----------------------+------------------+
-- | CustomerID | FirstName | LastName | Email                | RegistrationDate |
-- +------------+-----------+----------+----------------------+------------------+
-- |          1 | John      | Doe      | john.doe@email.com   | 2022-03-15       |
-- |          2 | Jane      | Smith    | jane.smith@email.com | 2021-11-02       |
-- +------------+-----------+----------+----------------------+------------------+
-- 2 rows in set (0.024 sec)



-- 2. ORDERS TABLE
-- Create Orders Table

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    TotalAmount DECIMAL(10,2)
);

-- o/p:-Query OK, 0 rows affected (0.105 sec)



-- Insert sample data into Orders Table

INSERT INTO Orders (OrderID, CustomerID, OrderDate, TotalAmount)
VALUES
(101, 1, '2023-07-01', 150.50),
(102, 2, '2023-07-03', 200.75);

-- o/p:-

Query OK, 2 rows affected (0.053 sec)
Records: 2  Duplicates: 0  Warnings: 0



--Table: 

 select * from Orders;

-- +---------+------------+------------+-------------+
-- | OrderID | CustomerID | OrderDate  | TotalAmount |
-- +---------+------------+------------+-------------+
-- |     101 |          1 | 2023-07-01 |      150.50 |
-- |     102 |          2 | 2023-07-03 |      200.75 |
-- +---------+------------+------------+-------------+
-- 2 rows in set (0.006 sec)



-- 3. EMPLOYEES TABLE
-- Create Employees Table

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Department VARCHAR(50),
    HireDate DATE,
    Salary DECIMAL(10,2)
);

-- o/p:-Query OK, 0 rows affected (0.149 sec)



-- Insert sample data into Employees Table

INSERT INTO Employees (EmployeeID, FirstName, LastName, Department, HireDate, Salary)
VALUES
(1, 'Mark', 'Johnson', 'Sales', '2020-01-15', 50000.00),
(2, 'Susan', 'Lee', 'HR', '2021-03-20', 55000.00);

-- o/p:-Query OK, 2 rows affected (0.074 sec)
Records: 2  Duplicates: 0  Warnings: 0


--Table: 

 select * from Employees;


--  +------------+-----------+----------+------------+------------+----------+
-- | EmployeeID | FirstName | LastName | Department | HireDate   | Salary   |
-- +------------+-----------+----------+------------+------------+----------+
-- |          1 | Mark      | Johnson  | Sales      | 2020-01-15 | 50000.00 |
-- |          2 | Susan     | Lee      | HR         | 2021-03-20 | 55000.00 |
-- +------------+-----------+----------+------------+------------+----------+
-- 2 rows in set (0.009 sec)


-- 1. INNER JOIN
-- Retrieve all orders and customer details where orders exist.

SELECT
    Orders.OrderID,
    Orders.OrderDate,
    Orders.TotalAmount,
    Customers.CustomerID,
    Customers.FirstName,
    Customers.LastName,
    Customers.Email
FROM Orders
INNER JOIN Customers
ON Orders.CustomerID = Customers.CustomerID;

-- o/p:-

-- +---------+------------+-------------+------------+-----------+----------+----------------------+
-- | OrderID | OrderDate  | TotalAmount | CustomerID | FirstName | LastName | Email                |
-- +---------+------------+-------------+------------+-----------+----------+----------------------+
-- |     101 | 2023-07-01 |      150.50 |          1 | John      | Doe      | john.doe@email.com   |
-- |     102 | 2023-07-03 |      200.75 |          2 | Jane      | Smith    | jane.smith@email.com |
-- +---------+------------+-------------+------------+-----------+----------+----------------------+
-- 2 rows in set (0.065 sec)

-- 2. LEFT JOIN
-- Retrieve all customers and their corresponding orders (if any).

SELECT
    Customers.CustomerID,
    Customers.FirstName,
    Customers.LastName,
    Customers.Email,
    Orders.OrderID,
    Orders.OrderDate,
    Orders.TotalAmount
FROM Customers
LEFT JOIN Orders
ON Customers.CustomerID = Orders.CustomerID;

-- o/p:-

-- +------------+-----------+----------+----------------------+---------+------------+-------------+
-- | CustomerID | FirstName | LastName | Email                | OrderID | OrderDate  | TotalAmount |
-- +------------+-----------+----------+----------------------+---------+------------+-------------+
-- |          1 | John      | Doe      | john.doe@email.com   |     101 | 2023-07-01 |      150.50 |
-- |          2 | Jane      | Smith    | jane.smith@email.com |     102 | 2023-07-03 |      200.75 |
-- +------------+-----------+----------+----------------------+---------+------------+-------------+
-- 2 rows in set (0.029 sec)


-- 3. RIGHT JOIN
-- Retrieve all orders and their corresponding customers (if any).

SELECT
    Orders.OrderID,
    Orders.OrderDate,
    Orders.TotalAmount,
    Customers.CustomerID,
    Customers.FirstName,
    Customers.LastName,
    Customers.Email
FROM Customers
RIGHT JOIN Orders
ON Customers.CustomerID = Orders.CustomerID;

-- o/p:-
-- +---------+------------+-------------+------------+-----------+----------+----------------------+
-- | OrderID | OrderDate  | TotalAmount | CustomerID | FirstName | LastName | Email                |
-- +---------+------------+-------------+------------+-----------+----------+----------------------+
-- |     101 | 2023-07-01 |      150.50 |          1 | John      | Doe      | john.doe@email.com   |
-- |     102 | 2023-07-03 |      200.75 |          2 | Jane      | Smith    | jane.smith@email.com |
-- +---------+------------+-------------+------------+-----------+----------+----------------------+
-- 2 rows in set (0.005 sec)


-- 4. FULL OUTER JOIN
-- Retrieve all customers and all orders, regardless of matching.


SELECT
    Customers.CustomerID,
    Customers.FirstName,
    Customers.LastName,
    Orders.OrderID,
    Orders.OrderDate,
    Orders.TotalAmount
FROM Customers
LEFT JOIN Orders
ON Customers.CustomerID = Orders.CustomerID

UNION

SELECT
    Customers.CustomerID,
    Customers.FirstName,
    Customers.LastName,
    Orders.OrderID,
    Orders.OrderDate,
    Orders.TotalAmount
FROM Customers
RIGHT JOIN Orders
ON Customers.CustomerID = Orders.CustomerID;

-- o/p:-
+------------+-----------+----------+---------+------------+-------------+
| CustomerID | FirstName | LastName | OrderID | OrderDate  | TotalAmount |
+------------+-----------+----------+---------+------------+-------------+
|          1 | John      | Doe      |     101 | 2023-07-01 |      150.50 |
|          2 | Jane      | Smith    |     102 | 2023-07-03 |      200.75 |
+------------+-----------+----------+---------+------------+-------------+
2 rows in set (0.084 sec)


-- 5. SUBQUERY
-- Find customers who have placed orders worth more than the average amount.

SELECT
    CustomerID,
    SUM(TotalAmount) AS TotalOrderAmount
FROM Orders
GROUP BY CustomerID
HAVING SUM(TotalAmount) > (
    SELECT AVG(TotalAmount)
    FROM Orders
);

-- o/p:-

+------------+------------------+
| CustomerID | TotalOrderAmount |
+------------+------------------+
|          2 |           200.75 |
+------------+------------------+
1 row in set (0.066 sec)

-- 6. SUBQUERY
-- Find employees with salaries above the average salary.

SELECT *
FROM Employees
WHERE Salary > (
    SELECT AVG(Salary)
    FROM Employees
);

-- o/p:-

-- +------------+-----------+----------+------------+------------+----------+
-- | EmployeeID | FirstName | LastName | Department | HireDate   | Salary   |
-- +------------+-----------+----------+------------+------------+----------+
-- |          2 | Susan     | Lee      | HR         | 2021-03-20 | 55000.00 |
-- +------------+-----------+----------+------------+------------+----------+
-- 1 row in set (0.017 sec)

-- 7. EXTRACT YEAR AND MONTH
-- Extract the year and month from the OrderDate.

SELECT
    OrderID,
    OrderDate,
    YEAR(OrderDate) AS OrderYear,
    MONTH(OrderDate) AS OrderMonth
FROM Orders;

-- o/p:-

-- +---------+------------+-----------+------------+
-- | OrderID | OrderDate  | OrderYear | OrderMonth |
-- +---------+------------+-----------+------------+
-- |     101 | 2023-07-01 |      2023 |          7 |
-- |     102 | 2023-07-03 |      2023 |          7 |
-- +---------+------------+-----------+------------+
-- 2 rows in set (0.049 sec)

-- 8. DATE DIFFERENCE
-- Calculate the difference in days between OrderDate and current date.

SELECT
    OrderID,
    OrderDate,
    DATEDIFF(CURRENT_DATE, OrderDate) AS DaysDifference
FROM Orders;

-- o/p:-

-- +---------+------------+----------------+
-- | OrderID | OrderDate  | DaysDifference |
-- +---------+------------+----------------+
-- |     101 | 2023-07-01 |           1165 |
-- |     102 | 2023-07-03 |           1163 |
-- +---------+------------+----------------+
-- 2 rows in set (0.058 sec)

-- 9. DATE FORMATTING
-- Format OrderDate to a more readable format (DD-MMM-YYYY).

SELECT
    OrderID,
    OrderDate,
    DATE_FORMAT(OrderDate, '%d-%b-%Y') AS FormattedOrderDate
FROM Orders;

-- o/p:-

-- +---------+------------+--------------------+
-- | OrderID | OrderDate  | FormattedOrderDate |
-- +---------+------------+--------------------+
-- |     101 | 2023-07-01 | 01-Jul-2023        |
-- |     102 | 2023-07-03 | 03-Jul-2023        |
-- +---------+------------+--------------------+
-- 2 rows in set (0.037 sec)

-- 10. CONCATENATE FIRST NAME AND LAST NAME
-- Concatenate FirstName and LastName to form a full name.

SELECT
    CustomerID,
    CONCAT(FirstName, ' ', LastName) AS FullName
FROM Customers;

-- o/p:-

-- +------------+------------+
-- | CustomerID | FullName   |
-- +------------+------------+
-- |          1 | John Doe   |
-- |          2 | Jane Smith |
-- +------------+------------+
-- 2 rows in set (0.030 sec)

-- 11. REPLACE STRING
-- Replace 'John' with 'Jonathan'.

SELECT
    CustomerID,
    REPLACE(FirstName, 'John', 'Jonathan') AS UpdatedFirstName
FROM Customers;

-- o/p:-

-- +------------+------------------+
-- | CustomerID | UpdatedFirstName |
-- +------------+------------------+
-- |          1 | Jonathan         |
-- |          2 | Jane             |
-- +------------+------------------+
-- 2 rows in set (0.028 sec)

-- 12. UPPERCASE AND LOWERCASE
-- Convert FirstName to uppercase and LastName to lowercase.

SELECT
    CustomerID,
    UPPER(FirstName) AS UpperFirstName,
    LOWER(LastName) AS LowerLastName
FROM Customers;

-- o/p:-
-- +------------+----------------+---------------+
-- | CustomerID | UpperFirstName | LowerLastName |
-- +------------+----------------+---------------+
-- |          1 | JOHN           | doe           |
-- |          2 | JANE           | smith         |
-- +------------+----------------+---------------+
-- 2 rows in set (0.041 sec)


-- 13. TRIM SPACES
-- Trim extra spaces from the Email field.

SELECT
    CustomerID,
    TRIM(Email) AS TrimmedEmail
FROM Customers;

-- o/p:-

-- +------------+----------------------+
-- | CustomerID | TrimmedEmail         |
-- +------------+----------------------+
-- |          1 | john.doe@email.com   |
-- |          2 | jane.smith@email.com |
-- +------------+----------------------+
-- 2 rows in set (0.024 sec)


-- 14. RUNNING TOTAL
-- Calculate the running total of TotalAmount for each order.

SELECT
    OrderID,
    CustomerID,
    OrderDate,
    TotalAmount,
    SUM(TotalAmount) OVER (
        ORDER BY OrderDate, OrderID
    ) AS RunningTotal
FROM Orders;

-- o/p:-

-- +---------+------------+------------+-------------+--------------+
-- | OrderID | CustomerID | OrderDate  | TotalAmount | RunningTotal |
-- +---------+------------+------------+-------------+--------------+
-- |     101 |          1 | 2023-07-01 |      150.50 |       150.50 |
-- |     102 |          2 | 2023-07-03 |      200.75 |       351.25 |
-- +---------+------------+------------+-------------+--------------+
-- 2 rows in set (0.063 sec)

-- 15. RANK FUNCTION
-- Rank orders based on TotalAmount using the RANK() function.

SELECT
    OrderID,
    CustomerID,
    TotalAmount,
    RANK() OVER (
        ORDER BY TotalAmount DESC
    ) AS OrderRank
FROM Orders;

-- o/p:-

-- +---------+------------+-------------+-----------+
-- | OrderID | CustomerID | TotalAmount | OrderRank |
-- +---------+------------+-------------+-----------+
-- |     102 |          2 |      200.75 |         1 |
-- |     101 |          1 |      150.50 |         2 |
-- +---------+------------+-------------+-----------+
-- 2 rows in set (0.033 sec)

-- 16. CASE EXPRESSION
-- Assign a discount based on TotalAmount.
-- More than 1000: 10% off
-- More than 500: 5% off
-- Otherwise: No Discount

SELECT
    OrderID,
    TotalAmount,
    CASE
        WHEN TotalAmount > 1000 THEN '10% Off'
        WHEN TotalAmount > 500 THEN '5% Off'
        ELSE 'No Discount'
    END AS Discount
FROM Orders;

-- o/p:-

-- +---------+-------------+-------------+
-- | OrderID | TotalAmount | Discount    |
-- +---------+-------------+-------------+
-- |     101 |      150.50 | No Discount |
-- |     102 |      200.75 | No Discount |
-- +---------+-------------+-------------+
-- 2 rows in set (0.016 sec)

-- 17. CASE EXPRESSION
-- Categorize employees' salaries as high, medium, or low.

SELECT
    EmployeeID,
    FirstName,
    LastName,
    Salary,
    CASE
        WHEN Salary >= 70000 THEN 'High'
        WHEN Salary >= 40000 THEN 'Medium'
        ELSE 'Low'
    END AS SalaryCategory
FROM Employees;

-- o/p:-

-- +------------+-----------+----------+----------+----------------+
-- | EmployeeID | FirstName | LastName | Salary   | SalaryCategory |
-- +------------+-----------+----------+----------+----------------+
-- |          1 | Mark      | Johnson  | 50000.00 | Medium         |
-- |          2 | Susan     | Lee      | 55000.00 | Medium         |
-- +------------+-----------+----------+----------+----------------+
-- 2 rows in set (0.004 sec)
