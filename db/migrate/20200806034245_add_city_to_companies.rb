class AddCityToCompanies < ActiveRecord::Migration[6.0]
  def change
    add_reference :companies, :city, null: false, foreign_key: true
  end
end
