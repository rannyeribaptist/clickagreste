class CompanyPicture < ApplicationRecord
  belongs_to :company
  validates_presence_of :picture
  mount_uploader :picture, PicturesUploader
end
