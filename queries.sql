-- In this SQL file, write (and comment!) the typical SQL queries users will run on your database

INSERT INTO users(user_id,username,email,password_hash)
VALUES("john123","john_doe","john@example.com","hashed_password_here");

INSERT INTO users
VALUES("sam2344","sam_johns","samjohns@gmail.com","sam7661");

INSERT INTO users
VALUES("sarah1456","sarah_carter","sarahsams@hotmail.com","sarah3441");

INSERT INTO users
VALUES("james7890","james_barnes","jamesbarnes@hotmail.com","james6771");

INSERT INTO users
VALUES("vijay703","vijay_samuel","vijay@sdf.com","vijay6911");

INSERT INTO category(name,category_id)
VALUES("Deserts","D112");

INSERT INTO category
VALUES("Main_course","M113");

INSERT INTO category
VALUES("Starters","S234");


INSERT INTO recipes
VALUES('r112','Chocolate Desert','a rich and moist chocolate cake','45','8','john123');

INSERT INTO recipes
VALUES('r221','Cheese Pancake','cake full of cheese','38','9','sam2344');

INSERT INTO recipes
VALUES('r123','Chicken soup','best soup in the world','40','9','sarah1456');


INSERT INTO recipes
VALUES('r456','Spring roll','crispy and spicy','41','10','james7890');


INSERT INTO recipes
VALUES('r789','Cheese pizza','extraordinary flavour','37','8','vijay703');



INSERT INTO Ingredients
VALUES('I112','Flour','Deserts');

INSERT INTO Ingredients
VALUES('J123','Mills','Main_course');

INSERT INTO Ingredients
VALUES('Q234','Wheat','Starters');

INSERT INTO ratings
VALUES('r112','john123','r112','4','Excellent');

INSERT INTO ratings
VALUES('ra221','sam2344','r221','3','Good');

INSERT INTO ratings
VALUES('ra123','sarah1456','r123','5','Perfect');

INSERT INTO ratings
VALUES('ra456','james7890','r456','2','Okay');

INSERT INTO ratings
VALUES('ra789','vijay703','r789','4','Excellent');


SELECT * FROM Ingredients;
SELECT * FROM category;
SELECT * FROM ratings;
SELECT * FROM users;
SELECT * FROM recipes;


UPDATE recipes
SET description = "This cake is amazing!"
WHERE recipe_id = 'r112';


SELECT username , email , title , description
FROM users INNER JOIN recipes ON
users.user_id = recipes.user_id
WHERE users.email = "john@123.com";

UPDATE users
SET email = "john@123.com"
WHERE username = "john_doe";

DELETE FROM ratings
WHERE rating_id = "r112";

DELETE FROM recipes
WHERE recipe_id = "r112";

SELECT rating_id , comment , title , cooking_time
FROM ratings LEFT JOIN recipes
ON recipes.recipe_id = ratings.recipe_id
WHERE ratings.user_id = "john123";


SELECT recipes.user_id , score , description , cooking_time
FROM recipes RIGHT JOIN ratings
ON recipes.recipe_id = ratings.recipe_id
WHERE recipes.recipe_id = 'r789';


UPDATE ratings
SET rating_id = 'ra112'
WHERE user_id = 'john123';
