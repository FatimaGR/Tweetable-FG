class User < ApplicationRecord
  # Validations
  validates :email, :username, presence: true, uniqueness: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+.)+[a-z]{2,})\z/ }
  validates :name, presence: true
  validates :password, length: { minimum: 6 }

  # Associations
  has_many :tweets, dependent: :destroy
  has_one_attached :avatar

  # Bcrypt
  has_secure_password
end
