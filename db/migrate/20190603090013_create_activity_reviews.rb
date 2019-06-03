class CreateActivityReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :activity_reviews do |t|
      t.integer :rating
      t.text :content
      t.references :user, foreign_key: true
      t.references :activity, foreign_key: true

      t.timestamps
    end
  end
end
