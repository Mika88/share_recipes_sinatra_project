class RecipeController < ApplicationController
  get '/recipes' do
    erb :index
  end
end