class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true
  validates :password, presence: true
  has_many :ideas, dependent: :destroy
  has_secure_password
  enum role: %i[default admin]
end
