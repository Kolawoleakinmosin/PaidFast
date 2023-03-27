class RemoveTransactionIdFromProducts < ActiveRecord::Migration[7.0]
  def change
    remove_reference :products, :transaction, null: false, foreign_key: true
  end
end
