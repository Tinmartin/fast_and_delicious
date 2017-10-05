class Ingredient < ApplicationRecord
  has_many :doses
  has_many :recipes, through: :doses
end
