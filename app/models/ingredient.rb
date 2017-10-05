class Ingredient < ApplicationRecord
  has_many :doses
  has_many :recipes, through: :doses

  mount_uploader :picture, PhotoUploader
end
