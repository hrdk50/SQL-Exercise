USE tempdb
GO

CREATE PROCEDURE AddItemToCart
	@SessionID INT, 
	@TimeAdded DATETIME, 
	@CustomerKey INT, 
	@ProductKey INT, 
	@Quantity INT
	WITH NATIVE_COMPILATION, SCHEMABINDING, EXECUTE AS OWNER
AS
BEGIN 
	ATOMIC WITH (TRANSACTION ISOLATION LEVEL = SNAPSHOT, LANGUAGE = 'us_english')  
	INSERT INTO ShoppingCart(SessionID, TimeAdded, CustomerKey, ProductKey, Quantity)
	VALUES (@SessionID, @TimeAdded, @CustomerKey, @ProductKey, @Quantity)
END
GO



CREATE PROCEDURE DeleteItemFromCart
	@SessionID INT, 
	@ProductKey INT
	WITH NATIVE_COMPILATION, SCHEMABINDING, EXECUTE AS OWNER
AS
BEGIN 
	ATOMIC WITH (TRANSACTION ISOLATION LEVEL = SNAPSHOT, LANGUAGE = 'us_english')  
	DELETE FROM ShoppingCart   
	WHERE SessionID = @SessionID AND ProductKey = @ProductKey
END
GO



	
CREATE PROCEDURE EmptyCart
	@SessionID INT
	WITH NATIVE_COMPILATION, SCHEMABINDING, EXECUTE AS OWNER
AS
BEGIN 
	ATOMIC WITH (TRANSACTION ISOLATION LEVEL = SNAPSHOT, LANGUAGE = 'us_english')  
	DELETE FROM ShoppingCart   WHERE SessionID = @SessionID
END
GO	
	
	
	
