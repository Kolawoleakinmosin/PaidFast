class ProductsController < ApplicationController
  before_action :set_stripe_api_key

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    stripe_product = Stripe::Product.create(
      name: @product.name,
      description: @product.description,
      currency: @product.currency
    )
    @product.user = current_user

    @product.stripe_product_id = stripe_product.id

    stripe_price = Stripe::Price.create({
      custom_unit_amount: {
        enabled: true
      },
      currency: 'eur',
      product: @product.stripe_product_id
    })

    Stripe::PaymentLink.create({
      line_items: [
        {
          price: stripe_price.id,
          quantity: 1
        }
      ]
    })

    @product.payment_link_url = Stripe::PaymentLink.create({
      line_items: [
        {
          price: stripe_price.id,
          quantity: 1
        }
      ]
    })

    @product.save
    redirect_to qr_code_path, notice: "Product listing was successfully created."
  end

  def payment_link
    Stripe::PaymentLink.create({
      line_items: [
        {
          price: 'price_1MqDD8FXuS2Lu4akfqL3mMm9',
          quantity: 1,
        },
      ],
    })
  end


  private

  def set_stripe_api_key
    Stripe.api_key = ENV['STRIPE_SECRET_KEY']
  end

  def product_params
    params.require(:product).permit(:name, :description)
  end
end
