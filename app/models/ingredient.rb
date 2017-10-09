class Ingredient < ApplicationRecord
  # include PgSearch

  has_many :doses
  has_many :recipes, through: :doses
  # multisearchable against: [:name]

  mount_uploader :picture, PhotoUploader
end



