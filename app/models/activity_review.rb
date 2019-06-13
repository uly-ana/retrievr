class ActivityReview < ApplicationRecord
  belongs_to :user
  belongs_to :activity

  validates :rating, presence: true, inclusion: { in: 0..5 }
  # validates :content, length: { minimum: 10 }
  validates :user_id, presence: true
end
