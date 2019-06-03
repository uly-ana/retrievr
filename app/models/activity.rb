class Activity < ApplicationRecord
  belongs_to :owner, class_name: 'User', foreign_key: :owner_id
  belongs_to :place
  has_many :guests
  has_many :users, through: :guests
  monetize :price_cents

  validates :address, presence: true
  validates :description, presence: true, length: { minimum: 20 }
  # validates :date, presence: true
  validates :category, presence: true
  validates :limit, presence: true
end
