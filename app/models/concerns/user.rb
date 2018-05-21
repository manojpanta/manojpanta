class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true
  validates :title, presence: true
end
