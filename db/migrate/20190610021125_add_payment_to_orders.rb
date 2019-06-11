class AddPaymentToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :activity_sku, :string
    add_column :orders, :payment, :jsonb
  end
end
