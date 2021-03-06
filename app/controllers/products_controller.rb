class ProductsController < ApplicationController


  def index
    @products = Product.all

    if params[:sort] && params[:sort_order]
      @products = @products.order(params[:sort] => params[:sort_order])
    end
    if params[:discount]
      @products = @products.where("price < ?", params[:discount])
    end

    if params[:category]
      @products = Category.find_by(name: params[:category]).products
    end

    
  end

  def beer
    @product = Product.last
  end

  def show
    @product = Product.find(params[:id])
    @supplier = @product.supplier


  end

  def new
  end

  def create
    @product = Product.create({name: params[:name], price: params[:price], supplier_id: params[:supplier][:supplier_id], description: params[:description]})

    Image.create(url: params[:image], product_id: @product.id) if params[:image] != ""

    flash[:success] = "New Employee Created!"
    redirect_to "/products"
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update


    @product = Product.find(params[:id])

    @product.update({name: params[:name], price: params[:price], supplier_id: params[:supplier][:supplier_id], description: params[:description]})

    Image.create(url: params[:image], product_id: @product.id) if params[:image] != ""

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

  def random
    @product = Product.all.sample
    render :show
  end

  def search
    @products = Product.where("name LIKE ? OR description LIKE ?", "%#{params[:search]}%", "%#{params[:search]}%")
    render :index

  end

end


