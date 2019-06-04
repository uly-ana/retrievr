class Activity < ApplicationRecord
  belongs_to :owner, class_name: 'User', foreign_key: :owner_id
  has_one :place
  has_many :activity_photos
  has_many :guests
  has_many :users, through: :guests
  monetize :price_cents

  validates :name, presence: true
  validates :address, presence: true
  validates :description, presence: true, length: { minimum: 20 }
  validates :date, presence: true
  validates :category, presence: true
  validates :limit, presence: true
end
