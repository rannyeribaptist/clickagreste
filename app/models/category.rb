class Category < ApplicationRecord
  validates_presence_of :name, :color, :icon, :city_id 
  belongs_to :city
  
end
