class Ingredient < ApplicationRecord

  has_many :doses
  has_many :recipes, through: :doses


  validates :name, uniqueness: true
  validates :name, presence: true
  validates :picture, presence: true
  validates :can_change, presence: true

  mount_uploader :picture, PhotoUploader

end

