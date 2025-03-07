/*
Create a stored procedure called CheckBooking to check whether a table in the restaurant is already booked. Creating this procedure helps to minimize the effort involved in repeatedly coding the same SQL statements.

The procedure should have two input parameters in the form of booking date and table number. You can also create a variable in the procedure to check the status of each table.
*/

DELIMITER //

CREATE PROCEDURE CheckBooking(IN booking_date DATE, IN table_number INT)
BEGIN
    DECLARE is_booked INT; 
    SELECT COUNT(*) INTO is_booked 
    FROM Booking
    WHERE BookingDate = booking_date AND TableNumber = table_number;
    
    IF is_booked > 0 THEN
        SELECT 'Booking status' AS Status, CONCAT('Table ', table_number, ' is already booked') AS Message;
    ELSE
        SELECT 'Booking status' AS Status, CONCAT('Table ', table_number, ' is available for booking') AS Message;
    END IF;
END //

DELIMITER ;

CALL CheckBooking('2025-02-12', 9);