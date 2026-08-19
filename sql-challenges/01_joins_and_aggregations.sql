-- =================================================================
-- Category: Joins & Aggregations
-- File: 01_joins_and_aggregations.sql
-- =================================================================

-- Exercise 1: Faturação Total por Funcionário
-- Concepts: INNER JOIN, GROUP BY, SUM(), ORDER BY
SELECT 
    E.FirstName, 
    E.LastName, 
    SUM(OD.Quantity * OD.UnitPrice) AS TotalVendas
FROM Employees AS E
INNER JOIN Orders AS O ON E.EmployeeID = O.EmployeeID
INNER JOIN OrderDetails AS OD ON O.OrderID = OD.OrderID
GROUP BY E.EmployeeID, E.FirstName, E.LastName
ORDER BY TotalVendas DESC;


-- Exercise 2: Identificar Clientes Sem Pedidos
-- Concepts: LEFT JOIN, NULL Filtering
SELECT 
    c.CustomerName, 
    c.CustomerID
FROM Customers AS c
LEFT JOIN Orders AS o ON c.CustomerID = o.CustomerID
WHERE o.OrderID IS NULL;
