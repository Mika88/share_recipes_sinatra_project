class UserController < ApplicationController

  get '/signup' do
    if !logged_in?
      erb :'/users/signup'
    else
      redirect "/recipes"
    end
  end

  post '/signup' do
    @user = User.new(params)
      User.all.find{|user| params[:username] == @user.username}
    if @user.save && @user.username != "" && @user.email != "" &&  !User.all.find{|user| @user.username == user.username}
      @user.save
      session[:user_id] = @user.id
      redirect "/recipes"
   
      
    else
      redirect "/signup"
    end
  end

  get '/login' do
    if logged_in?
      redirect "/recipes"
    else
      erb :'/users/login'
    end
  end

  post '/login' do
		@user = User.find_by(:username => params[:username])
	  if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
	    redirect "/recipes"
	  else
	    redirect "/login"
	  end
  end

  get "/logout" do
    session.clear
	  redirect "/login"
	end
	
  get '/users/:slug' do
    @user = User.find_by_slug(params[:slug])
    @recipes = @user.recipes
    if  session[:user_id] == @user.id
      erb :'/users/show'
    else
      redirect "/recipes"
    end
  end
end