class SessionsController < ApplicationController
  def new

  end

  def create
    user = User.where(username: params[:username]).first

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:notice] = "Welcome to PostIt!"
      redirect_to root_url
    else
      flash.now[:error] = "There is something wrong with your username or password"
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "You have logged out"
    redirect_to root_url
  end

end
