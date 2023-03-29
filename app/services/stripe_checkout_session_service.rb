class StripeCheckoutSessionService
  def call(event)
    params = event['data']['object']
    customer_email = params['customer_details']['email']
    user = User.find_by(stripe_customer_id: params['customer'])
    amount = params['amount_total']

    payment_intent = Stripe::PaymentIntent.retrieve(params['payment_intent'], { expand: ['payment_method'] })
    last4 = payment_intent['payment_method']['card']['last4']
    postal_code = payment_intent['payment_method']['billing_details']['address']['postal_code']
    country = payment_intent['payment_method']['billing_details']['address']['country']
    card_brand = payment_intent['payment_method']['card']['brand']


    transaction = Transaction.new(
      user: user,
      checkout_session_id: params['id'],
      timestamp: Time.now,
      price_cents: amount,
      customer_name: params['customer_details']['name'],
      customer_email: customer_email,
      status: 'success',
      card_last4: last4,
      card_postal_code: postal_code,
      card_country: country,
      card_brand: card_brand
    )

    transaction.save
    p transaction.errors.full_messages
  end
end
