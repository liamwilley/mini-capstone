class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :human_date_and_time  #can only be called in views and controllers - not models
  before_action :count_carted_products


  def current_user
    User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def human_date_and_time(date)
    date.strftime("%b %e, %l:%M %p")
  end

  def authenticate_admin!
    unless current_user && current_user.authenticate_admin
      #do nothing
      flash[:danger] = "Get out of my code you damn crazy kids!"
      redirect_to "/"
    end
  end

  def authenticate_user!
    unless current_user
      flash[:info] = "Please sign in or sign up to order!"
      redirect_to "/login"
    end
  end

  def count_carted_products
    if current_user && current_user.orders.find_by(completed: false)
      if session[:cart_count]
        @cart_count = session[:cart_count]
      else
        @total_carted_products = 0
        current_user.orders.find_by(completed: false).carted_products.each do |carted_product|
        @cart_count += carted_products.quantity
      end
      session[:cart_count] = @cart_count
    end
  end
end
