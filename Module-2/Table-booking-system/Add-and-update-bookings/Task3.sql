/*
Create a new procedure called CancelBooking that they can use to cancel or remove a booking.

The procedure should have one input parameter in the form of booking id. You must also write a DELETE statement inside the procedure. 
*/

DELIMITER //

CREATE PROCEDURE CancelBooking(IN booking_id INT)
BEGIN
    DELETE FROM Booking
    WHERE BookingID = booking_id;

    SELECT CONCAT('Booking ', booking_id, ' cancelled') AS Confirmation;
END //

DELIMITER ;

CALL CancelBooking(9);