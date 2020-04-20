--Step 1 - Use the tempdb database
USE tempdb
GO

--Step 2 - Add items to cart
DECLARE @now DATETIME = GETDATE();
EXEC AddItemToCart
	@SessionID = 3,
	@TimeAdded = @now,
	@CustomerKey = 2,
	@ProductKey = 3,
	@Quantity = 1;

EXEC AddItemToCart  
	@SessionID = 3,
	@TimeAdded = @now,
	@CustomerKey = 2,
	@ProductKey = 4,
	@Quantity = 1;

--Step 3 - Select items in cart	
SELECT * FROM ShoppingCart;

--Step 4 - Delete item from cart
EXEC DeleteItemFromCart 
	@SessionID = 3, 
	@ProductKey = 4;

--Step 5 - Select items in cart		
SELECT * FROM ShoppingCart;

--Step 6 - Empty cart	
EXEC EmptyCart @SessionID = 3;
	
--Step 7 - Select items in cart	
SELECT * FROM ShoppingCart;