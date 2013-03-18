class ApplicationController < ActionController::Base
  protect_from_forgery

  def current_user
      temp_user = User.where(id: session[:current_user_id])
      if temp_user.exists?
      @user = temp_user.first
      else
      @user = User.new
      end
  end

  def user_logged_in?
      ! session[:current_user_id].nil?
  end

  def logged_in_user
      User.find session[:current_user_id]  if user_logged_in?
  end
end
