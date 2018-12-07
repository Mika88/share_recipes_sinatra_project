class RecipeController < ApplicationController
  get '/recipes' do
    @recipes = Recipe.all
    if logged_in?
      erb :'/recipes/index'
    else
      redirect "/login"
    end
  end
  
  get '/recipes/new' do
    if logged_in?
      erb :'/recipes/new'
    else
      redirect "/login"
    end
  end
  
  post '/recipes' do
    if params[:name] != "" && params[:ingredients] != "" && params[:instructions] != ""
      @recipe = Recipe.create(params)
    else
      redirect "/recipes/new"
    end

    if logged_in?
      @recipe.user_id = current_user.id
      @recipe.save
    end
    redirect "/recipes"
  end
  
  
end