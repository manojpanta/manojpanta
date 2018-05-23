class Idea < ApplicationRecord
  validates :content, presence: true
  validates :title, presence: true
  belongs_to :category
  belongs_to :user
  has_many :idea_images
  has_many :images, through: :idea_images , dependent: :destroy
end
