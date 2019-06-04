class Place < ApplicationRecord
  belongs_to :user
  has_many :place_photos, dependent: :destroy
  accepts_nested_attributes_for :place_photos

  validates :user_id, presence: true
  validates :category, presence: true
  validates :dogginess_scale, presence: true, numericality: true, inclusion: { in: 1..5 }
end
