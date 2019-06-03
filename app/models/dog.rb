class Dog < ApplicationRecord
  belongs_to :user
  validates :my_story, length: { minimum: 20 }
  validates :name, presence: true
  validates :user_id, presence: true
end
