class OrdersController < ApplicationController
  
  def show
    @order = Order.find(params[:id])
  end

  def create
    @order = Order.create({user_id: current_user.id, quantity: params[:quantity], product_id: params[:product_id]})


    flash[:success] = "Your order has been completed!"
    redirect_to "/orders/#{@order.id}"

  end


end
