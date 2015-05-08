class SessionsController < ApplicationController
  
  def new
  end

  #login
  def create
    user = User.authenticate(params[:session][:email], params[:session][:password])
    if user.nil?
    	flash[:errors] ="Invalid email or password"
    	redirect_to '/'
    else
    	sign_in user
    	flash[:success] = "Sign in successful!"
    	redirect_to :mains
    end
  end

  #logout
  def destroy
  	sign_out
  	flash[:success] = "Logout Successful!"
  	redirect_to new_session_path
  end
end
