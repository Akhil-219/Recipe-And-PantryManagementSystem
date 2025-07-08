CREATE VIEW PantryView AS
SELECT
    U.Username,
    I.IngredientName,
    PI.Quantity,
    PI.Units,
    PI.ExpiryDate,
    PI.LastUpdated
FROM User AS U
JOIN PantryItems AS PI ON U.UserID = PI.UserID
JOIN Ingredients AS I ON PI.IngredientID = I.IngredientID;