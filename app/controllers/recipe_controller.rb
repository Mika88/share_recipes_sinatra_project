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
    @recipe = Recipe.new(params)
    if @recipe.name != "" && @recipe.ingredients != "" && @recipe.instructions != ""
      @recipe.save
    else
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
        redirect "/recipes"
      end
    else
      redirect "/login"
    end
  end
  
    patch '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    @recipe.update(params)
    if !@tweet.content.empty?
      redirect "/tweets/#{@tweet.id}"
    else
      redirect "/tweets/#{@tweet.id}/edit"
    end
  end
end