class SessionsController < ApplicationController
  def new
    @user = User.new
    @users = User.all
  end

  def create
    if user_signed_in?
      redirect_to user_path(current_user)
    else
      user = User.find(params[:user][:id])
      if user
        session[:user_id] = user.id
        redirect_to user_path(user)
      else
        redirect_to signin_path
      end
    end
  end

  def destroy
    session.delete :user_id
    redirect_to root_path
  end
end