class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    return redirect_to new_user_path unless user.save
    session[:user_id] = user.id
    redirect_to user_path(user)
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def user_params
    params.require(:user).permit(:name, :happiness, :nausea, :height, :tickets, :admin)
  end
end