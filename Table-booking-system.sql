Use LittleLemonDB;

SHOW TABLES FROM LittleLemonDB;

SELECT * FROM Booking;

-- Exercise: Create SQL queries to check available bookings based on user input
-- Task 1
INSERT INTO Booking (BookingID, CustomerID, BookingDate, TableNumber) 
VALUES
(11, 5, '2025-02-14', 1),
(12, 1, '2025-02-14', 5),
(13, 10, '2025-02-15', 6),
(14, 3, '2025-02-24', 9);

-- Task 2
DELIMITER $$
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
END $$

DELIMITER ;

CALL CheckBooking('2025-02-12', 9);

-- Task 3
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

ALTER TABLE Booking MODIFY COLUMN BookingID INT AUTO_INCREMENT;

-- Exercise: Create SQL queries to add and update bookings
-- Task 1
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

-- Task 2
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

-- Task 3
DELIMITER //

CREATE PROCEDURE CancelBooking(IN booking_id INT)
BEGIN
    DELETE FROM Booking
    WHERE BookingID = booking_id;

    SELECT CONCAT('Booking ', booking_id, ' cancelled') AS Confirmation;
END //

DELIMITER ;

CALL CancelBooking(9);