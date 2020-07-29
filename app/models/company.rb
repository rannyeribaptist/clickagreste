class Company < ApplicationRecord
  validates_presence_of :name, :tax_id, :picture, :description, :company_categories 
  serialize :company_categories, Array
  has_one :address, dependent: :destroy
  has_many :contact_infos, dependent: :destroy

  before_save :validate_presence_address
  before_save :validate_presence_contact_info
  def validate_presence_address
    if not self.address.present?
      self.errors.add(:address, "Faltou adicionar o endereço")
      throw(:abort)
    end  
  end
  
  def validate_presence_contact_info
    if not self.contact_infos.any?
      self.errors.add(:contact_info, "Faltou adicionar o endereço")
      throw(:abort)
    end  
  end
end
