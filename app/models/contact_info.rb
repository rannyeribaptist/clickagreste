class ContactInfo < ApplicationRecord
  validates_presence_of :name, :icon, :contact
  belongs_to :company
end
