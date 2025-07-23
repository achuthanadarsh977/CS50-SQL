-- In this SQL file, write (and comment!) the schema of your database, including the CREATE TABLE, CREATE INDEX,CREATE VIEW, etc. statements that compose it


CREATE TABLE users(
user_id TEXT PRIMARY KEY,
username TEXT NOT NULL UNIQUE,
email TEXT NOT NULL UNIQUE,
password_hash TEXT NOT NULL
);

CREATE TABLE ratings(
rating_id TEXT PRIMARY KEY,
user_id TEXT NOT NULL,
recipe_id TEXT NOT NULL,
score TEXT NOT NULL,
comment TEXT NOT NULL,
FOREIGN KEY(user_id) REFERENCES users(user_id),
FOREIGN KEY(recipe_id) REFERENCES recipes(recipe_id)
);

CREATE TABLE recipes(
recipe_id TEXT PRIMARY KEY,
title TEXT NOT NULL,
description TEXT NOT NULL,
cooking_time TEXT NOT NULL,
serving_size TEXT NOT NULL,
user_id TEXT NOT NULL,
FOREIGN KEY(user_id) REFERENCES users(user_id)
);

CREATE TABLE category(
name TEXT NOT NULL,
category_id TEXT PRIMARY KEY
);

CREATE TABLE Ingredients(
ingredient_id INT PRIMARY KEY,
name TEXT NOT NULL,
category TEXT NOT NULL
);

CREATE INDEX recipe_index ON recipes(recipe_id);
CREATE INDEX user_index ON users(user_id);
CREATE INDEX ingredient_index ON Ingredients(name);

CREATE INDEX category_index ON ingredients(category);


CREATE VIEW user_rating
AS SELECT username , email , rating_id , recipe_id
FROM users JOIN ratings ON users.user_id = ratings.user_id;

CREATE VIEW recipe_users
AS SELECT recipe_id , title , email , password_hash
FROM users JOIN recipes ON users.user_id = recipes.user_id;

CREATE VIEW ratings_recipes
AS SELECT score , comment , title , description
FROM ratings JOIN recipes ON ratings.user_id = recipes.user_id;







