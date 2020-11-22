create table Recipe (id INT NOT NULL PRIMARY KEY AUTO_INCREMENT, name VARCHAR(25), description VARCHAR(50), instructions VARCHAR(500)) ENGINE=InnoDB DEFAULT CHARSET=utf8;
create table Ingredient (id INT NOT NULL PRIMARY KEY AUTO_INCREMENT, name VARCHAR(50)) ENGINE=InnoDB DEFAULT CHARSET=utf8; 
create table Measure (id INT NOT NULL PRIMARY KEY AUTO_INCREMENT, name VARCHAR(30)) ENGINE=InnoDB DEFAULT CHARSET=utf8; 

create table RecipeIngredient (recipe_id INT NOT NULL, ingredient_id INT NOT NULL, measure_id INT, amount INT, 
	CONSTRAINT fk_recipe FOREIGN KEY(recipe_id) REFERENCES Recipe(id), 
	CONSTRAINT fk_ingredient FOREIGN KEY(ingredient_id) REFERENCES Ingredient(id), 
	CONSTRAINT fk_measure FOREIGN KEY(measure_id) REFERENCES Measure(id)) 
	ENGINE=InnoDB DEFAULT CHARSET=utf8; 


INSERT INTO Measure (name) VALUES('CUP'), ('TEASPOON'), ('TABLESPOON'), ('WHOLE');

INSERT INTO Ingredient (name) VALUES('egg'), ('salt'), ('sugar'), ('chocolate'), ('vanilla extract'), ('flour'), ('pancake mix'), ('water'), ('bread slice'), ('cheese slice'), ('noodles'), ('seasoning powder packet'), ('can of root beer'), ('scoop of vanilla ice cream'), ('a shot of Kraken Spiced Rum');

INSERT INTO Recipe (name, description, instructions) VALUES('Boiled Egg', 'A single boiled egg', 'Add egg to cold water. Bring water to boil. Cook.');

INSERT INTO Recipe (name, description, instructions) VALUES('Chocolate Cake', 'Yummy cake', 'Add eggs, flour, chocolate to pan. Bake at 350 for 1 hour');

INSERT INTO Recipe (name, description, instructions) VALUES('Instant Pancakes', 'Fluffy, delicious, and easy to make!', 'Mix pancake mix with water. Pan fry on medium-low heat until browned.');

INSERT INTO Recipe (name, description, instructions) VALUES('Chocolate Pancakes', 'A chocolatey twist on a breakfast favorite.', 'Mix the chocolate, pancake mix, and water in a cup. Pan fry on low heat until cooked.');

INSERT INTO Recipe (name, description, instructions) VALUES('Grilled Cheese', 'Cheesey goodness!', 'Place the cheese between the two slices of bread. Grill each side for 3 minutes on medium heat.');

INSERT INTO Recipe (name, description, instructions) VALUES('Instant Ramen', 'Tasty noodle soup on the cheap!', 'Bring water to boil. Add noodles, reduce heat, and boil for 3 minutes. Add seasoning powder, mix, and enjoy!');

INSERT INTO Recipe (name, description, instructions) VALUES('Dirty Root Beer Float', 'Root beer float for adults only!', 'Pour root beer into large glass. Add the scoop of ice cream and then pour the shot of rum onto the ice cream.');

INSERT INTO RecipeIngredient (recipe_id, ingredient_id, measure_id, amount) VALUES (1, 1, NULL, 1);

INSERT INTO RecipeIngredient (recipe_id, ingredient_id, measure_id, amount)  VALUES (2, 1, NULL, 3);

INSERT INTO RecipeIngredient (recipe_id, ingredient_id, measure_id, amount)  VALUES (2, 2, 2, 1);

INSERT INTO RecipeIngredient (recipe_id, ingredient_id, measure_id, amount)  VALUES (2, 3, 1, 2);

INSERT INTO RecipeIngredient (recipe_id, ingredient_id, measure_id, amount)  VALUES (2, 4, 1, 1);

INSERT INTO RecipeIngredient (recipe_id, ingredient_id, measure_id, amount)  VALUES (3, 7, 1, 2);
INSERT INTO RecipeIngredient (recipe_id, ingredient_id, measure_id, amount)  VALUES (3, 8, 1, 1);

INSERT INTO RecipeIngredient (recipe_id, ingredient_id, measure_id, amount)  VALUES (4, 7, 1, 2);
INSERT INTO RecipeIngredient (recipe_id, ingredient_id, measure_id, amount)  VALUES (4, 8, 1, 1);
INSERT INTO RecipeIngredient (recipe_id, ingredient_id, measure_id, amount)  VALUES (4, 4, 3, 2);

INSERT INTO RecipeIngredient (recipe_id, ingredient_id, measure_id, amount)  VALUES (5, 9, NULL, 2);
INSERT INTO RecipeIngredient (recipe_id, ingredient_id, measure_id, amount)  VALUES (5, 10, NULL, 1);

INSERT INTO RecipeIngredient (recipe_id, ingredient_id, measure_id, amount)  VALUES (6, 8, 1, 2);
INSERT INTO RecipeIngredient (recipe_id, ingredient_id, measure_id, amount)  VALUES (6, 11, NULL, 1);
INSERT INTO RecipeIngredient (recipe_id, ingredient_id, measure_id, amount)  VALUES (6, 12, NULL, 1);

INSERT INTO RecipeIngredient (recipe_id, ingredient_id, measure_id, amount)  VALUES (7, 13, NULL, 1);
INSERT INTO RecipeIngredient (recipe_id, ingredient_id, measure_id, amount)  VALUES (7, 14, NULL, 1);
INSERT INTO RecipeIngredient (recipe_id, ingredient_id, measure_id, amount)  VALUES (7, 15, NULL, 1);

/* */ /* */ /* */ /* */ /* */ /* */ /* */ /* */ /* */ /* */ /* */ /* */ /* */ /* */ /* */ /* */ /* */

/* */ /* */ /* */ /* */ /* */ /* */ /* */ /* */ /* */ /* */ /* */ /* */ /* */

/* */ /* */ /* */ /* */ /* */ /* */ /* */ /* */ /* */

/* */ /* */ /* */ /* */ /* */ /* */ /* */ /* */ /* */ /* */ /* */ /* */ /* */

/* */ /* */ /* */ /* */ /* */ /* */ /* */ /* */ /* */ /* */ /* */ /* */ /* */ /* */ /* */ /* */ /* */

/* get a list of all ingredients */
SELECT r.name AS 'Recipe', r.instructions, ri.amount AS 'Amount', mu.name AS 'Unit of Measure', i.name AS 'Ingredient' 
FROM Recipe r 
JOIN RecipeIngredient ri on r.id = ri.recipe_id 
JOIN Ingredient i on i.id = ri.ingredient_id 
LEFT OUTER JOIN Measure mu on mu.id = measure_id;

/* get a list of all recipes */
SELECT * FROM Recipe;

/* gets a list of recipes that use chocolate*/
SELECT *
From Recipe r
JOIN RecipeIngredient ri on ri.recipe_id = r.id  
JOIN Ingredient i on i.id = ri.ingredient_id 
WHERE i.name = 'chocolate';

/* updates pancakes to flapjacks */
UPDATE Recipe
SET name = 'Chocolate Flapjacks'
WHERE id = 4;