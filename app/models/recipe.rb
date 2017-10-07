class Recipe < ApplicationRecord


  searchkick

  has_many :ingredients, through: :doses
  has_many :doses, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :favorites, dependent: :destroy

  validates :name, uniqueness: true
  validates :name, presence: true
  mount_uploader :picture, PhotoUploader

<<<<<<< HEAD
  def self.search(search)
   where("name LIKE ?", "%#{search}%")
 end
=======
>>>>>>> 4c2609fabefab1d5779ea7fa90fa0d2731a42f89

  include PgSearch

  # def self.search(search)
  #   where("name LIKE ?", "%#{search}%")
  # end


  multisearchable against: [:name, :description]
  pg_search_scope :global_search,
<<<<<<< HEAD
  against: [ :name ],
  associated_against: {
   ingredients: [ :name]
 }

 def favorited?
    favorited_at = false
  end

  def favorite
    self.favorited_at = true
  end

  def favorite!
    favorite
    save!
  end

  def unfavorite
    self.favorited_at = false
  end

  def unfavorite!
    unfavorite
    save!
  end
=======
     against: [ :name ],
     associated_against: {
       ingredients: [ :name]
     }

<<<<<<< HEAD


  # def self.search(query)
  #   __elasticsearch__.search(
  #     {
  #       query: {
  #         multi_match: {
  #           query: query,
  #           fields: ['name']
  #         }
  #       },
  #       highlight: {
  #         pre_tags: ['<mark>'],
  #         post_tags: ['</mark>'],
  #         fields: {
  #           name: {},
  #         }
  #       },

  #       suggest: {
  #         text: query,
  #         name: {
  #           term: {
  #             size: 1,
  #             field: :name
  #           }
  #         }
  #       }
  #     }
  #   )
  # end


>>>>>>> 4c2609fabefab1d5779ea7fa90fa0d2731a42f89
=======
>>>>>>> a957e65616ca6f8ff691a68af0a4618511f404ea
end

