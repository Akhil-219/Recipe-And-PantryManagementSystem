INSERT INTO User (Username, Email, PasswordHash, PasswordSalt, RegistrationDate, LastLogin) VALUES
('alicecooks', 'alice@example.com', '$2a$10$abcdefghijklmnopqrstuvwxyza1b2c3d4e5f6g7h8i9j0', 's0m3r4nd0ms4ltf0r4l1c3', '2023-01-15', NOW()),
('bob_chef', 'bob@example.com', '$2a$10$abcdefghijklmnopqrstuvwxyza1b2c3d4e5f6g7h8i9j1', 's0m3r4nd0ms4ltf0rb0b', '2023-02-20', NOW()),
('chloe_baker', 'chloe@example.com', '$2a$10$abcdefghijklmnopqrstuvwxyza1b2c3d4e5f6g7h8i9j2', 's0m3r4nd0ms4ltf0rchl03', '2023-03-10', NOW());

SELECT * FROM User; -- checking

INSERT INTO Category (CategoryName) VALUES
('Breakfast'),
('Lunch'),
('Dinner'),
('Dessert'),
('Snack'),
('Appetizer');

INSERT INTO Cuisine (CuisineName) VALUES
('Italian'),
('Mexican'),
('Indian'),
('American'),
('Asian'),
('Mediterranean');

INSERT INTO Ingredients (IngredientName, Description, DefaultUnit, IsVegetarian, IsVegan, IsGlutenFree) VALUES
('Flour, All-Purpose', 'Standard white flour, good for baking and general use.', 'gram', TRUE, TRUE, FALSE),
('Eggs, Large', 'Chicken eggs, size large.', 'piece', TRUE, FALSE, TRUE),
('Milk, Whole', 'Full-fat dairy milk.', 'ml', TRUE, FALSE, TRUE),
('Sugar, Granulated', 'Standard white sugar.', 'gram', TRUE, TRUE, TRUE),
('Butter, Unsalted', 'Unsalted dairy butter.', 'gram', TRUE, FALSE, TRUE),
('Chicken Breast', 'Boneless, skinless chicken breast.', 'gram', FALSE, FALSE, TRUE),
('Olive Oil', 'Extra virgin olive oil.', 'ml', TRUE, TRUE, TRUE),
('Onion', 'Common white or yellow onion.', 'piece', TRUE, TRUE, TRUE),
('Garlic', 'Garlic cloves.', 'piece', TRUE, TRUE, TRUE),
('Tomato, Canned Crushed', 'Crushed tomatoes in a can.', 'gram', TRUE, TRUE, TRUE),
('Pasta, Spaghetti', 'Long, thin pasta noodles.', 'gram', TRUE, TRUE, FALSE),
('Ground Beef', 'Minced beef.', 'gram', FALSE, FALSE, TRUE),
('Salt', 'Table salt.', 'gram', TRUE, TRUE, TRUE),
('Black Pepper', 'Ground black pepper.', 'gram', TRUE, TRUE, TRUE),
('Almond Flour', 'Flour made from ground almonds, gluten-free.', 'gram', TRUE, TRUE, TRUE),
('Coconut Milk', 'Milk extracted from the flesh of mature coconuts.', 'ml', TRUE, TRUE, TRUE),
('Vegetable Oil', 'General cooking oil from vegetables.', 'ml', TRUE, TRUE, TRUE),
('Parmesan Cheese', 'Hard, granular cheese.', 'gram', TRUE, FALSE, TRUE),
('Natural Yeast', 'A type of yeast often used in sourdough baking.', 'gram', TRUE, TRUE, TRUE),
('Honey', 'Sweet, viscous food substance made by bees, often used as a natural sweetener.', 'ml', TRUE, FALSE, TRUE);


INSERT INTO Recipe (RecipeName, Instructions, PrepTime, CookTime, Servings, CuisineID, CategoryID, ImageURL) VALUES
('Spaghetti Bolognese', '1. Brown ground beef and onion. 2. Add garlic and tomatoes. 3. Simmer sauce. 4. Cook pasta. 5. Serve sauce over pasta.', 20, 45, 4,
    (SELECT CuisineID FROM Cuisine WHERE CuisineName = 'Italian'),
    (SELECT CategoryID FROM Category WHERE CategoryName = 'Dinner'),
    'https://example.com/bolognese.jpg'),

('Chocolate Chip Cookies', '1. Cream butter and sugar. 2. Beat in eggs. 3. Mix in dry ingredients. 4. Fold in chocolate chips. 5. Bake until golden.', 15, 12, 12,
    (SELECT CuisineID FROM Cuisine WHERE CuisineName = 'American'),
    (SELECT CategoryID FROM Category WHERE CategoryName = 'Dessert'),
    'https://example.com/cookies.jpg'),

('Chicken Stir-fry', '1. Cut chicken and vegetables. 2. Stir-fry chicken, then add vegetables. 3. Add sauce. 4. Serve over rice (not included in ingredients).', 25, 20, 2,
    (SELECT CuisineID FROM Cuisine WHERE CuisineName = 'Asian'),
    (SELECT CategoryID FROM Category WHERE CategoryName = 'Dinner'),
    'https://example.com/stirfry.jpg');
    
-- Ingredients for Spaghetti Bolognese
INSERT INTO RecipeIngredient (RecipeID, IngredientID, QuantityRequired, UnitRequired) VALUES
((SELECT RecipeID FROM Recipe WHERE RecipeName = 'Spaghetti Bolognese'), (SELECT IngredientID FROM Ingredients WHERE IngredientName = 'Ground Beef'), 500, 'gram'),
((SELECT RecipeID FROM Recipe WHERE RecipeName = 'Spaghetti Bolognese'), (SELECT IngredientID FROM Ingredients WHERE IngredientName = 'Onion'), 1, 'piece'),
((SELECT RecipeID FROM Recipe WHERE RecipeName = 'Spaghetti Bolognese'), (SELECT IngredientID FROM Ingredients WHERE IngredientName = 'Garlic'), 3, 'piece'),
((SELECT RecipeID FROM Recipe WHERE RecipeName = 'Spaghetti Bolognese'), (SELECT IngredientID FROM Ingredients WHERE IngredientName = 'Tomato, Canned Crushed'), 400, 'gram'),
((SELECT RecipeID FROM Recipe WHERE RecipeName = 'Spaghetti Bolognese'), (SELECT IngredientID FROM Ingredients WHERE IngredientName = 'Pasta, Spaghetti'), 200, 'gram'),
((SELECT RecipeID FROM Recipe WHERE RecipeName = 'Spaghetti Bolognese'), (SELECT IngredientID FROM Ingredients WHERE IngredientName = 'Olive Oil'), 2, 'tablespoon'),
((SELECT RecipeID FROM Recipe WHERE RecipeName = 'Spaghetti Bolognese'), (SELECT IngredientID FROM Ingredients WHERE IngredientName = 'Salt'), 1, 'teaspoon'),
((SELECT RecipeID FROM Recipe WHERE RecipeName = 'Spaghetti Bolognese'), (SELECT IngredientID FROM Ingredients WHERE IngredientName = 'Black Pepper'), 0.5, 'teaspoon');

-- Ingredients for Chocolate Chip Cookies
INSERT INTO RecipeIngredient (RecipeID, IngredientID, QuantityRequired, UnitRequired) VALUES
((SELECT RecipeID FROM Recipe WHERE RecipeName = 'Chocolate Chip Cookies'), (SELECT IngredientID FROM Ingredients WHERE IngredientName = 'Flour, All-Purpose'), 250, 'gram'),
((SELECT RecipeID FROM Recipe WHERE RecipeName = 'Chocolate Chip Cookies'), (SELECT IngredientID FROM Ingredients WHERE IngredientName = 'Butter, Unsalted'), 150, 'gram'),
((SELECT RecipeID FROM Recipe WHERE RecipeName = 'Chocolate Chip Cookies'), (SELECT IngredientID FROM Ingredients WHERE IngredientName = 'Sugar, Granulated'), 200, 'gram'),
((SELECT RecipeID FROM Recipe WHERE RecipeName = 'Chocolate Chip Cookies'), (SELECT IngredientID FROM Ingredients WHERE IngredientName = 'Eggs, Large'), 2, 'piece'),
((SELECT RecipeID FROM Recipe WHERE RecipeName = 'Chocolate Chip Cookies'), (SELECT IngredientID FROM Ingredients WHERE IngredientName = 'Salt'), 0.5, 'teaspoon');


-- Assume UserID 1 is 'alicecooks'
INSERT INTO PantryItems (UserID, IngredientID, Quantity, Units, ExpiryDate, LastUpdated) VALUES
((SELECT UserID FROM User WHERE Username = 'alicecooks'), (SELECT IngredientID FROM Ingredients WHERE IngredientName = 'Flour, All-Purpose'), 1000, 'gram', '2024-12-31', NOW()),
((SELECT UserID FROM User WHERE Username = 'alicecooks'), (SELECT IngredientID FROM Ingredients WHERE IngredientName = 'Eggs, Large'), 6, 'piece', '2024-07-20', NOW()),
((SELECT UserID FROM User WHERE Username = 'alicecooks'), (SELECT IngredientID FROM Ingredients WHERE IngredientName = 'Milk, Whole'), 500, 'ml', '2024-07-10', NOW()),
((SELECT UserID FROM User WHERE Username = 'alicecooks'), (SELECT IngredientID FROM Ingredients WHERE IngredientName = 'Sugar, Granulated'), 750, 'gram', '2025-06-30', NOW()),
((SELECT UserID FROM User WHERE Username = 'alicecooks'), (SELECT IngredientID FROM Ingredients WHERE IngredientName = 'Olive Oil'), 250, 'ml', '2025-10-01', NOW()),
((SELECT UserID FROM User WHERE Username = 'alicecooks'), (SELECT IngredientID FROM Ingredients WHERE IngredientName = 'Onion'), 3, 'piece', '2024-07-25', NOW()),
((SELECT UserID FROM User WHERE Username = 'alicecooks'), (SELECT IngredientID FROM Ingredients WHERE IngredientName = 'Garlic'), 10, 'piece', '2024-08-15', NOW()),
((SELECT UserID FROM User WHERE Username = 'alicecooks'), (SELECT IngredientID FROM Ingredients WHERE IngredientName = 'Salt'), 100, 'gram', '2026-01-01', NOW()),
((SELECT UserID FROM User WHERE Username = 'alicecooks'), (SELECT IngredientID FROM Ingredients WHERE IngredientName = 'Almond Flour'), 500, 'gram', '2025-09-01', NOW()), 
((SELECT UserID FROM User WHERE Username = 'alicecooks'), (SELECT IngredientID FROM Ingredients WHERE IngredientName = 'Black Pepper'), 50, 'gram', '2026-01-01', NOW());

-- Assume UserID 2 is 'bob_chef'
INSERT INTO PantryItems (UserID, IngredientID, Quantity, Units, ExpiryDate, LastUpdated) VALUES
((SELECT UserID FROM User WHERE Username = 'bob_chef'), (SELECT IngredientID FROM Ingredients WHERE IngredientName = 'Chicken Breast'), 1000, 'gram', '2024-07-18', NOW()),
((SELECT UserID FROM User WHERE Username = 'bob_chef'), (SELECT IngredientID FROM Ingredients WHERE IngredientName = 'Vegetable Oil'), 1000, 'ml', '2025-05-01', NOW()),
((SELECT UserID FROM User WHERE Username = 'bob_chef'), (SELECT IngredientID FROM Ingredients WHERE IngredientName = 'Onion'), 2, 'piece', '2024-07-20', NOW()),
((SELECT UserID FROM User WHERE Username = 'bob_chef'), (SELECT IngredientID FROM Ingredients WHERE IngredientName = 'Garlic'), 5, 'piece', '2024-08-01', NOW());


INSERT INTO subrule(OriginalIngredientID, SubstitutionIngredientID, Ratio, RatioUnit, Notes) VALUES
((SELECT IngredientID FROM Ingredients WHERE IngredientName = 'Flour, All-Purpose'), (SELECT IngredientID FROM Ingredients WHERE IngredientName = 'Almond Flour'), 1.0, 'cup', 'For baking, may need slight adjustments.'),
((SELECT IngredientID FROM Ingredients WHERE IngredientName = 'Milk, Whole'), (SELECT IngredientID FROM Ingredients WHERE IngredientName = 'Coconut Milk'), 1.0, 'cup', 'Good for dairy-free alternatives.'),
((SELECT IngredientID FROM Ingredients WHERE IngredientName = 'Butter, Unsalted'), (SELECT IngredientID FROM Ingredients WHERE IngredientName = 'Vegetable Oil'), 0.8, 'cup', 'Use 0.8 cups oil for 1 cup butter.'),
((SELECT IngredientID FROM Ingredients WHERE IngredientName = 'Parmesan Cheese'), (SELECT IngredientID FROM Ingredients WHERE IngredientName = 'Natural Yeast'), 0.5, 'cup', 'For a cheesy, vegan flavor.'),
((SELECT IngredientID FROM Ingredients WHERE IngredientName = 'Sugar, Granulated'), (SELECT IngredientID FROM Ingredients WHERE IngredientName = 'Honey'), 0.75, 'cup', 'Use 3/4 cup honey for 1 cup sugar, reduce other liquids slightly.');

SELECT IngredientID, IngredientName FROM Ingredients ORDER BY IngredientName; -- checking if the ingredients and the substitute ingredients used are matching