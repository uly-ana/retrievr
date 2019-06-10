class AddSkuToActivities < ActiveRecord::Migration[5.2]
  def change
    add_column :activities, :sku, :string
  end
end
