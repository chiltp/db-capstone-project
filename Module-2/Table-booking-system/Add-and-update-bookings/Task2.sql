/*
Create a new procedure called UpdateBooking that they can use to update existing bookings in the booking table.

The procedure should have two input parameters in the form of booking id and booking date. You must also include an UPDATE statement inside the procedure. 
*/

DELIMITER //

CREATE PROCEDURE UpdateBooking(
    IN booking_id INT,
    IN new_booking_date DATE
)
BEGIN
    UPDATE Booking
    SET BookingDate = new_booking_date
    WHERE BookingID = booking_id;

    SELECT CONCAT('Booking ', booking_id, ' updated') AS Confirmation;
END //

DELIMITER ;

CALL UpdateBooking(9, "2025-02-17");