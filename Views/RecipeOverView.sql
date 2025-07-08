CREATE VIEW RecipeDetailsView AS
SELECT
    R.RecipeName,
    R.Instructions,
    R.PrepTime,
    R.CookTime,
    R.Servings,
    C.CuisineName,
    Cat.CategoryName,
    R.ImageURL
FROM Recipe AS R
LEFT JOIN Cuisine AS C ON R.CuisineID = C.CuisineID
LEFT JOIN Category AS Cat ON R.CategoryID = Cat.CategoryID;