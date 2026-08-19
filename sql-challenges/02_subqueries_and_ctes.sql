-- =================================================================
-- Categorias: Subqueries & CTEs
-- Ficheiro: 02_subqueries_and_ctes.sql
-- =================================================================

-- Exercício 1: Funcionários acima da média de vendas
-- Conceitos: CTE (WITH), AVG(), HAVING / WHERE
WITH Pedidos AS (
    SELECT E.FirstName, E.LastName, COUNT(O.OrderID) AS TotalPedidos
    FROM Employees AS E
    JOIN Orders AS O ON E.EmployeeID = O.EmployeeID
    GROUP BY E.FirstName, E.LastName
),
Media AS (
    SELECT AVG(TotalPedidos) AS Mediapedidos
    FROM Pedidos
)
SELECT P.FirstName, P.LastName, P.TotalPedidos, M.Mediapedidos
FROM Pedidos AS P, Media AS M
WHERE P.TotalPedidos > M.Mediapedidos;


-- Exercício 2: Produtos abaixo da média da sua própria categoria
-- Conceitos: Multi-table CTE, JOIN com agregados
WITH MediaCategoria AS (
    SELECT C.CategoryID, C.CategoryName, AVG(P.Price) AS MediaC
    FROM Categories AS C
    JOIN Products AS P ON C.CategoryID = P.CategoryID
    GROUP BY C.CategoryName, C.CategoryID
)
SELECT P.ProductName, P.Price, MC.CategoryName, MC.MediaC 
FROM Products AS P
JOIN MediaCategoria AS MC ON P.CategoryID = MC.CategoryID
WHERE P.Price < MC.MediaC;
