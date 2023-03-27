class ProductsController < ApplicationController

  def index
  end
  def create
    @product = Stripe::Product.create(
      name: name,
      description: description
    )
    
    @product.save
  end
end
