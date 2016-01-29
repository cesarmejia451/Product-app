class OrdersController < ApplicationController
  
  def show
    @order = Order.find(params[:id])
  end

  def create

    price = Product.find(params[:product_id]).price

    @order = Order.new({user_id: current_user.id, quantity: params[:quantity], product_id: params[:product_id]})

    @order.subtotal = @order.calc_subtotal(price)
    @order.tax      = @order.calc_tax(0.09)
    @order.total    = @order.calc_total

    @order.save

    flash[:success] = "Your order has been completed!"
    redirect_to "/orders/#{@order.id}"
  end


end
