class RenameUserColumnInActivities < ActiveRecord::Migration[5.2]
  def change
    remove_column :activities, :user_id
    add_reference :activities, :owner, foreign_key: { to_table: :users }
  end
end
