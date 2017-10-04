class Review < ApplicationRecord
  belongs_to :recipe

  validates :content, presence: true

  mount_uploader :photo, PhotoUploader
end
