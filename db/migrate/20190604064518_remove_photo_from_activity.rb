class RemovePhotoFromActivity < ActiveRecord::Migration[5.2]
  def change
    remove_column :activities, :photo
    remove_column :places, :photo
  end
end
