class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user  #can only be called in views and controllers - not models

  def current_user
    User.find_by(id: session[:user_id]) if session[:user_id]
  end



end
