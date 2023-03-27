class AddFirstNameLastNameBusinessNameToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :business_name, :string
  end
end
