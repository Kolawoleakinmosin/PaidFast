class RemoveStatusFromTransactions < ActiveRecord::Migration[7.0]
  def change
    remove_column :transactions, :status, :boolean
  end
end
