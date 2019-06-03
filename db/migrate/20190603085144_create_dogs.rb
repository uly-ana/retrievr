class CreateDogs < ActiveRecord::Migration[5.2]
  def change
    create_table :dogs do |t|
      t.string :photo
      t.text :my_story
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
