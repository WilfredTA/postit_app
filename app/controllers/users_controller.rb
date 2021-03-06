class UsersController < ApplicationController
  before_action :setup_user, only: [:edit, :update, :show]
  before_action :require_same_user, only: [:edit, :update]
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "You are successfully registered"
      redirect_to root_url
    else
      render 'new'
    end
  end

  def show

  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:notice] = "Profile successfully udpated!"
      redirect_to user_path @user
    else
      render 'edit'
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end

  def setup_user
    @user = User.find(params[:id])
  end

  def require_same_user
    if current_user != @user
      flash[:error] = "You're not allowed to do that!"
      redirect_to root_url
    end
  end
end
