-- Create a virtual table called OrdersView that focuses on OrderID, Quantity and Cost columns within the Orders table for all orders with a quantity greater than 2. 

DROP VIEW OrderView;

CREATE VIEW OrderView AS 
SELECT `Order`.OrderID, `Order`.TotalCost, `OrderItem`.Quantity  
FROM `Order`
INNER JOIN `OrderItem` 
ON `Order`.OrderID = `OrderItem`.OrderID
WHERE `OrderItem`.Quantity > 2;

SELECT * FROM OrderView;