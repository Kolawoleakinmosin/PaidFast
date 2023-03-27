class AddPaymentLinkUrlToProducts < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :payment_link_url, :string
  end
end
