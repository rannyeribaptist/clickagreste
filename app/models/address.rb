class Address < ApplicationRecord
    validates_presence_of :street, :neighbohood, :number, :city, :complement, :zip_code 
    belongs_to :company
    
end
