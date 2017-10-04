class Recipe < ApplicationRecord
  has_many :ingredients, through: :doses
  has_many :doses, dependent: :destroy

  validates :name, uniqueness: true
  validates :name, presence: true

  mount_uploader :photo, PhotoUploader
end
