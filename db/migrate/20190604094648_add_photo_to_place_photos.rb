class AddPhotoToPlacePhotos < ActiveRecord::Migration[5.2]
  def change
    add_column :place_photos, :photo, :string
  end
end
