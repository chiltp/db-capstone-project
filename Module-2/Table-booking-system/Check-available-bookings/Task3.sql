-- Create a new procedure called AddValidBooking. This procedure must use a transaction statement to perform a rollback if a customer reserves a table that’s already booked under another name.  

DROP PROCEDURE IF EXISTS AddValidBooking;

DELIMITER //

CREATE PROCEDURE AddValidBooking(IN booking_date DATE, IN table_number INT)
BEGIN
    DECLARE table_count INT; 

    START TRANSACTION;

    SELECT COUNT(*) INTO table_count 
    FROM Booking
    WHERE BookingDate = booking_date AND TableNumber = table_number;

    IF table_count > 0 THEN
        ROLLBACK;
        SELECT 'Table is already booked - booking cancelled' AS 'Booking status';
    ELSE
        INSERT INTO Booking (BookingDate, TableNumber) 
        VALUES (booking_date, table_number);
        COMMIT;
        SELECT 'Booking successful' AS 'Booking status';
    END IF;

END //

DELIMITER ;

CALL AddValidBooking('2025-02-15', 9);