class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    register Sinatra::Flash
    set :session_secret, "secret"
  end

  get '/' do
    if logged_in?
      redirect "/recipes"
    else
      erb :index
    end
  end
  
  helpers do
    def logged_in?
      !!session[:user_id]
    end

    def current_user
      User.find(session[:user_id])
    end
    
    def already_logged_in_message
      flash[:already_logged_in] = "Error: You are already logged in. To reach the page please log out first." 
    end
    
    def not_logged_in_message
      flash[:not_logged_in] = "Error: To get to the page you must log in"
    end
    
    def not_user_error_message
      flash[:not_user] = "Error: Only the user is allowed to complete this action"
    end
    
    def missing_info_message
      flash[:missing_information] = "Error: One or more fields are empty. Please fill in all fields to complete action"
    end
  end
end