# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app --# add the Sinatra gem and inherit from Sinatra::Base in the application_controller file.
- [x] Use ActiveRecord for storing information in a database --# build a models repository where the classes are inheriting from                ActiveRecord and create migrations in the db repository that are resposible for the methods and attributes of the models. 
- [x] Include more than one model class (e.g. User, Post, Category) --# app includes a User and Recipe models.
- [x] Include at least one has_many relationship on your User model (e.g. User has_many Posts) --# a User has_many Recipes.
- [x] Include at least one belongs_to relationship on another model (e.g. Post belongs_to User) --# a Recipe belongs_to a User. 
- [x] Include user accounts with unique login attribute (username or email) --# a user needs a unique username and a password to login.
- [x] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying --# the recipe_controller has a get       '/recipes/new' and post '/recipes' routes for Creating a recipe. It has a get '/recipes' and get '/recipes/:id' routes for              Reading recipe/s. It has a get '/recipes/:id/edit' and  patch '/recipes/:id' for Updating a recipe. And has a delete            '       '/recipes/:id/delete' route for Destroying a recipe. 
- [x] Ensure that users can't modify content created by other users --# using the if @recipe.user_id == current_user.id condition in the       routes in recipes_controller, only the user who is logged in can edit or delete his recipes. 
- [x] Include user input validations --# by adding conditions (if @user.save && @user.username != "" && @user.email != "") to the routes       in user_controller, only if a user doesn't leave a field empty he can sign up. also, a user has to put in the right username and        password when login in (if @user && @user.authenticate(params[:password])).
- [x] BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new) --# there are          error messages using the sinatra-flash gem that let the users know when their inputs are not validated, when they try to edit or        delete another users' reipe and other illegal actions.
- [x] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code

Confirm
- [x] You have a large number of small Git commits
- [x] Your commit messages are meaningful
- [x] You made the changes in a commit that relate to the commit message
- [x] You don't include changes in a commit that aren't related to the commit message
