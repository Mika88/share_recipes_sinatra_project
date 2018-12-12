class RecipeController < ApplicationController
  get '/recipes' do
    @recipes = Recipe.all
    if logged_in?
      erb :'/recipes/index'
    else
      not_logged_in_message
      redirect "/login"
    end
  end
  
  get '/recipes/new' do
    if logged_in?
      erb :'/recipes/new'
    else
      not_logged_in_message
      redirect "/login"
    end
  end
  
  post '/recipes' do
    @recipe = Recipe.new(params)
    if @recipe.name != "" && @recipe.ingredients != "" && @recipe.instructions != ""
      @recipe.user_id = current_user.id
      @recipe.save
      redirect "/recipes"
    else
      missing_info_message
      redirect "/recipes/new"
    end
  end
  
    get '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    if logged_in?
      erb :'/recipes/show'
    else
      not_logged_in_message
      redirect "/login"
    end
  end
  
  get '/recipes/:id/edit' do
    if logged_in?
      @recipe = Recipe.find(params[:id])
      if @recipe.user_id == current_user.id
         erb :'/recipes/edit'
      else
        not_user_error_message
        redirect "/recipes"
      end
    else
      not_logged_in_message
      redirect "/login"
    end
  end
  
  patch '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    if params[:instructions] != "" && params[:ingredients] != "" && params[:name] != ""
      @recipe.update(name: params[:name], ingredients: params[:ingredients], instructions: params[:instructions])
      redirect "/recipes/#{@recipe.id}"
    else
      missing_info_message
      redirect "/recipes/#{@recipe.id}/edit"
    end
  end
      
  delete '/recipes/:id/delete' do
    @recipe = Recipe.find(params[:id])
    if logged_in? 
      
      if @recipe.user_id == current_user.id
        @recipe.destroy
        redirect "/recipes"
      else
        not_user_error_message
        redirect "/recipes"
      end
      
    else
      not_logged_in_message
      redirect "/login"
    end
  end
end