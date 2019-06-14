class AddDogginessScaleToPlaces < ActiveRecord::Migration[5.2]
  def change
    add_column :places, :dogginess_scale, :string
  end
end
