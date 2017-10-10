class Review < ApplicationRecord
  belongs_to :recipe
  belongs_to :user
  validates :user, presence: true
  validates :recipe, presence: true


  validates :content, presence: true
  validates :rating, inclusion: { in: [0, 1, 2, 3, 4, 5], allow_nil: false }, numericality: { only_integer: true }

  mount_uploader :picture, PhotoUploader
end
