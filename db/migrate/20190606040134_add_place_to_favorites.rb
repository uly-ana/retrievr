class AddPlaceToFavorites < ActiveRecord::Migration[5.2]
  def change
    add_reference :favorites, :place, foreign_key: true
  end
end
