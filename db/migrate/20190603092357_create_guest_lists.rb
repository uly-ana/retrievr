class CreateGuestLists < ActiveRecord::Migration[5.2]
  def change
    create_table :guest_lists do |t|
      t.references :activity, foreign_key: true

      t.timestamps
    end
  end
end
