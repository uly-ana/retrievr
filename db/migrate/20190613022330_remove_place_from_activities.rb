class RemovePlaceFromActivities < ActiveRecord::Migration[5.2]
  def change
    remove_column :activities, :place_id
  end
end
