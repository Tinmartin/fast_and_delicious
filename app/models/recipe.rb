# require 'elasticsearch/model'

class Recipe < ApplicationRecord

  #configuring Elastic Search
  # include Elasticsearch::Model
  # include Elasticsearch::Model::Callbacks

  # # index_name Rails.application.class.parent_name.underscore
  # # document_type self.name.downcase
  # settings index: { number_of_shards: 1 } do
  #   mapping dynamic: 'false' do
  #     indexes :name, analyzer: 'english'
  #     # indexes :ingredients do
  #     #   indexes :name, analyzer: 'english'
  #     # end
  #   end
  # end

  # def self.search(query)
  # __elasticsearch__.search(
  #   {
  #     query: {
  #       multi_match: {
  #         query: query,
  #         fields: ['name^10']
  #       }
  #     }
  #   }
  # )
  # end


  searchkick

  has_many :ingredients, through: :doses
  has_many :doses, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :favorites, dependent: :destroy

  validates :name, uniqueness: true
  validates :name, presence: true
  mount_uploader :picture, PhotoUploader


  include PgSearch

  # def self.search(search)
  #   where("name LIKE ?", "%#{search}%")
  # end


  multisearchable against: [:name, :description]
  pg_search_scope :global_search,
     against: [ :name ],
     associated_against: {
       ingredients: [ :name]
     }



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


end

# # Delete the previous articles index in Elasticsearch
# Recipe.__elasticsearch__.client.indices.delete index: Recipe.index_name rescue nil

# # Create the new index with the new mapping
# Recipe.__elasticsearch__.client.indices.create \
#   index: Recipe.index_name,
#   body: { settings: Recipe.settings.to_hash, mappings: Recipe.mappings.to_hash }

# # Index all article records from the DB to Elasticsearch
# Recipe.import
# Recipe.reindex

