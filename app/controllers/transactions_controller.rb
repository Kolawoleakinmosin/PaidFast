class TransactionsController < ApplicationController
  def index
    @transactions = policy_scope(Transaction).order("timestamp DESC")
  end

  def show
    @transaction = Transaction.find(params[:id])
    authorize @transaction
  end
end
