class AddPhoneToTransactions < ActiveRecord::Migration[7.0]
  def change
    add_column :transactions, :phone, :string
  end
end
