class AddDogsizeToDogs < ActiveRecord::Migration[5.2]
  def change
    add_column :dogs, :dog_size, :string
  end
end
