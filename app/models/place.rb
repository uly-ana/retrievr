class Place < ApplicationRecord
  belongs_to :user
  has_many :place_photos, dependent: :destroy
  has_many :place_reviews, dependent: :destroy
  has_many :activities, dependent: :destroy
  
  accepts_nested_attributes_for :place_photos

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  validates :user_id, presence: true
  validates :category, presence: true
  validates :dogginess_scale, presence: true, numericality: true, inclusion: { in: 1..5 }

  def avg_rating

  end
end
