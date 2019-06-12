class RemoveDateFromActivities < ActiveRecord::Migration[5.2]
  def change
    remove_column :activities, :date, :string
  end
end
