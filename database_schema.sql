CREATE DATABASE RecipeAndPantrySystem;
USE RecipeAndPantrySystem;





CREATE TABLE User(
	userid INT PRIMARY KEY AUTO_INCREMENT ,
    username VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL UNIQUE,
    passwordHash VARCHAR(255) NOT NULL,
	PasswordSalt VARCHAR(255) NOT NULL,
    registrationdate DATE NOT NULL,
    LastLogin TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE ingredients(
	ingredientid INT PRIMARY KEY AUTO_INCREMENT,
    ingredientname VARCHAR(100) NOT NULL UNIQUE,
    Description TEXT, 
    defaultunit VARCHAR(50),
    IsVegetarian BOOLEAN DEFAULT TRUE,
    IsVegan BOOLEAN DEFAULT TRUE,
    IsGlutenFree BOOLEAN DEFAULT TRUE
);

CREATE TABLE pantryitems(
	pantryid INT PRIMARY KEY AUTO_INCREMENT,
	userid INT NOT NULL,
    itemid INT NOT NULL,
    quantity DECIMAL(10, 2) NOT NULL,
    units varchar(50) NOT NULL,
    expirydate DATE,
    lastupdate TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP ,
    FOREIGN KEY(userid)
			REFERENCES USER(userid)
            ON DELETE CASCADE
            ON UPDATE CASCADE,
	FOREIGN KEY(itemid)
			REFERENCES ingredients(ingredientid)
            on DELETE RESTRICT
            on UPDATE CASCADE
);

CREATE TABLE category(
	categoryid INT PRIMARY KEY AUTO_INCREMENT,
    categoryName varchar(50) NOT NULL UNIQUE
);

CREATE TABLE cuisine(
	cuisineid INT PRIMARY KEY AUTO_INCREMENT,
    cuisineName varchar(50) NOT NULL UNIQUE
);


CREATE TABLE recipe(
	recipeid INT PRIMARY KEY AUTO_INCREMENT,
    recipename VARCHAR(255) NOT NULL,
    instructions TEXT NOT NULL,
    PrepTime INT,
    CookTime INT,
    Servings INT,
    CuisineID INT,
    CategoryID INT,
	imageurl varchar(255),
    FOREIGN KEY(CuisineID)
		REFERENCES cuisine(cuisineid)
        ON DELETE SET NULL
        ON UPDATE CASCADE,
	foreign key(CategoryID)
		references category(categoryid)
        ON DELETE SET NULL
        ON UPDATE CASCADE
);

CREATE TABLE RecipeIngredient (
    RecipeID INT NOT NULL,
    IngredientID INT NOT NULL,
    QuantityRequired DECIMAL(10, 2) NOT NULL, 
    UnitRequired VARCHAR(50) NOT NULL,        

    PRIMARY KEY (RecipeID, IngredientID), 

    FOREIGN KEY (RecipeID)
        REFERENCES recipe(recipeID)
        ON DELETE CASCADE  
        ON UPDATE CASCADE, 

    FOREIGN KEY (ingredientID)
        references ingredients(ingredientid)
        ON DELETE RESTRICT
        ON UPDATE CASCADE 
);

CREATE TABLE subRule(
	subId INT PRIMARY KEY AUTO_INCREMENT,
    originalIngredientID INT NOT NULL,
    substitutionIngredientID INT NOT NULL,
    ratio DECIMAL(10, 2) NOT NULL,
    ratiounit VARCHAR(50),
    notes TEXT NOT NULL,
	FOREIGN KEY(originalIngredientID)
		REFERENCES ingredients(ingredientid)
        ON DELETE CASCADE  
        ON UPDATE CASCADE, 
	FOREIGN KEY(substitutionIngredientID)
		REFERENCES ingredients(ingredientid)
        ON DELETE CASCADE  
        ON UPDATE CASCADE, 
        UNIQUE (originalIngredientID, substitutionIngredientID)
);