class Place < ApplicationRecord
  belongs_to :user

  validates :user_id, presence: true
  validates :category, presence: true
  validates :dogginess_scale, presence: true, numericality: true, inclusion: { in: 1..5 }
end
