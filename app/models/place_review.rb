class PlaceReview < ApplicationRecord
  belongs_to :user
  belongs_to :place

  validates :rating, presence: true, inclusion: { in: 0..5 }
  validates :content, length: { minimum: 10 }
  validates :user_id, presence: true, uniqueness: true
end
