class User < ApplicationRecord
  has_secure_password
  validates :name, presence: true
  validates :email, format: { with: /(\S+)@(\S+)/ }
  validates :email, uniqueness: true
  has_many :registrations, dependent: :nullify # Prevents deletion of user if they have registrations
  has_many :events, through: :registrations # Allows user.events to return events they are registered for
end
