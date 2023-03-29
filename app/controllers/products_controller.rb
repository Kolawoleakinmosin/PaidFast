class ProductsController < ApplicationController
  before_action :set_stripe_api_key

  def new
    @product = Product.new
    authorize @product
  end

  def create
    @product = Product.new(product_params)
    @product.photo.attach(product_params[:photo])

    @product.user = current_user
    authorize @product
    @product.save
    stripe_product = Stripe::Product.create(
      name: @product.name,
      description: @product.description,
      currency: @product.currency,
      images: [@product.photo.url]
    )

    @product.update(stripe_product_id: stripe_product.id)
    stripe_price = Stripe::Price.create({
      custom_unit_amount: {
        enabled: true
      },
      currency: 'eur',
      product: @product.stripe_product_id
    })

    stripe_payment_link = Stripe::PaymentLink.create({
      line_items: [
        {
          price: stripe_price.id,
          quantity: 1
        }
      ]
    })

    @product.update(payment_link_url: stripe_payment_link.url)


    redirect_to qr_code_path, notice: "Product listing was successfully created."
  end

  def payment_link
    Stripe::PaymentLink.create({
      line_items: [
        {
          price: 'price_1MqDD8FXuS2Lu4akfqL3mMm9',
          quantity: 1
        }
      ]
    })
  end

  private

  def set_stripe_api_key
    Stripe.api_key = ENV['STRIPE_SECRET_KEY']
  end

  def product_params
    params.require(:product).permit(:name, :description, :photo)
  end
end
