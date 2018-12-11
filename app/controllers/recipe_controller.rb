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
      @recipe.save
    else
      flash[:missing_information] = "Error: One or more fields are empty. Please fill in all fields to add the recipe"
      redirect "/recipes/new"
    end

    if logged_in?
      @recipe.user_id = current_user.id
      @recipe.save
    end
    redirect "/recipes"
  end
  
    get '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    if logged_in?
      erb :'/recipes/show'
    else
      
      redirect "/login"
    end
  end
  
  get '/recipes/:id/edit' do
    if logged_in?
      @recipe = Recipe.find(params[:id])
      if @recipe.user_id == current_user.id
         erb :'/recipes/edit'
      else
        flash[:not_user_edit] = "Error: Editing another users' recipe is not allowed"
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
      flash[:missing_information] = "Error: One or more fields are empty. Please fill in all fields to edit the recipe"
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
        flash[:not_user_delete] = "Error: Deleting another users' recipe is not allowed"
        redirect "/recipes"
      end
      
    else
      not_logged_in_message
      redirect "/login"
    end
  end
end