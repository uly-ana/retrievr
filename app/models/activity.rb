class Activity < ApplicationRecord
  belongs_to :owner, class_name: 'User', foreign_key: :owner_id
  # belongs_to :place
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
  validates :date, presence: true
  validates :category, presence: true
  validates :limit, presence: true
  validate :not_blank_date

  private

  def not_blank_date
    if !date.nil?
      errors.add(:date, "can't be in the past") if date.to_date < Date.today

    end
  end
end

