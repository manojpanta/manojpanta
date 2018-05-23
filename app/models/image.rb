class Image < ApplicationRecord
  validates :url, presence: true
  validates :title, presence: true
  has_many :idea_images
  has_many :ideas,  through: :idea_images, dependent: :destroy 
end
