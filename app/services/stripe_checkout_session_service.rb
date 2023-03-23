class StripeCheckoutSessionService
  def call(event)
    # puts "hello world"
    p event
    # puts params
    user = User.find_by(payment_link_id: "test")
    # user = User.find(params[:data][:previous_attributes][:metadata])
    # user = User.find(1)
    # network = params["payment_method_details"].nil? ? "mastercard" : params["payment_method_details"]["network"]

    # transaction = Transaction.new(user: user, checkout_session_id: event.data.object.id,
    # price: event.data.object.amount_total, phone: params["data"]["phone"], network: network, last4: params["payment_method_details"]["last4"], status: params["payment_method_details"]["status"], postal_code: params["billing_details"]["address"]["postal_code"])

    # transaction.save
    # p transaction.errors.full_messages
    # puts params["data"]["object"]["amount"]

  end
end
