class Ingredient < ApplicationRecord

  # include AlgoliaSearch

  has_many :doses
  has_many :recipes, through: :doses

  validates :name, uniqueness: true


  mount_uploader :picture, PhotoUploader


  # algoliasearch do
  #   attribute :name
  #   add_attribute :ingredient_recipes
  #   searchableAttributes  ["name"]
  # end


 def ingredient_recipes
    self.doses.map { |d| d.recipe }.uniq
  end

end

