class CreateTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions do |t|
      t.timestamp :timestamp
      t.integer :amount
      t.boolean :status
      t.string :customer_name
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
