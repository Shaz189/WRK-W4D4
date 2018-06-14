class SessionsController < ApplicationController
  
  def new
    if logged_in?
      redirect_to user_url(current_user.id)
    else 
      render :new 
    end
  end 
  
  def create 
    user = User.find_by_credentials(params[:users][:email], params[:users][:password])
    if user 
      log_in!(user)
    else 
      flash[:sign_in_error] = ['invalid username/password combination']
      redirect_to new_session_url
    end
  end 
  
  def destroy
     log_out!(current_user)
     redirect_to new_session_url
  end 
  
end