class RecipeController < ApplicationController
  get '/recipes' do
    @recipes = Recipe.all
    if logged_in?
      erb :'/recipes/index'
    else
      redirect_to_login
    end
  end
  
  get '/recipes/new' do
    erb :'/recipes/new'
  end
  
end