class ProductsController < ApplicationController
  def index
    @products = Product.all

  end
  def show
  	@product = Product.find(params[:id])
  	@order_item = current_order.order_items.new
  end
end
