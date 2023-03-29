class AddCardDetailsToTransactions < ActiveRecord::Migration[7.0]
  def change
    add_column :transactions, :card_last4, :string
    add_column :transactions, :card_postal_code, :string
    add_column :transactions, :card_country, :string
    add_column :transactions, :card_brand, :string
  end
end
