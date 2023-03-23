class AddPostalcodeToTransactions < ActiveRecord::Migration[7.0]
  def change
    add_column :transactions, :postal_code, :string
  end
end
