class StripeCheckoutSessionService
  def call(event)
    transaction = Transaction.create(checkout_session_id: event.data.object.id)
  end
end
