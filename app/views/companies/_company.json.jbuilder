json.extract! company, :id, :name, :tax_id, :picture, :description, :priority, :categories, :created_at, :updated_at
json.url company_url(company, format: :json)
