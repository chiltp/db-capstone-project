-- Create a procedure that displays the maximum ordered quantity in the Orders table. 

DROP PROCEDURE IF EXISTS GetMaxQuantity;

DELIMITER //

CREATE PROCEDURE GetMaxQuantity()
BEGIN
    SELECT MAX(Quantity) AS MaxOrderQuantity FROM `OrderItem`;
END //
DELIMITER ;

CALL GetMaxQuantity(); 