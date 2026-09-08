Data Transformer

Project Description

Data Transformer is an institute-level SQL project designed to demonstrate practical use of SQL for data transformation, analysis, and reporting.

The project simulates a simple corporate data analysis system using customer, order, and employee data. It covers important SQL concepts such as JOINs, subqueries, aggregate functions, date and string manipulation, window functions, and CASE expressions.

Features

Customer information management

Order and transaction data handling

Employee information and salary analysis

INNER JOIN, LEFT JOIN, RIGHT JOIN, and FULL OUTER JOIN simulation

Subqueries for data analysis

Aggregate functions such as SUM(), AVG(), MAX(), and MIN()

Date extraction and date difference calculations

Date formatting

String concatenation, replacement, uppercase/lowercase conversion, and trimming

Running totals using window functions

Order ranking using RANK()

Discount calculation using CASE

Employee salary categorization using CASE

Database Structure

The project uses three main tables:

1. Customers

Stores customer information.

Field

Description

CustomerID

Unique ID of the customer

FirstName

Customer's first name

LastName

Customer's last name

Email

Customer's email address

RegistrationDate

Customer registration date

2. Orders

Stores customer order information.

Field

Description

OrderID

Unique ID of the order

CustomerID

ID of the customer who placed the order

OrderDate

Date of the order

TotalAmount

Total amount of the order

3. Employees

Stores employee information.

Field

Description

EmployeeID

Unique ID of the employee

FirstName

Employee's first name

LastName

Employee's last name

Department

Employee's department

HireDate

Employee hiring date

Salary

Employee salary

Getting Started

Prerequisites

To run this project, you need:

MySQL Server

MySQL Workbench or another MySQL-compatible SQL client

Installation

Install and start MySQL Server.

Open MySQL Workbench or your preferred SQL editor.

Create the project database:

CREATE DATABASE DataTransformer;
USE DataTransformer;

Create the required tables:

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    RegistrationDate DATE
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    TotalAmount DECIMAL(10,2)
);

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Department VARCHAR(50),
    HireDate DATE,
    Salary DECIMAL(10,2)
);

Insert the sample data provided in the project SQL file.

Execute the queries to perform data transformation and analysis.

SQL Concepts Used

This project demonstrates the following SQL concepts:

Joins

INNER JOIN

LEFT JOIN

RIGHT JOIN

FULL OUTER JOIN simulation using UNION

Subqueries

Subqueries are used to compare customer orders and employee salaries with average values.

Aggregate Functions

SUM()

AVG()

MAX()

MIN()

Date Functions

YEAR()

MONTH()

DATEDIFF()

DATE_FORMAT()

String Functions

CONCAT()

REPLACE()

UPPER()

LOWER()

TRIM()

Window Functions

SUM() OVER() for calculating running totals

RANK() OVER() for ranking orders

CASE Expression

CASE is used for:

Assigning discounts according to order amounts

Categorizing employee salaries as high, medium, or low

Example

The following query retrieves orders along with their corresponding customer details:

SELECT
    Orders.OrderID,
    Orders.OrderDate,
    Orders.TotalAmount,
    Customers.FirstName,
    Customers.LastName
FROM Orders
INNER JOIN Customers
ON Orders.CustomerID = Customers.CustomerID;

Project Purpose

The main purpose of this project is to provide hands-on practice with SQL operations that are commonly used for data transformation, reporting, and analysis.

It is intended as an academic/institute project for demonstrating practical understanding of advanced SQL concepts.

Author

Gosai kishal
