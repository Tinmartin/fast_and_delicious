class Recipe < ApplicationRecord
  include AlgoliaSearch

  has_many :ingredients, through: :doses
  has_many :doses, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :favorites, dependent: :destroy

  validates :name, uniqueness: true
  validates :name, presence: true
  mount_uploader :picture, PhotoUploader

   algoliasearch per_environment: true do
    attribute :name
    attribute :picture
    attribute :ingredients
    searchableAttributes ['ingredients']
  end

  def inline_ingredients
    ingredients.to_a.map(&:name).join(' ')
  end
end





