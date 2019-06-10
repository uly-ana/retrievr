class AddTimestampsToPlaceReviews < ActiveRecord::Migration[5.2]
  def change
    add_column :place_reviews, :created_at, :datetime
    add_column :place_reviews, :updated_at, :datetime
  end
end
