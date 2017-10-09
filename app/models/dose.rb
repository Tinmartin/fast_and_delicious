class Dose < ApplicationRecord
  belongs_to :ingredient
  belongs_to :recipe

  validates :ingredient, uniqueness: {scope: :recipe}
  validates :recipe, :ingredient, presence: true
end




