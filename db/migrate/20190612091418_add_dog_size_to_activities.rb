class AddDogSizeToActivities < ActiveRecord::Migration[5.2]
  def change
    add_column :activities, :dog_size, :string
  end
end
