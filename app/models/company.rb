class Company < ApplicationRecord
  serialize :company_categories, Array
end
