/* Little Lemon need information from four tables on all customers with orders that cost more than $150. Extract the required information from each of the following tables by using the relevant JOIN clause: 
- Customer table: The customer id and full name.
- Order table: The order id and cost.
- Menu table: The menus name.
- OrderItem table: course name and starter name.
*/

SELECT 
    c.CustomerID, 
    CONCAT(c.FirstName, ' ', c.LastName) AS FullName, 
    o.OrderID, 
    o.TotalCost, 
    m.ItemName, 
    m.Category
FROM `Customer` c
JOIN `Order` o ON c.CustomerID = o.CustomerID
JOIN `OrderItem` oi ON o.OrderID = oi.OrderID
JOIN `Menu` m ON oi.MenuItemID = m.MenuItemID
WHERE o.TotalCost > 150
ORDER BY o.TotalCost ASC;