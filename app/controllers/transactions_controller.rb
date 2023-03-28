class TransactionsController < ApplicationController
  def index
    @transactions = Transaction.order("timestamp DESC").all
  end

  def show
   @transaction = Transaction.find(params[:id])
  end
end
