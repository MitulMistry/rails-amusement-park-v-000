class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :user_signed_in? #defines method to be available in views
  helper_method :current_user

  private
  def user_signed_in?
    !!session[:user_id] #forces boolean
  end

  def current_user
    User.find(session[:user_id]) if session[:user_id]
  end
end
