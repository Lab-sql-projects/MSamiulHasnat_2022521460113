-- Combined SQL Script for Lab 2 Assignment
-- Using a sample Online Store schema

-- Section 1: Create Table Statements
-- ------------------------------------

-- Create Customers Table
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    City VARCHAR(50)
);

-- Create Products Table
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    Price DECIMAL(10, 2),
    StockQuantity INT
);

-- Create Orders Table
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    Status VARCHAR(20), -- e.g., 'Pending', 'Shipped', 'Cancelled'
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Create OrderDetails Table
CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    PricePerUnit DECIMAL(10, 2), -- Price at the time of order
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- Section 2: Insert Sample Data Statements
-- -----------------------------------------

-- Insert data into Customers Table
INSERT INTO Customers (CustomerID, FirstName, LastName, Email, City) VALUES
(101, 'Alice', 'Smith', 'alice.s@email.com', 'New York'),
(102, 'Bob', 'Johnson', 'bob.j@email.com', 'Los Angeles'),
(103, 'Charlie', 'Brown', 'charlie.b@email.com', 'Chicago'),
(104, 'Diana', 'Ross', 'diana.r@email.com', 'New York');

-- Insert data into Products Table
INSERT INTO Products (ProductID, ProductName, Category, Price, StockQuantity) VALUES
(201, 'Laptop', 'Electronics', 1200.00, 50),
(202, 'Keyboard', 'Accessories', 75.50, 150),
(203, 'Mouse', 'Accessories', 25.00, 200),
(204, 'Webcam', 'Electronics', 55.75, 80),
(205, 'Desk Chair', 'Furniture', 150.00, 30);

-- Insert data into Orders Table
INSERT INTO Orders (OrderID, CustomerID, OrderDate, Status) VALUES
(301, 101, '2024-03-15', 'Shipped'),
(302, 102, '2024-03-16', 'Pending'),
(303, 101, '2024-03-18', 'Shipped'),
(304, 103, '2024-03-20', 'Cancelled'),
(305, 104, '2024-03-21', 'Pending');

-- Insert data into OrderDetails Table
INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, Quantity, PricePerUnit) VALUES
(401, 301, 201, 1, 1200.00), -- Alice bought a Laptop
(402, 301, 203, 1, 25.00),  -- Alice bought a Mouse
(403, 302, 202, 2, 75.50),  -- Bob bought 2 Keyboards
(404, 303, 204, 1, 55.75),  -- Alice bought a Webcam
(405, 303, 203, 1, 25.00),  -- Alice bought another Mouse
(406, 304, 205, 1, 150.00), -- Charlie ordered a Desk Chair (Cancelled)
(407, 305, 201, 1, 1200.00), -- Diana ordered a Laptop
(408, 305, 202, 1, 75.50);  -- Diana ordered a Keyboard

-- Section 3: Lab Assignment Queries
-- ---------------------------------
-- Queries for the SQL Operations & Database Management 2 Lab

-- Requirement: JOIN (2 queries)
-- Query 1: INNER JOIN
-- Objective: Show customer names and the dates of orders they placed.
SELECT
    c.FirstName,
    c.LastName,
    o.OrderDate,
    o.Status
FROM
    Customers c
INNER JOIN
    Orders o ON c.CustomerID = o.CustomerID;

-- Query 2: LEFT JOIN
-- Objective: Show all customers and any orders they may have placed.
SELECT
    c.FirstName,
    c.LastName,
    o.OrderDate,
    o.Status
FROM
    Customers c
LEFT JOIN
    Orders o ON c.CustomerID = o.CustomerID;

-- Requirement: UPDATE (1 query)
-- Objective: Update the status of all 'Pending' orders for CustomerID 102 to 'Processing'.
UPDATE Orders
SET Status = 'Processing'
WHERE CustomerID = 102 AND Status = 'Pending';

-- Requirement: DELETE (1 query)
-- Objective: Delete all orders with the status 'Cancelled'.
-- Note: You might need to delete from OrderDetails first if foreign key constraints cause issues,
--       or ensure ON DELETE CASCADE is set up.
-- DELETE FROM OrderDetails WHERE OrderID IN (SELECT OrderID FROM Orders WHERE Status = 'Cancelled');
DELETE FROM Orders
WHERE Status = 'Cancelled';

-- Requirement: Aggregations (GROUP BY, HAVING) (1 query)
-- Objective: Find the total quantity of items ordered for each product, only showing products where the total quantity ordered is greater than 1.
SELECT
    od.ProductID,
    p.ProductName,
    SUM(od.Quantity) AS TotalQuantityOrdered
FROM
    OrderDetails od
JOIN
    Products p ON od.ProductID = p.ProductID
GROUP BY
    od.ProductID, p.ProductName
HAVING
    SUM(od.Quantity) > 1;

-- Requirement: Subquery (1 query)
-- Objective: Find customers who have ordered the product 'Laptop' (ProductID 201).
SELECT
    CustomerID,
    FirstName,
    LastName
FROM
    Customers
WHERE
    CustomerID IN (
        SELECT DISTINCT o.CustomerID
        FROM Orders o
        JOIN OrderDetails od ON o.OrderID = od.OrderID
        WHERE od.ProductID = 201 -- ProductID for 'Laptop'
    );

-- End of Script
