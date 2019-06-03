class CreateActivities < ActiveRecord::Migration[5.2]
  def change
    create_table :activities do |t|
      t.string :address
      t.text :description
      t.date :date
      t.string :photo
      t.float :latitude
      t.float :longitude
      t.string :category
      t.references :user, foreign_key: true
      t.references :place, foreign_key: true

      t.timestamps
    end
  end
end
