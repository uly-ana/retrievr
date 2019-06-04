class AddPhotoToActivityPhotos < ActiveRecord::Migration[5.2]
  def change
    add_column :activity_photos, :photo, :string
  end
end
