class ChangeCompanyDescriptionToText < ActiveRecord::Migration[6.0]
  def change
    change_column :companies, :description, :text
  end
end
