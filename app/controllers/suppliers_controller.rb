class SuppliersController < ApplicationController
  
  def new
  end

  def create
    @supplier = Supplier.create({name: params[:name], email: params[:email], phone: params[:phone]})

    flash[:success] = "New Employee Created!"
    redirect_to "/suppliers"
  end
end
