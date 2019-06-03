class AddLimitToActivities < ActiveRecord::Migration[5.2]
  def change
    add_column :activities, :limit, :integer
  end
end
