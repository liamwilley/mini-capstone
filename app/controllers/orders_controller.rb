class OrdersController < ApplicationController

  def create
    quantity = params[:quantity].to_i
    product = Product.find_by(id: params[:product_id])
    subtotal = product.price * quantity
    tax = product.tax * quantity
    total = subtotal + tax

    order = Order.new(quantity: quantity, product_id: product_id, user_id: current_user.id, subtotal: subtotal, tax: tax, total: total)
    if order.save
      flash[:success] = "Order created!"
      redirect_to "/orders/#{order.id}"
    else
      flash[:danger] = "Order not completed. You're not cool enough."
      redirect_to = "/products/#{product.id}"

  end

  def show
    order = Order.find_by
  end

end
