class StripeCheckoutSessionService
  def call(event)
    params = event['data']['object']
    customer_email = params['customer_details']['email']
    # user = User.find_by(email: customer_email)
    user = User.find_by(payment_link_id: params["payment_link"])
    # user = User.find_by(stripe_customer_id: params['customer'])
    amount = params['amount_total']
    transaction = Transaction.new(
      user: user,
      checkout_session_id: params['id'],
      timestamp: Time.now,
      price_cents: amount,
      customer_name: params['customer_details']['name'],
      customer_email: customer_email,
      status: 'success'
    )

    transaction.save
    p transaction.errors.full_messages
  end
end
