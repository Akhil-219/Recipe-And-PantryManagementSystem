CREATE VIEW RecipeIngredientsListView AS
SELECT
    R.RecipeName,
    I.IngredientName,
    RI.QuantityRequired,
    RI.UnitRequired
FROM Recipe AS R
JOIN RecipeIngredient AS RI ON R.RecipeID = RI.RecipeID
JOIN Ingredients AS I ON RI.IngredientID = I.IngredientID;