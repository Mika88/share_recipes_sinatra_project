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
    if logged_in?
      redirect "/recipes"
    else
      erb :'/users/login'
    end
  end

  post '/login' do
		@user = User.find_by(:name => params[:name])
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
end