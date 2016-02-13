class SessionsController < ApplicationController
  def new
  end

  def create
    if current_user #already logged in
      redirect_to user_path(current_user)
    else
      user = User.find_by(name: params[:name])
      session[:user_id] = user.id
      redirect_to user_path(user)
    end
  end

  def destroy
    session.delete :user_id
    redirect_to root_path
  end
end