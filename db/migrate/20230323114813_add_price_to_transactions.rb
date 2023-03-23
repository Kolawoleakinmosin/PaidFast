class AddPriceToTransactions < ActiveRecord::Migration[7.0]
  def change
    add_monetize :transactions, :price, currency: { present: false }
  end
end
