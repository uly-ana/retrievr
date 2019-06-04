class CreatePlacePhotos < ActiveRecord::Migration[5.2]
  def change
    create_table :place_photos do |t|
      t.references :place, foreign_key: true

      t.timestamps
    end
  end
end
