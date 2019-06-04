class User < ApplicationRecord
  has_many :dogs, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :activity_reviews, dependent: :destroy
  has_many :places, dependent: :destroy
  has_many :activities, class_name: 'Activity', foreign_key: :owner_id

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :bio, length: { minimum: 10 }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
