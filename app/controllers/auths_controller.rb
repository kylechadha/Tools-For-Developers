class AuthsController < ApplicationController
  def new
    if current_user
      redirect_to tools_path
    else
      @user = User.new
    end
  end

  def create
    begin
      user = User.find_by(email: params[:user][:email])
      if user.authenticated?(params[:user][:password])
        session[:user_id] = user.id
        flash[:notice] = "Welcome, #{current_user.name}!"
        if session[:redirect]
          redirect_to session[:redirect]
          session[:redirect] = nil
        else
          redirect_to tools_path
        end
      else
        flash[:notice] = "Incorrect username or password."
        redirect_to login_path
      end
    rescue 
      redirect_to login_path
      flash[:notice] = "Incorrect username or password."
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to tools_path
  end
end