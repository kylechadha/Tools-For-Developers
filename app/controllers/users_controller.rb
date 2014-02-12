class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end


  def new
    @user = User.new
  end

  def create
    @user = User.new(params.require(:user).permit(:email, :name, :password))
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Welcome to Reddit for Resources!"
      redirect_to tools_path
    else
      render "new"
    end
  end

end
