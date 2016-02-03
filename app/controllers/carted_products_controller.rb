class CartedProductsController < ApplicationController
  
  def index
    if user_signed_in? && CartedProduct.where(status: "Carted", user_id: current_user.id).any?
      @carted_products = CartedProduct.where(status: "Carted", user_id: current_user.id)
    else
      flash[:warning] = "You should try adding products to your cart"
      redirect_to "/products"
    end
  end

  def create

    @carted_products = CartedProduct.create({user_id: current_user.id, product_id: params[:product_id], quantity: params[:quantity], status: "Carted"})

    
    flash[:success] = "Your cart has been updated!"
    redirect_to "/carted_products"
    
  end
end
