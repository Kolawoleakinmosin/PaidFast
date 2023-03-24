class RemovePhoneFromTransactions < ActiveRecord::Migration[7.0]
  def change
    remove_column :transactions, :phone, :string
  end
end
