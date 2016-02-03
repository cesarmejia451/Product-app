class OrdersController < ApplicationController
  
  def show
    @order = Order.find(params[:id])
  end

  def create

    carted_products = CartedProduct.where(status: "Carted", user_id: current_user.id)

    subtotal = 0

    carted_products.each do |carted_product|
      subtotal += carted_product.product.price * carted_product.quantity
    end

    tax = subtotal * 0.09
    total = subtotal + tax

    order = Order.create(user_id: current_user.id, subtotal: subtotal, tax: tax, total: total)

    carted_products.each do |carted_product|
      carted_product.update(order_id: order.id, status: "Purchased")
    end



    # price = Product.find(params[:product_id]).price

    # @order = Order.new({user_id: current_user.id, quantity: params[:quantity], product_id: params[:product_id]})

    # @order.subtotal = @order.calc_subtotal(price)
    # @order.tax      = @order.calc_tax(0.09)
    # @order.total    = @order.calc_total

    # @order.save

    flash[:success] = "Your order has been completed!"
    redirect_to "/orders/#{order.id}"
  end


end
