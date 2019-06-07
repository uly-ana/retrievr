class CreatePlaceReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :place_reviews do |t|
      t.integer :rating
      t.text :content
      t.references :user, foreign_key: true
      t.references :place, foreign_key: true
    end
  end
end
