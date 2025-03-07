/* 
Create a prepared statement called GetOrderDetail. This prepared statement will help to reduce the parsing time of queries. It will also help to secure the database from SQL injections.

The prepared statement should accept one input argument, the CustomerID value, from a variable. 

The statement should return the order id, the quantity and the order cost from the Orders table. 

Once you create the prepared statement, you can create a variable called id and assign it value of 1. 
*/

PREPARE GetOrderDetail FROM 
'SELECT o.OrderID, o.TotalCost, oi.Quantity
 FROM `Order` AS o 
 INNER JOIN `OrderItem` AS oi
 ON o.OrderID = oi.OrderID
 WHERE o.CustomerID = ?';

SET @id = 1;
EXECUTE GetOrderDetail USING @id;