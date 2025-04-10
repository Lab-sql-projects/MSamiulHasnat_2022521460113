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