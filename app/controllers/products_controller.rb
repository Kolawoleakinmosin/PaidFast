class ProductsController < ApplicationController
  def create
    @product = Stripe::Product.create({name: "Golden Burger"})
  end
end
