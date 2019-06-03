class DropGuestListTable < ActiveRecord::Migration[5.2]
  def change
    drop_table :guest_lists
  end
end
