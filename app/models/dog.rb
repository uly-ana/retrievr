class Dog < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  belongs_to :user
  validates :my_story, length: { minimum: 20 }
  validates :name, presence: true
  validates :breed, presence: true
  validates :user_id, presence: true
  validates :dog_size, presence: true, inclusion: { in: ['Toy - up to 12 pounds', 'Small - 12 to 25 pounds', 'Medium - 25 to 50 pounds', 'Large - 50 to 100 pounds', 'Extra Large - over 100 pounds'] }
end
