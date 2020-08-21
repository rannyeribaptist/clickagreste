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

  self.per_page = 10

  filterrific(
    default_filter_params: { sorted_by: 'created_at_desc' },
    available_filters: [
      :sorted_by,
      :search_query,
      :city_id
    ]
  )

  scope :search_query, lambda { |query| where("name LIKE ? OR description LIKE ?", "%#{query}%", "%#{query}%") }
  scope :city_id, lambda { |city_id| where("city_id LIKE ?", "#{city_id}") }

  scope :sorted_by, lambda { |sort_option|
    direction = (sort_option =~ /desc$/) ? 'desc' : 'asc'

    case sort_option.to_s
      when /^created_at/
        order("LOWER(companies.created_at) #{ direction }")
      else
        raise(ArgumentError, "Opção inválida: #{ sort_option.inspect }")
      end
  }

  def self.options_for_sorted_by
    [
      ['Data de Registro (novos primeiro)', 'created_at_desc'],
      ['Data de Registro (antigos primeiro)', 'created_at_asc']
    ]
  end


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
