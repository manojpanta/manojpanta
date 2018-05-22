class Image < ApplicationRecord
  validates :url, presence: true
  validates :title, presence: true
  has_many :ideas_images
  has_many :ideas, through: :ideas_images
end
