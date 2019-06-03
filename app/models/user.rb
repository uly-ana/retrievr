class User < ApplicationRecord
  has_many :dogs
  has_many :favorites
  has_many :activity_reviews
  has_many :places
  has_many :activities, class_name: 'Activity', foreign_key: :owner_id

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :username, presence: true, uniqueness: true
  validates :bio, length: { minimum: 10 }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
