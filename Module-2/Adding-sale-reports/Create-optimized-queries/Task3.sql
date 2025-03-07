/*
Create a stored procedure called CancelOrder. Little Lemon want to use this stored procedure to delete an order record based on the user input of the order id.

Creating this procedure will allow Little Lemon to cancel any order by specifying the order id value in the procedure parameter without typing the entire SQL delete statement.
*/

DROP PROCEDURE IF EXISTS CancelOrder;

DELIMITER $$

CREATE PROCEDURE CancelOrder(IN order_id INT)
BEGIN
    DELETE FROM `Order` WHERE OrderID = order_id;
    SELECT 'Confirmation' AS Message, CONCAT('Order ', order_id, ' is cancelled') AS Result;
END $$

DELIMITER ;

CALL CancelOrder(5);