class RemoveAmountFromTransactions < ActiveRecord::Migration[7.0]
  def change
    remove_column :transactions, :amount, :integer
  end
end
