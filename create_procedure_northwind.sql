CREATE OR REPLACE PROCEDURE "Ten Most Expensive Products" AS
BEGIN
    SELECT Products.ProductName AS TenMostExpensiveProducts, Products.UnitPrice
    FROM Products
    WHERE ROWNUM <= 10
    ORDER BY Products.UnitPrice DESC;
END;
/

CREATE OR REPLACE PROCEDURE "Employee Sales by Country" (
    Beginning_Date IN DATE,
    Ending_Date IN DATE
) AS
BEGIN
    SELECT Employees.Country, Employees.LastName, Employees.FirstName,
           Orders.ShippedDate, Orders.OrderID, "Order Subtotals".Subtotal AS SaleAmount
    FROM Employees
    INNER JOIN Orders ON Employees.EmployeeID = Orders.EmployeeID
    INNER JOIN "Order Subtotals" ON Orders.OrderID = "Order Subtotals".OrderID
    WHERE Orders.ShippedDate BETWEEN Beginning_Date AND Ending_Date;
END;
/

CREATE OR REPLACE PROCEDURE "Sales by Year" (
    Beginning_Date IN DATE,
    Ending_Date IN DATE
) AS
BEGIN
    SELECT Orders.ShippedDate, Orders.OrderID, "Order Subtotals".Subtotal,
           TO_CHAR(Orders.ShippedDate, 'YYYY') AS Year
    FROM Orders
    INNER JOIN "Order Subtotals" ON Orders.OrderID = "Order Subtotals".OrderID
    WHERE Orders.ShippedDate BETWEEN Beginning_Date AND Ending_Date;
END;
/
