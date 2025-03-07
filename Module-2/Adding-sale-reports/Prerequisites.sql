Use LittleLemonDB;

SHOW TABLES FROM LittleLemonDB;

INSERT INTO Customer (customerID, FirstName, LastName, PhoneNumber, Email) VALUES
(1, 'Alice', 'Johnson', '1234567890', 'alice@example.com'),
(2, 'Bob', 'Smith', '0987654321', 'bob@example.com'),
(3, 'Charlie', 'Brown', '1112223333', 'charlie@example.com'),
(4, 'David', 'Williams', '2223334444', 'david@example.com'),
(5, 'Emma', 'Taylor', '3334445555', 'emma@example.com'),
(6, 'Frank', 'Clark', '4445556666', 'frank@example.com'),
(7, 'Grace', 'Lewis', '5556667777', 'grace@example.com'),
(8, 'Hannah', 'Walker', '6667778888', 'hannah@example.com'),
(9, 'Isaac', 'Young', '7778889999', 'isaac@example.com'),
(10, 'Jack', 'Hall', '8889990000', 'jack@example.com');

ALTER TABLE Booking RENAME COLUMN BookinDate TO BookingDate;

INSERT INTO Booking (BookingID, CustomerID, BookingDate, TableNumber) VALUES
(1, 1, '2025-02-04', 5),
(2, 2, '2025-02-05', 3),
(3, 3, '2025-02-06', 7),
(4, 4, '2025-02-07', 2),
(5, 5, '2025-02-08', 1),
(6, 6, '2025-02-09', 4),
(7, 7, '2025-02-10', 6),
(8, 8, '2025-02-11', 8),
(9, 9, '2025-02-12', 9),
(10, 10, '2025-02-13', 10);

INSERT INTO `Order` (OrderId, CustomerId, OrderDate, TotalCost) VALUES
(1, 1, '2025-02-04 12:30:00', 250.99),
(2, 2, '2025-02-05 18:45:00', 15.49),
(3, 3, '2025-02-06 20:00:00', 300.99),
(4, 4, '2025-02-07 13:15:00', 10.50),
(5, 5, '2025-02-08 19:30:00', 450.00),
(6, 6, '2025-02-09 21:00:00', 22.75),
(7, 7, '2025-02-10 14:00:00', 350.20),
(8, 8, '2025-02-11 16:45:00', 27.30),
(9, 9, '2025-02-12 18:00:00', 180.90),
(10, 10, '2025-02-13 20:15:00', 500.75);

INSERT INTO Menu (MenuItemID, ItemName, Category, Price) VALUES
(1, 'Margherita Pizza', 'Course', 12.99),
(2, 'Caesar Salad', 'Starter', 8.50),
(3, 'Grilled Chicken', 'Course', 15.99),
(4, 'Chocolate Cake', 'Dessert', 6.75),
(5, 'Pasta Carbonara', 'Course', 13.99),
(6, 'Mojito', 'Drink', 7.50),
(7, 'Tiramisu', 'Dessert', 5.99),
(8, 'French Fries', 'Starter', 4.50),
(9, 'Lemonade', 'Drink', 3.99),
(10, 'Beef Steak', 'Course', 22.99);

INSERT INTO OrderItem (OrderItemID, OrderID, MenuItemID, Quantity) VALUES
(1, 1, 1, 2),
(2, 2, 3, 1),
(3, 3, 5, 1),
(4, 4, 2, 3),
(5, 5, 6, 2),
(6, 6, 4, 1),
(7, 7, 7, 1),
(8, 8, 8, 2),
(9, 9, 9, 1),
(10, 10, 10, 2);

ALTER TABLE OrderDelivery 
MODIFY COLUMN Status ENUM ('Pending','Out for Delivery','Delivered','Cancelled');

INSERT INTO OrderDelivery (DeliveryID, OrderID, DeliveryDate, Status) VALUES
(1, 1, '2025-02-04 13:00:00', 'Delivered'),
(2, 2, '2025-02-05 19:10:00', 'Delivered'),
(3, 3, '2025-02-06 20:30:00', 'Delivered'),
(4, 4, '2025-02-07 13:45:00', 'Delivered'),
(5, 5, '2025-02-08 19:50:00', 'Delivered'),
(6, 6, '2025-02-09 21:20:00', 'Pending'),
(7, 7, '2025-02-10 14:30:00', 'Out for Delivery'),
(8, 8, '2025-02-11 17:00:00', 'Pending'),
(9, 9, '2025-02-12 18:20:00', 'Cancelled'),
(10, 10, '2025-02-13 21:00:00', 'Delivered');

INSERT INTO Staff (StaffID, FirstName, LastName, Role, Salary) VALUES
(1, 'John', 'Doe', 'Chef', 4000),
(2, 'Sarah', 'Lee', 'Waiter', 2500),
(3, 'Mike', 'Johnson', 'Manager', 5000),
(4, 'Emily', 'Davis', 'Waiter', 2500),
(5, 'James', 'Wilson', 'Chef', 4200),
(6, 'Anna', 'Martin', 'Delivery', 2200),
(7, 'Tom', 'Clark', 'Delivery', 2300),
(8, 'Sophia', 'Taylor', 'Chef', 4100),
(9, 'Daniel', 'Brown', 'Manager', 5200),
(10, 'Olivia', 'Anderson', 'Waiter', 2600);

INSERT INTO OrderStaff (OrderStaffID, OrderID, StaffID) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5),
(6, 6, 6),
(7, 7, 7),
(8, 8, 8),
(9, 9, 9),
(10, 10, 10);

ALTER TABLE Booking MODIFY COLUMN BookingID INT AUTO_INCREMENT;