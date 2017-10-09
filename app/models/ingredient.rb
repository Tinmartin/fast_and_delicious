# class Ingredient < ApplicationRecord
#   # include PgSearch

#   has_many :doses
#   has_many :recipes, through: :doses
#   # multisearchable against: [:name]

#   mount_uploader :picture, PhotoUploader
# end


# working on Algolia

class Ingredient < ApplicationRecord
  # include PgSearch
  include AlgoliaSearch

  has_many :doses
  has_many :recipes, through: :doses


  mount_uploader :picture, PhotoUploader


  algoliasearch per_environment: true do
    attribute :name
    #add_attribute :ingredient_doses
    add_attribute :ingredient_recipes
  end

 def ingredient_recipes
    self.doses.map { |d| d.recipe }
  end

end

