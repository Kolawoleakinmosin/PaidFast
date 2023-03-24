class AddCustomerEmailToTransactions < ActiveRecord::Migration[7.0]
  def change
    add_column :transactions, :customer_email, :string
  end
end
