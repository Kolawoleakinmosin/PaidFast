class AddNetworkToTransactions < ActiveRecord::Migration[7.0]
  def change
    add_column :transactions, :network, :string
  end
end
