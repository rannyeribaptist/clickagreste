class City < ApplicationRecord
  validates_presence_of :name, :picture
  mount_uploader :picture, PicturesUploader
  has_many :companies, dependent: :destroy
end
