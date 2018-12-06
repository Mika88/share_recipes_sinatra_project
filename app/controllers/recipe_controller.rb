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
    if !params[:name].empty? && !params[:ingredients].empty? && !params[:instructions].empty?
      @recipe = Recipe.create(name: params[:name], ingredients: params[:ingredients], instructions: params[:instructions])
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