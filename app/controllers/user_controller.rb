class UserController < ApplicationController

  get '/signup' do
    if !logged_in?
      erb :'/users/signup'
    else
      flash[:already_signed_in] = "Error: You are already signed and logged in. To reach sign up page please log out first and then go to sign up page."
      redirect "/recipes"
    end
  end

  post '/signup' do
    @user = User.new(params)
    if User.all.find{|user| user.username == @user.username}
      flash[:username_exists_error] = "Error: The username you entered already exists. Please enter a different username."
      redirect "/signup"
    elsif @user.save && @user.username != "" && @user.email != ""
      @user.save
      session[:user_id] = @user.id
      redirect "/recipes"
    else
      flash[:missing_field] = "Error: One or more fields are empty, please fill all fields to sign up."
      redirect "/signup"
    end
  end

  get '/login' do
    if logged_in?
      flash[:already_logged_in] = "Error: You are already logged in. To reach log in page please log out first."
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
	    flash[:login_error] = "Erorr: Wasn't able to varify username and/or password. Please re-enter log in information."
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