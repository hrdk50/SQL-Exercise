USE AdventureWorks;
GO

CREATE VIEW Sales.NewCustomer
AS SELECT CustomerID, FirstName, LastName 
FROM Sales.CustomerPII;



INSERT INTO Sales.NewCustomer VALUES(1,'Hardik', 'Makwana'),(2, 'Parth', 'Sapra');



SELECT * FROM Sales.NewCustomer 
ORDER BY CustomerID