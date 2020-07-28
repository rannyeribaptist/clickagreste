class AddCompanyCategoriesToCompanies < ActiveRecord::Migration[6.0]
  def change
    add_column :companies, :company_categories, :string, default: [].to_yaml, array: true
  end
end
