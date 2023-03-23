class AddLast4ToTransactions < ActiveRecord::Migration[7.0]
  def change
    add_column :transactions, :last4, :integer
  end
end
