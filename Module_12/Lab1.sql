USE tempdb
GO

CREATE TABLE ShoppingCart
(SessionID INT NOT NULL,
TimeAdded DATETIME NOT NULL,
CustomerKey INT NOT NULL,
ProductKey INT NOT NULL,
Quantity INT NOT NULL
PRIMARY KEY NONCLUSTERED (SessionID, ProductKey)) 
WITH  (MEMORY_OPTIMIZED = ON,  DURABILITY = SCHEMA_AND_DATA);

INSERT INTO ShoppingCart (SessionID, TimeAdded, CustomerKey, ProductKey, Quantity)
VALUES (1,getdate(),2,3,1);

INSERT INTO ShoppingCart (SessionID, TimeAdded, CustomerKey, ProductKey, Quantity)
VALUES (1,getdate(),2,4,1);

SELECT * FROM dbo.ShoppingCart;