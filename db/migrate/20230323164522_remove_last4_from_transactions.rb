class RemoveLast4FromTransactions < ActiveRecord::Migration[7.0]
  def change
    remove_column :transactions, :last4, :integer
  end
end
