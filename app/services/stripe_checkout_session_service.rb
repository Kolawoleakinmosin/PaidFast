class StripeCheckoutSessionService
  def call(event)
    user = User.find_by(payment_link_id: params[:data][:object][:id])
    # user = User.find(params[:data][:previous_attributes][:metadata])
    Transaction.create(user: user, checkout_session_id: event.data.object.id, amount: params)
  end
end
