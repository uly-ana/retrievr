class Activity < ApplicationRecord
  belongs_to :owner, class_name: 'User', foreign_key: :owner_id
  belongs_to :place, optional: true
  has_many :activity_photos, dependent: :destroy
  has_many :activity_reviews, dependent: :destroy
  has_many :guests
  has_many :users, through: :guests
  has_many :favorites

  monetize :price_cents

  accepts_nested_attributes_for :activity_photos

  validates :price, presence: true
  validates :name, presence: true
  validates :address, presence: true
  validates :description, presence: true, length: { minimum: 20 }
  # validates :date, presence: true
  validates :category, presence: true
  validates :limit, presence: true
  validates :dog_size, presence: true, inclusion: { in: ['Toy - up to 12 pounds', 'Small - 12 to 25 pounds', 'Medium - 25 to 50 pounds', 'Large - 50 to 100 pounds', 'Extra Large - over 100 pounds'] }
  # validate :not_blank_date

  private

  def not_blank_date
    if !time.nil?
      errors.add(:time, "Can't be in the past") if time < DateTime.now
    end
  end
end

