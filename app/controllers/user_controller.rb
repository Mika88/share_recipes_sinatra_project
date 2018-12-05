class UserController < ApplicationController

  get '/signup' do
    erb :'/users/signup'
  end

  post '/signup' do
    @user = User.new(name: params["name"], email: params["email"], password: params["password"])

    if @user.save && !@user.name.empty? && !@user.email.empty?
      @user.save
      session[:user_id] = @user.id
      redirect "/recipes"
    else
      redirect "/signup"
    end
  end

  get '/login' do
    if !logged_in?
      erb :'/users/login'
    else
      redirect "/tweets"
    end
  end

  post '/login' do
		@user = User.find_by(:username => params[:username])
	  if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
	    redirect "/tweets"
	  else
	    redirect "/login"
	  end
  end

  get "/logout" do
      session.clear
		  redirect "/login"
	end
end