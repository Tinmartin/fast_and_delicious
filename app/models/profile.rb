class Profile < ApplicationRecord
  belongs_to :user

  mount_uploader :picture, PhotoUploader

  # def to_param
  #   name
  # end
end
