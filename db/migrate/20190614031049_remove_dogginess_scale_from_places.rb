class RemoveDogginessScaleFromPlaces < ActiveRecord::Migration[5.2]
  def change
    remove_column :places, :dogginess_scale
  end
end
