class Recipe < ApplicationRecord
  include PgSearch

  has_many :ingredients, through: :doses
  has_many :doses, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :favorites, dependent: :destroy

  validates :name, uniqueness: true
  validates :name, presence: true
  mount_uploader :picture, PhotoUploader

  def self.search(search)
   where("name LIKE ?", "%#{search}%")
  end

  # multisearchable against: [:name, :description]
  pg_search_scope :global_search,
     against: [ :name, :description ],
     associated_against: {
       ingredients: [ :name]
     }
end

