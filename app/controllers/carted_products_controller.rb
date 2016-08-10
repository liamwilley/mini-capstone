class CartedProductsController < ApplicationController
  before_action :authenticate_user! 



  def create
    # order = current_user.orders.find_by(completed: :false) || Order.create(user_id: current_user.id, completed: false)

    order = current_user.orders.find_by(completed: :false)

    if order == nil
      order = Order.new(user_id: current_user.id, completed: false)
    end

    carted_product = CartedProduct.new(product_id: params[:product_id], quantity: params[:quantity], order_id: order.id)
    if carted_product.save
      redirect_to "/carted_products"
      flash[:success] = "Products have been added to your cart"
    else
      flash[:danger] = "Product not added. Something went wrong"
      redirect_to "/products/#{params[:product_id]}"
    end

    # marks code above mine below

    if current_user
      if order = Order.find_by(completed: :false)
        cart_product = CartedProduct.new(product_id: params[:product_id], order_id: order.id, quantity: params[:quantity])
      else
        order = Order.new(user_id: current_user.id, completed: false)
        order.save
      end
      redirect_to "/carted_products"
    else
      redirect_to "/login"
    end 
  end

  def index
    # if current_user
    #   @carted_products = CartedProduct.where(order_id: params[:order_id])

    order = current_user.orders.find_by(completed: false)
    if !order
      flash[:info] = "You don't have any items in your cart."
      redirect_to "/"
    end
    @carted_products = order.carted_products
      # @carted_products = Order.find(params[:id]).carted_products 

      # @carted_products = current_user.orders.find_by(completed: false).carted_products #check for the rest of mark code
  end

  def destroy
    carted_product = CartedProduct.find_by(id: params[:id]).destroy
    flash[:warning] = "You removed #{carted_product.product.name}"
    session[:cart_count] = nil
    redirect_to "/carted_products"
  end


end
