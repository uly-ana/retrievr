class AddUsersToGuestList < ActiveRecord::Migration[5.2]
  def change
    add_reference :guest_lists, :user, foreign_key: true
  end
end
