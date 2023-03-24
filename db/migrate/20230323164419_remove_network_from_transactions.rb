class RemoveNetworkFromTransactions < ActiveRecord::Migration[7.0]
  def change
    remove_column :transactions, :network, :string
  end
end
