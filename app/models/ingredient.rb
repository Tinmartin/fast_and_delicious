class Ingredient < ApplicationRecord
  include AlgoliaSearch

  has_many :doses
  has_many :recipes, through: :doses


  validates :name, uniqueness: true
  validates :name, presence: true
  validates :picture, presence: true

  validates :can_change, presence: true


  mount_uploader :picture, PhotoUploader

  algoliasearch per_environment: true do
    attribute :name
    attribute :picture
    add_attribute :ingredient_recipes
    searchableAttributes  ["name"]
  end

 def ingredient_recipes
    self.doses.map { |d| d.recipe }.uniq
  end

end

