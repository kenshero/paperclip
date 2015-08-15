class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product =  Product.new(product_params)
    if @product.save 
      redirect_to products_path
    else
      render 'new'
    end
  end

  def destroy
    @product = Product.find(params[:id])
    if @product.destroy
      redirect_to products_path
    else
      render 'products'
    end
  end

  private
    def product_params
      params.require(:product).permit(:name, :logo)
    end

end
