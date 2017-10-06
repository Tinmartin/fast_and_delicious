class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :recipe
  has_many :recipes

end
