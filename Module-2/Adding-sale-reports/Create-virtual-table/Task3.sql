-- Find all menu items for which more than 2 orders have been placed.

SELECT ItemName 
FROM `Menu`
WHERE MenuItemID = ANY (
    SELECT MenuItemID 
    FROM `OrderItem`
    WHERE Quantity > 2
);