class RemovePostalCodeFromTransactions < ActiveRecord::Migration[7.0]
  def change
    remove_column :transactions, :postal_code, :string
  end
end
