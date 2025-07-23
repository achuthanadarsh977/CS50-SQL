# Design Document

By Adarsh Achuthan

Video overview:https://youtube/G2T8uWkQLkE

## Purpose
The purpose of the recipe database is to store , organize and facilitate
access to various recipes for users.It allows users to create, share
and search for recipes based on ingredients, dietary preferences
and cooking methods.
## Scope
Included in scope
Recipes:Each recipe with its ingredients, cooking time and serving size
Ingredients:Information about each ingredient , including name and category
Users:Profiles for users can create and save recipes ,rate them and provide comment
Categories:Different categories for recipes
Ratings and comment:Feedback from users on recipes

Outside of the scope
Nutritional information
Advanced meal planning features (eg:grocery lists)
External food sourcing or delivery services
User social networking features beyond recipe sharing and commenting

## Functional Requirements
User Capabilities:
Create,read,update and delete recipes.
Search for recipes by ingredients , categories or keywods.
Rate recipes and leave comment
Save favourite recipes for easy access
Filter recipes based on dietary restrictions
No extended meal planning or grocery list

## Representation
1.Recipes
Attributes:
recipe_id(primary key)
title
description
cooking_time
serving_size
user_id(Foreign key)
2.Ingredients
Attributes:
ingredient_type(primary key)
name
category
3.Users
Attributes:
user_id(primary key)
username
email
password_hash
4.Ratings
Attributes:
rating_id(primary key)
user_id(foreign key)
recipe_id(foreign key)
score
comment
5.Categories
Attributes:
name
category_id(primary key)

### Entities
1.Recipes
Attributes:
recipe_id(primary key)
title
description
cooking_time
serving_size
user_id(Foreign key)
Reason:Text for title/description, integers for time and serving size and unique identifier for recipe_id
2.Ingredients
Attributes:
ingredient_type(primary key)
name
category
Reason:Text for name and category unique identifier for ingredient_id
3.Users
Attributes:
user_id(primary key)
username
email
password_hash
Reason:Text for username and email unique identfier for user_id
4.Ratings
Attributes:
rating_id(primary key)
user_id(foreign key)
recipe_id(foreign key)
score
comment
Reason:Integers for score(1-5), text for comments , unique identifier for rating_id
5.Categories
Attributes:
name
category_id(primary key)
Reason:Text for category_name,unique identifier for category_id
### Relationships


project/er_diagram.png



Recipe to users:Many-to-one (each recipe is created by one user)
Ingredients to recipes: Many-to-many(a recipe can have multiple ingredients)
Rating to recipes: Many-to-one(each rating belongs to one recipe)
Rating to users: Many-to-one(each rating given by one user)
Recipes to categories: Many-to-one(each recipe belongs to one category)


## Optimizations
Indexes: Create indexes on recipe_id , user_id and ingredient_id to
speed up search queries.

Views: Create views for popular recipes or recently added recipes to
improve performance for those common queries.

## Limitations

Design Limitations: The current design may not support
complex queries for nutritional analysis or meal planning

Representation Limitations: It may be difficult to represent recipes
that require specific ingredients or complex substitution scenarios.

Scalability:As the user base grows, performance may degrade without
further optimization.

This structured approach will help you build a well-defined recipe database ,
keeping in mind both functional and design considerations.
