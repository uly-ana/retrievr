class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :activity
  belongs_to :place

  validates :user_id, presence: true
  validates :activity_id, presence: true
end
