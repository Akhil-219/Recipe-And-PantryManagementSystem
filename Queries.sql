-- Checking the tables
SELECT * from User;
SELECT * from Ingredients;
SELECT * from Recipe;
SELECT * from Recipeingredient;
SELECT * from Cuisine;
SELECT * from Subrule;
SELECT * from Pantryitems;
SELECT * from Category;

-- Tesing relationships with joins
-- who owns want pantry items?
SELECT
    U.Username,
    I.IngredientName,
    PI.Quantity,
    PI.Units,
    PI.ExpiryDate
FROM User AS U
JOIN PantryItems AS PI ON U.UserID = PI.UserID
JOIN Ingredients AS I ON PI.IngredientID = I.IngredientID
WHERE U.Username = 'alicecooks';

-- What ingredients does a recipe require?
SELECT
    R.RecipeName,
    I.IngredientName,
    RI.QuantityRequired,
    RI.UnitRequired
FROM Recipe AS R
JOIN RecipeIngredient AS RI ON R.RecipeID = RI.RecipeID
JOIN Ingredients AS I ON RI.IngredientID = I.IngredientID
WHERE R.RecipeName = 'Spaghetti Bolognese';

-- What are the instructions for the given recipe?
SELECT
    RecipeName,
    Instructions,
    ImageURL
FROM Recipe
WHERE RecipeName = 'Chocolate Chip Cookies'; -- Or any other recipe you're interested in

-- Main Purpose
-- What can I cook with available items?
SELECT
    R.RecipeName
FROM Recipe AS R
WHERE NOT EXISTS (
    SELECT RI.IngredientID
    FROM RecipeIngredient AS RI
    WHERE RI.RecipeID = R.RecipeID
    AND NOT EXISTS (
        SELECT PI.IngredientID
        FROM PantryItems AS PI
        WHERE PI.UserID = (SELECT UserID FROM User WHERE Username = 'alicecooks')
        AND PI.IngredientID = RI.IngredientID
        AND PI.Quantity >= RI.QuantityRequired -- Consider units/conversions here!
    )
);

-- If a recipe requires an ingredient you don't have, can you suggest an alternative from your pantry based on SubstitutionRule?
SELECT
    SR.OriginalIngredientID,
    OI.IngredientName AS OriginalName,
    SR.SubstitutionIngredientID,
    SI.IngredientName AS SubstituteName,
    SR.Ratio,
    SR.RatioUnit,
    SR.Notes
FROM SubRule AS SR
JOIN Ingredients AS OI ON SR.OriginalIngredientID = OI.IngredientID
JOIN Ingredients AS SI ON SR.SubstitutionIngredientID = SI.IngredientID
WHERE OI.IngredientName = 'Flour, All-Purpose';

-- Notifying users if their items are getting expired!
SELECT
    U.Username,
    I.IngredientName,
    PI.Quantity,
    PI.Units,
    PI.ExpiryDate
FROM PantryItems AS PI
JOIN User AS U ON PI.UserID = U.UserID
JOIN Ingredients AS I ON PI.IngredientID = I.IngredientID
WHERE PI.ExpiryDate <= CURDATE() + INTERVAL 7 DAY -- Items expiring in the next 7 days
ORDER BY PI.ExpiryDate;