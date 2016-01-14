class ProductsController < ApplicationController


  def all_products
    @products = Product.all
  end

  def beer
    @product = Product.last
  end




end
