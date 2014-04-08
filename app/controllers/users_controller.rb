class UsersController < ApplicationController

  before_action :login_required, except: [:new, :create]

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
      flash[:notice] = "Welcome to Dev Spades!"
      redirect_to tools_path
    else
      render "new"
    end
  end

end
