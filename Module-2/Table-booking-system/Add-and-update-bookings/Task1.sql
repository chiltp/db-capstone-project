-- Create a new procedure called AddBooking to add a new table booking record.

DROP PROCEDURE IF EXISTS AddBooking; 

DELIMITER //

CREATE PROCEDURE AddBooking(
	IN customer_id INT,
	IN booking_date DATE,
	IN table_number INT
)
BEGIN
	INSERT INTO Booking (CustomerID, BookingDate, TableNumber)
    VALUES(customer_id, booking_date, table_number);
    
    SELECT 'New booking added' AS Confirmation;
END //

DELIMITER ;

CALL AddBooking(3, '2025-03-01', 5)