class ChangeDataTypeOfPaymentLinkId < ActiveRecord::Migration[7.0]
  def change
    change_column :users, :payment_link_id, :string, default: "pi_3MopBrFXuS2Lu4ak23iBe0ED"
  end
end
