class Company < ApplicationRecord
  validates_presence_of :name, :tax_id, :picture, :description, :company_categories

  serialize :company_categories, Array
  mount_uploader :picture, PicturesUploader
  mount_uploader :logo, PicturesUploader

  has_one :address, dependent: :destroy
  has_many :contact_infos, dependent: :destroy
  has_many :company_pictures, dependent: :destroy

  belongs_to :city

  accepts_nested_attributes_for :address, reject_if: :all_blank, allow_destroy: false
  accepts_nested_attributes_for :contact_infos, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :company_pictures, reject_if: :all_blank, allow_destroy: true

  # before_save :validate_presence_address
  # before_save :validate_presence_contact_info

  private

  def validate_presence_address
    if not self.address.present?
      self.errors.add(:address, "Faltou adicionar o endereço")
      throw(:abort)
    end
  end

  def validate_presence_contact_info
    if not self.contact_infos.any?
      self.errors.add(:contact_info, "Faltou adicionar algumas informações de contato")
      throw(:abort)
    end
  end
end
