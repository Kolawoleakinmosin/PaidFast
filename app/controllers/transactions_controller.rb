class TransactionsController < ApplicationController
  def index
    @transactions = current_user.transactions.order("timestamp DESC")
    @transactions = policy_scope(Transaction)
  end

  def show
    @transaction = Transaction.find(params[:id])
  end
end
