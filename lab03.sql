-- lab3_queries.sql
-- Queries for the SQL Operations & Database Management 3 Lab
-- Using the Online Store Database (Customers, Products, Orders, OrderDetails)

-- Note: Some database systems might require executing DDL (CREATE, ALTER)
-- statements separately from DML (INSERT, UPDATE) or transactions.
-- You might need to run these sections individually depending on your SQL client/system.

-- Section 1: Create a VIEW
-- Requirement: Create a VIEW that hides sensitive or unnecessary columns [cite: 5]
-- Objective: Create a view showing only customer names and cities, hiding emails.
CREATE VIEW CustomerPublicInfo AS
SELECT
    CustomerID,
    FirstName,
    LastName,
    City
FROM
    Customers;

-- Example: Querying the view
-- SELECT * FROM CustomerPublicInfo WHERE City = 'New York';


-- Section 2: Add Integrity Constraints
-- Requirement: Add at least TWO INTEGRITY CONSTRAINTS (CHECK, UNIQUE, FOREIGN KEY, NOT NULL) [cite: 6, 7]

-- Constraint 1: Add a CHECK constraint to ensure product prices are positive.
ALTER TABLE Products
ADD CONSTRAINT CHK_PositivePrice CHECK (Price > 0);

-- Constraint 2: Add a UNIQUE constraint to ensure customer emails are unique.
-- Note: If duplicate emails already exist from Lab 2 data, this might fail.
-- You might need to clean the data first or handle potential errors.
ALTER TABLE Customers
ADD CONSTRAINT UQ_CustomerEmail UNIQUE (Email);

-- Constraint 3 (Example - already present but demonstrates NOT NULL): Ensure OrderDate is mandatory
-- Many systems automatically make PRIMARY KEY columns NOT NULL.
-- If OrderDate wasn't already required, you could add:
-- ALTER TABLE Orders
-- MODIFY OrderDate DATE NOT NULL;


-- Section 3: Create an INDEX
-- Requirement: Create an INDEX on a column often used in WHERE or JOINs [cite: 7]
-- Objective: Create an index on the CustomerID column in the Orders table, as it's used for joining with Customers.
CREATE INDEX IDX_Orders_CustomerID ON Orders (CustomerID);


-- Section 4: Create and test a TRANSACTION
-- Requirement: Start Transaction, Insert, Update, ROLLBACK or COMMIT, Show result [cite: 8]
-- Objective: Simulate adding a new product and updating its stock within a transaction.
-- We'll COMMIT this one. Syntax may vary slightly between SQL dialects (e.g., BEGIN TRANSACTION vs START TRANSACTION).

-- Start the transaction
START TRANSACTION; -- Or BEGIN TRANSACTION;

-- Insert a new product
INSERT INTO Products (ProductID, ProductName, Category, Price, StockQuantity)
VALUES (206, 'Gaming Mouse', 'Accessories', 85.00, 50);

-- Update the stock quantity of the new product
UPDATE Products
SET StockQuantity = 45
WHERE ProductID = 206;

-- Commit the changes (make them permanent)
COMMIT;

-- Show the result (check if the new product exists with updated stock)
-- SELECT * FROM Products WHERE ProductID = 206;

-- Example of a ROLLBACK (Uncomment to test):
-- START TRANSACTION;
-- INSERT INTO Products (ProductID, ProductName, Category, Price, StockQuantity)
-- VALUES (999, 'Temporary Item', 'Test', 10.00, 1);
-- SELECT * FROM Products WHERE ProductID = 999; -- Should show the item
-- ROLLBACK;
-- SELECT * FROM Products WHERE ProductID = 999; -- Should show nothing


-- Section 5: Write a COMPLEX QUERY
-- Requirement: Uses JOIN, SUBQUERY, and WHERE/HAVING [cite: 8]
-- Objective: Find customers from 'New York' who have ordered products costing more than the average price of all products.
SELECT
    c.CustomerID,
    c.FirstName,
    c.LastName,
    p.ProductName,
    od.PricePerUnit
FROM
    Customers c
JOIN
    Orders o ON c.CustomerID = o.CustomerID
JOIN
    OrderDetails od ON o.OrderID = od.OrderID
JOIN
    Products p ON od.ProductID = p.ProductID
WHERE
    c.City = 'New York' -- WHERE condition
AND
    od.PricePerUnit > (SELECT AVG(Price) FROM Products); -- SUBQUERY used in WHERE condition


-- Section 6: (Bonus) Authorization
-- Requirement: Create a ROLE or USER and GRANT specific privileges [cite: 8]
-- Note: Syntax for user/role creation and granting privileges varies significantly between database systems (MySQL, PostgreSQL, SQL Server, etc.).
-- Below are conceptual examples, **you will need to adapt them to your specific SQL database system.**

-- Example for PostgreSQL:
-- CREATE ROLE readonly_user LOGIN PASSWORD 'somepassword'; -- Creates a user that can log in
-- GRANT CONNECT ON DATABASE your_database_name TO readonly_user; -- Allow connection
-- GRANT USAGE ON SCHEMA public TO readonly_user; -- Allow using the schema
-- GRANT SELECT ON CustomerPublicInfo TO readonly_user; -- Grant SELECT privilege ONLY on the view
-- GRANT SELECT ON Products TO readonly_user; -- Grant SELECT on the Products table

-- Example for MySQL:
-- CREATE USER 'readonly_user'@'localhost' IDENTIFIED BY 'somepassword'; -- Creates a user
-- GRANT SELECT ON your_database_name.CustomerPublicInfo TO 'readonly_user'@'localhost'; -- Grant SELECT on the view
-- GRANT SELECT ON your_database_name.Products TO 'readonly_user'@'localhost'; -- Grant SELECT on Products table
-- FLUSH PRIVILEGES; -- Apply the changes


-- End of Script