
-- Accessing the Pantry view
SELECT * FROM PantryView WHERE Username = 'alicecooks';


-- Accessing the Recipe details view
SELECT RecipeName, CuisineName, CategoryName FROM RecipeDetailsView WHERE CategoryName = 'Dessert';


-- Accessing the ingredients view
SELECT IngredientName, QuantityRequired, UnitRequired FROM RecipeIngredientsListView WHERE RecipeName = 'Spaghetti Bolognese';