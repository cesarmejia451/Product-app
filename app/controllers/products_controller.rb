class ProductsController < ApplicationController


  def index
    @products = Product.all
  end

  def beer
    @product = Product.last
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
  end

  def create
    @product = Product.create({name: params[:name], price: params[:price], image: params[:image], description: params[:description]})

    flash[:success] = "New Employee Created!"
    redirect_to "/products"
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])

    @product.update({name: params[:name], price: params[:price], image: params[:image],description: params[:description]})

    flash[:success] = "Inventory Updated!"
    redirect_to "/products/#{@product.id}"

  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    flash[:success] = "Beer was successfully removed from the inventory"
    flash[:warning] = "This beer is removed!"
    redirect_to "/products"


  end

end
